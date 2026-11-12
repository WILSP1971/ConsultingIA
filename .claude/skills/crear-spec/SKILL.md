---
name: crear-spec
description: >
  Procedimiento para convertir un objetivo en una SPEC válida. Usar cuando el
  usuario pide una funcionalidad nueva o DOCTOR STRANGE necesita formalizar trabajo.
---

# Skill: Crear SPEC

## Pasos
1. Lee `.swarm/CHECKPOINTS.md` y el siguiente número disponible en `.swarm/specs.json`.
2. Crea `.swarm/specs/SPEC-XXX.md` con esta plantilla:
   - **Título** y **ID**.
   - **Objetivo** (1-2 frases) y **Contexto**.
   - **Requisitos funcionales** y **no funcionales**.
   - **Criterios de aceptación** (lista verificable, medible).
   - **Riesgos** y **Dependencias**.
   - **Agente responsable** y colaboradores.
3. Estado inicial = `PROPUESTA`. Incrementa contadores en `specs.json` y añade la entrada al array `specs`.
4. Si hay decisión arquitectónica, crea también un ADR.
5. Devuelve un resumen de máximo 5 líneas para que IRON MAN lo presente al Lead.

## Plantilla mínima de SPEC
```markdown
# SPEC-XXX — <título>
- Estado: PROPUESTA · Responsable: CAPTAIN AMERICA · Prioridad: MEDIA
## Objetivo
## Contexto
## Requisitos funcionales
## Requisitos no funcionales
## Criterios de aceptación
- [ ] ...
## Riesgos y dependencias
```
