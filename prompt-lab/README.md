# prompt-lab — Análisis y optimización de prompts

Aquí XAVIER (Professor X) analiza el objetivo inicial, genera variantes de prompt y
las **evalúa con evidencia** antes de que el enjambre empiece a trabajar.

## Contenido
- `prompts/` — prompts optimizados versionados (`PROMPT-XXX.md`).
- `promptfoo.yaml` — configuración para comparar variantes con [promptfoo](https://promptfoo.dev).
- `eval_prompt.ipynb` — notebook Jupyter: puntúa variantes con un LLM-juez.
- `eval_prompt.py` — la misma evaluación como script (sin notebook).

## Opción A — promptfoo (rápido, CLI)
```bash
npm install -g promptfoo
export ANTHROPIC_API_KEY=sk-ant-...
cd prompt-lab
promptfoo eval -c promptfoo.yaml
promptfoo view            # abre el comparador visual
```

## Opción B — Notebook de evals
```bash
pip install anthropic jupyter
export ANTHROPIC_API_KEY=sk-ant-...
jupyter notebook prompt-lab/eval_prompt.ipynb
```

## Opción C — Script
```bash
pip install anthropic
export ANTHROPIC_API_KEY=sk-ant-...
python prompt-lab/eval_prompt.py
```

## Flujo recomendado
1. XAVIER escribe 2-3 variantes del prompt para el objetivo.
2. Defines casos de prueba (entradas representativas + criterios).
3. Evalúas con A, B o C. Eliges la variante ganadora con datos, no por intuición.
4. Guardas la ganadora en `prompts/` y se la entregas a DOCTOR STRANGE.
