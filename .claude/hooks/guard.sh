#!/usr/bin/env bash
# guard.sh — bloquea comandos destructivos y avisa al Lead.
# Claude Code pasa el contexto del evento por stdin (JSON). Buscamos patrones peligrosos.
set -euo pipefail

INPUT="$(cat || true)"

# Patrones considerados sensibles/destructivos
PELIGRO="$(printf '%s' "$INPUT" | grep -oiE 'rm -rf|DROP TABLE|DROP DATABASE|DELETE FROM|TRUNCATE|push --force|--force-with-lease|mkfs|:>[[:space:]]' || true)"

if [ -n "$PELIGRO" ]; then
  bash "$(dirname "$0")/notify.sh" "BLOQUEADO: intento de operacion sensible ('${PELIGRO}'). Requiere aprobacion del Lead." || true
  # Devuelve decisión de bloqueo a Claude Code
  echo '{"decision":"block","reason":"Operacion sensible detectada. Pide aprobacion explicita al Lead antes de continuar."}'
  exit 0
fi

exit 0
