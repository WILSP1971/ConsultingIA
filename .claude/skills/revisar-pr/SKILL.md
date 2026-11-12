---
name: revisar-pr
description: >
  Procedimiento de revisión de cambios contra una SPEC y los CHECKPOINTS. Usar
  cuando CAPTAIN AMERICA termina una implementación o antes de cerrar una SPEC.
---

# Skill: Revisar PR / diff

## Pasos
1. Identifica la SPEC asociada y relee sus criterios de aceptación.
2. Obtén el diff: `git diff` (o el diff del PR).
3. Revisa por dimensiones:
   - **Corrección**: bordes, errores, valores nulos, concurrencia.
   - **Alcance**: ¿hay cambios fuera de la SPEC? (fuga de alcance = hallazgo).
   - **CHECKPOINTS**: C1 BaseData, C2 borrado lógico, C3 sin secretos en claro, C4 criterios, C5 integraciones.
   - **Calidad**: duplicación, código muerto, nombres, tests.
4. Clasifica cada hallazgo: BLOQUEANTE / IMPORTANTE / MENOR, con `archivo:línea`.
5. Si hay BLOQUEANTES, devuelve a CAPTAIN AMERICA con instrucciones; si no, propón pasar a verificación (HAWKEYE).
