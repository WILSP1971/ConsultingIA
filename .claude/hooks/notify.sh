#!/usr/bin/env bash
# notify.sh — envía un mensaje a tu celular vía Telegram.
# Uso: bash .claude/hooks/notify.sh "Mensaje a enviar"
set -euo pipefail

MSG="${1:-Notificacion del enjambre}"

# Carga variables desde .env si existe (TELEGRAM_TOKEN, TELEGRAM_CHAT_ID)
if [ -f ".env" ]; then
  set -a; . ./.env; set +a
fi

if [ -z "${TELEGRAM_TOKEN:-}" ] || [ -z "${TELEGRAM_CHAT_ID:-}" ]; then
  echo "notify.sh: faltan TELEGRAM_TOKEN o TELEGRAM_CHAT_ID (se omite el aviso)." >&2
  exit 0
fi

curl -s -X POST \
  "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
  --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
  --data-urlencode "text=[ENJAMBRE] ${MSG}" > /dev/null || true
