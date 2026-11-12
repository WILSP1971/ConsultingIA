#!/usr/bin/env python3
"""
eval_prompt.py — Evalúa y compara variantes de un prompt con un LLM-juez.

Idea: ejecutas cada VARIANTE contra varios CASOS, y un modelo "juez" puntúa
la salida (0-10) según una rúbrica. Eliges la variante con mejor promedio.

Requisitos:
    pip install anthropic
    export ANTHROPIC_API_KEY=sk-ant-...
"""
import os
import re
import statistics
from anthropic import Anthropic

client = Anthropic(api_key=os.environ["ANTHROPIC_API_KEY"])

MODELO_CANDIDATO = "claude-sonnet-4-6"
MODELO_JUEZ = "claude-opus-4-8"

# 1) Variantes del prompt a comparar (usa {objetivo} como hueco)
VARIANTES = {
    "A": "Eres un ingeniero senior. {objetivo}\n"
         "Responde con un plan numerado y criterios de aceptación.",
    "B": "Contexto: proyecto con CHECKPOINTS (borrado lógico, sin secretos en claro,\n"
         "criterios verificables).\nRol: arquitecto de software.\nAcción: {objetivo}\n"
         "Formato: 1) Supuestos 2) Plan por pasos 3) Criterios de aceptación verificables.",
}

# 2) Casos de prueba representativos
CASOS = [
    "Crea el módulo de pagos con pruebas.",
    "Migra la autenticación a tokens y documenta el cambio.",
]

# 3) Rúbrica del juez
RUBRICA = (
    "Evalúa la respuesta del 0 al 10 según: (a) hace supuestos explícitos, "
    "(b) da un plan por pasos accionable, (c) define criterios de aceptación verificables, "
    "(d) considera seguridad (no secretos en claro). "
    "Responde SOLO con el número entero del puntaje."
)


def generar(prompt: str) -> str:
    r = client.messages.create(
        model=MODELO_CANDIDATO, max_tokens=1200,
        messages=[{"role": "user", "content": prompt}],
    )
    return r.content[0].text


def juzgar(objetivo: str, salida: str) -> int:
    r = client.messages.create(
        model=MODELO_JUEZ, max_tokens=10,
        messages=[{"role": "user", "content":
                   f"{RUBRICA}\n\nOBJETIVO:\n{objetivo}\n\nRESPUESTA:\n{salida}"}],
    )
    m = re.search(r"\d+", r.content[0].text)
    return int(m.group()) if m else 0


def main() -> None:
    resultados = {}
    for nombre, plantilla in VARIANTES.items():
        puntajes = []
        for caso in CASOS:
            salida = generar(plantilla.format(objetivo=caso))
            p = juzgar(caso, salida)
            puntajes.append(p)
            print(f"[Variante {nombre}] caso='{caso[:40]}...' -> {p}/10")
        resultados[nombre] = statistics.mean(puntajes)

    print("\n=== Promedios ===")
    for nombre, prom in sorted(resultados.items(), key=lambda x: -x[1]):
        print(f"  Variante {nombre}: {prom:.2f}/10")
    ganadora = max(resultados, key=resultados.get)
    print(f"\nGANADORA: Variante {ganadora}  ->  guárdala en prompt-lab/prompts/")


if __name__ == "__main__":
    main()
