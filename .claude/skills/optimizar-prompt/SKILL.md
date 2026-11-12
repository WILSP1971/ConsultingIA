---
name: optimizar-prompt
description: >
  Analiza y optimiza el prompt/objetivo inicial antes de empezar a trabajar.
  Usar como PRIMER paso ante una petición nueva, o cuando un resultado salió
  desviado por una instrucción ambigua. La ejecuta XAVIER.
---

# Skill: Optimizar Prompt

## Por qué
El 80% de los resultados flojos vienen de un prompt inicial ambiguo. Optimizarlo
primero es la mejor inversión del proyecto.

## Pasos
1. **Captura** el objetivo en bruto del Lead.
2. **Analiza** con el marco C.R.A.F.T.: Contexto · Rol · Acción · Formato · Tests/criterios.
3. **Detecta** ambigüedades, supuestos peligrosos y huecos de información (lista de máx. 3 preguntas).
4. **Reescribe** el prompt estructurado y guárdalo en `prompt-lab/prompts/PROMPT-XXX.md`.
5. **Evalúa variantes** (opcional pero recomendado para tareas grandes):
   - Define 2-3 variantes del prompt.
   - Córrelas en el laboratorio: `promptfoo eval` (ver `prompt-lab/promptfoo.yaml`)
     o el notebook `prompt-lab/eval_prompt.ipynb`.
   - Compara contra los casos de prueba y elige la ganadora con evidencia.
6. **Entrega** el prompt ganador a DOCTOR STRANGE para la SPEC.

## Plantilla de prompt optimizado
```markdown
# PROMPT-XXX — <título>
## Contexto
## Rol (qué experto/agente lo resuelve)
## Acción (verbo único y medible)
## Restricciones (CHECKPOINTS aplicables)
## Formato de salida esperado
## Criterios de éxito (verificables)
## Preguntas abiertas para el Lead
```

## Herramientas de evaluación sugeridas
- **promptfoo** (CLI, open source): compara variantes con asserts automáticos.
- **Notebook de evals** (Jupyter): `prompt-lab/eval_prompt.ipynb`, puntúa con un LLM-juez.
- **Anthropic Console / Prompt Improver**: refina y prueba prompts de forma interactiva.
