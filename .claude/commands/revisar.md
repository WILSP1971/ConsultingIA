---
description: Ejecuta la revisión completa del cambio actual (backend, frontend, seguridad y tests).
---

Coordina la fase de revisión del PROCESO sobre el diff actual (`git diff`):

1. **BLACK PANTHER** → revisión backend (skill `revisar-backend`).
2. **DAREDEVIL** → revisión frontend (skill `revisar-frontend`), si hay UI.
3. **BLACK WIDOW** → auditoría de seguridad y secretos.
4. **HAWKEYE** → ejecuta las pruebas (skill `probar-codigo`) y reporta cobertura.

Consolida los hallazgos por severidad (BLOQUEANTE / IMPORTANTE / MENOR). Si hay
BLOQUEANTES, devuelve a CAPTAIN AMERICA con instrucciones. Si todo está limpio, dime que la
SPEC puede pasar a EN_VERIFICACIÓN y notifícalo.
