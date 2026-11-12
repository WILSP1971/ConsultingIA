---
name: desplegar
description: >
  Procedimiento de despliegue seguro y reversible. Usar cuando una SPEC está
  verificada y el Lead aprueba el despliegue. Lo ejecuta QUICKSILVER.
---

# Skill: Desplegar

## Pasos
1. Verifica que la SPEC está `EN_VERIFICACION`/`CERRADA` y los tests pasan (HAWKEYE).
2. Prepara el **plan de despliegue**: entorno, cambios, plan de rollback.
3. Presenta el plan al Lead y **ESPERA** "APROBADO". Notifica el inicio a Telegram.
4. Ejecuta el despliegue (build → release). Si algo falla, ejecuta rollback y avisa.
5. Verifica salud post-deploy (smoke test). Notifica el resultado a Telegram.
6. Documenta: versión, fecha, autor, resultado. Crea/actualiza el ADR si cambió la infra.

## Reglas
- Nunca despliegues sin aprobación explícita del Lead.
- Toda operación irreversible requiere confirmación adicional.
