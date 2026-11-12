#!/usr/bin/env bash
# banner.sh — logo del enjambre al iniciar la sesión.
# Emblema grafico (chafa, limpio) + titulo/agentes en texto ANSI (siempre legible).
# Para el emblema grafico:  sudo apt install -y chafa

GOLD='\033[38;2;249;200;53m'; RED='\033[1;31m'; DIM='\033[2;37m'; RESET='\033[0m'

DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/../.." 2>/dev/null && pwd)"
# emblema cuadrado y grueso (sin flecha) -> se ve nitido a baja resolucion
EMBLEMA="$DIR/assets/logo_icon.png"
[ -f "$EMBLEMA" ] || EMBLEMA="$DIR/assets/logo.png"   # respaldo

echo ""
if command -v chafa >/dev/null 2>&1 && [ -f "$EMBLEMA" ]; then
  chafa -c full -w 9 --size=28x14 "$EMBLEMA" 2>/dev/null
elif command -v figlet >/dev/null 2>&1; then
  printf "${GOLD}"; figlet -f standard "AVENGERS"; printf "${RESET}"
fi

echo -e "${GOLD}  AVENGERS SWARM${RESET}  ${DIM}- Orquestador: IRON MAN (Tony Stark)${RESET}"
echo -e "${DIM}  PROFESSOR X · DOCTOR STRANGE · CAPTAIN AMERICA · SPIDER-MAN · BLACK PANTHER${RESET}"
echo -e "${DIM}  DAREDEVIL · WOLVERINE · HAWKEYE · BLACK WIDOW · QUICKSILVER · THOR${RESET}"
echo -e "${DIM}  Di 'APROBADO SPEC-XXX' para aprobar, 'Estado' para el tablero.${RESET}"
echo ""
