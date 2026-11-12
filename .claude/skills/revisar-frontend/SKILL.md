---
name: revisar-frontend
description: >
  Procedimiento de revisión del código de cliente (UI, componentes, estado, estilos).
  Usar tras una implementación frontend de CAPTAIN AMERICA. La ejecuta DAREDEVIL.
---

# Skill: Revisar Frontend

## Pasos
1. Identifica la SPEC y la guía de UX de SPIDER-MAN; relee criterios de aceptación de UI.
2. Obtén el diff: `git diff`.
3. Revisa por dimensiones (reporta `archivo:línea` + severidad + solución):
   - **Corrección de UI**: estados carga/vacío/error, manejo de fallos de red, race conditions.
   - **Accesibilidad**: ARIA, foco, teclado, contraste, etiquetas de formularios.
   - **Rendimiento**: renders innecesarios, memoización, bundle size, lazy-load, imágenes.
   - **Estado**: fuente única de verdad, efectos controlados, limpieza de suscripciones/listeners.
   - **Seguridad cliente**: XSS, sanitización, sin secretos en el bundle (C3), CSP.
   - **Consistencia y responsive**: sistema de diseño, nomenclatura visible, móvil/escritorio.
4. Corre lint/build/typecheck del frontend si existen.
5. BLOQUEANTES → devuelve a CAPTAIN AMERICA; si limpio → habilita la fase de testing (HAWKEYE).
