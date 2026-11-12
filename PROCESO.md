# PROCESO — Ciclo de vida de una tarea en el Enjambre

Este es el pipeline que IRON MAN orquesta para CADA objetivo. Ninguna fase se salta;
las puertas marcadas con 🔒 requieren aprobación del Lead humano.

```
0. OPTIMIZAR PROMPT     XAVIER    Analiza intención, evalúa variantes (prompt-lab/).
   │
1. ESPECIFICAR          DOCTOR STRANGE     Escribe la SPEC + criterios verificables + ADR si aplica.
   │
   🔒 APROBACIÓN DEL LEAD  ───────  "APROBADO SPEC-XXX"  (notifica a Telegram)
   │
2. DISEÑAR (si hay UI)  SPIDER-MAN  Flujos, UX, accesibilidad, nomenclatura.
   │
3. IMPLEMENTAR          CAPTAIN AMERICA       Código dentro del alcance, commits pequeños.
   │
4. REVISAR BACKEND      BLACK PANTHER      Corrección, datos, API, rendimiento, seguridad servidor.
4. REVISAR FRONTEND     DAREDEVIL    UI, a11y, estado, rendimiento, seguridad cliente.
   │   (en paralelo; BLOQUEANTES vuelven a CAPTAIN AMERICA)
5. SEGURIDAD            BLACK WIDOW     Sin secretos en claro (C3), authz, superficie de ataque.
   │
6. PROBAR               HAWKEYE      Unitarias + integración + e2e; cobertura; salida real.
   │
   🔒 VERIFICAR Y CERRAR   ───────  EN_VERIFICACIÓN → CERRADA  (notifica a Telegram)
   │
7. DESPLEGAR (opcional) QUICKSILVER      Solo con 🔒 aprobación; plan + rollback + smoke.
```

## Definition of Done (una SPEC no se cierra sin esto)
- [ ] Prompt inicial optimizado y registrado (`prompt-lab/prompts/`).
- [ ] SPEC aprobada por el Lead.
- [ ] Implementación dentro del alcance de la SPEC.
- [ ] Revisión backend (BLACK PANTHER) sin BLOQUEANTES.
- [ ] Revisión frontend (DAREDEVIL) sin BLOQUEANTES (si hay UI).
- [ ] Auditoría de seguridad (BLACK WIDOW) sin secretos expuestos.
- [ ] Pruebas en verde con cobertura razonable de lo cambiado (HAWKEYE).
- [ ] Todos los CHECKPOINTS aplicables verificados.
- [ ] Cambios versionados en Git con mensaje claro; ADR si hubo decisión técnica.
- [ ] Notificación enviada al Lead (Telegram).

## Roles por fase (resumen)
| Fase | Agente | Entregable |
|---|---|---|
| Optimizar prompt | XAVIER | Prompt optimizado + evaluación |
| Especificar | DOCTOR STRANGE | SPEC + ADR |
| Diseñar | SPIDER-MAN | Guía de UX |
| Implementar | CAPTAIN AMERICA | Código |
| Revisar backend | BLACK PANTHER | Informe de hallazgos |
| Revisar frontend | DAREDEVIL | Informe de hallazgos |
| Seguridad | BLACK WIDOW | Auditoría |
| Probar | HAWKEYE | Suite de pruebas + resultados |
| Desplegar | QUICKSILVER | Release + rollback |
