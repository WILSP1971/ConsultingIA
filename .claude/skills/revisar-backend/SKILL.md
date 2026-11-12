---
name: revisar-backend
description: >
  Procedimiento de revisión del código de servidor (APIs, base de datos, jobs,
  integraciones). Usar tras una implementación backend de CAPTAIN AMERICA. La ejecuta BLACK PANTHER.
---

# Skill: Revisar Backend

## Pasos
1. Identifica la SPEC y relee criterios de aceptación del lado servidor.
2. Obtén el diff: `git diff`.
3. Revisa por dimensiones (reporta `archivo:línea` + severidad + solución):
   - **Corrección**: bordes, nulls, idempotencia, transacciones atómicas.
   - **Datos**: borrado lógico (C2), herencia BaseData (C1), migraciones reversibles, índices.
   - **API/contratos**: validación de entrada, versionado, códigos HTTP, paginación, errores.
   - **Rendimiento**: N+1, consultas pesadas, timeouts, reintentos, cache.
   - **Seguridad**: inyección, authz por endpoint, secretos fuera del código (C3).
   - **Observabilidad**: logs útiles sin datos sensibles, trazas, métricas.
4. Corre análisis estático/linters del stack si existen.
5. BLOQUEANTES → devuelve a CAPTAIN AMERICA; si limpio → habilita la fase de testing (HAWKEYE).
