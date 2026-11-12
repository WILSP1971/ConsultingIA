---
name: probar-codigo
description: >
  Estrategia y ejecución de pruebas (unitarias, integración, e2e) para verificar
  los criterios de aceptación de una SPEC. Usar antes de cerrar. La ejecuta HAWKEYE.
---

# Skill: Probar Código

## Pirámide de pruebas
1. **Unitarias** (muchas, rápidas): lógica pura, funciones, componentes aislados.
2. **Integración** (algunas): módulos juntos, API + base de datos, contratos.
3. **End-to-end** (pocas, críticas): flujos de usuario reales / smoke de la app.

## Pasos
1. Mapea cada **criterio de aceptación** de la SPEC a al menos una prueba.
2. Escribe/actualiza pruebas con el framework del proyecto (pytest, jest, vitest, junit, etc.).
3. Ejecuta la suite y captura la **salida real**:
   ```bash
   # ejemplos según stack
   pytest -q            # Python
   npm test --silent    # Node/JS
   ```
4. Mide **cobertura** de lo nuevo (objetivo razonable: 80%+ en la lógica cambiada).
5. Si algo falla o se saltó, repórtalo explícitamente (nunca maquilles resultados).
6. Solo con todo en verde, propón mover la SPEC a `CERRADA` y avisa a IRON MAN para notificar.

## Reglas
- Pruebas deterministas (sin depender de hora/azar/orden).
- Casos felices **y** casos borde/error.
- Datos de prueba sin secretos reales (C3).
