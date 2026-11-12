# PROMPT-002 — health-check endpoint en el puente Telegram

## Contexto
El enjambre dispone de un puente Telegram (`bridge/telegram_bridge.py`) que actúa
como servicio Python long-running. Actualmente no expone ningún endpoint HTTP.
Se requiere agregar un servidor FastAPI mínimo (en un hilo/tarea separada)
dentro del mismo proceso para que monitores externos puedan verificar que el
servicio está vivo.

## Rol (agente)
CAPTAIN AMERICA — implementador Python.

## Acción
Agregar al archivo `bridge/telegram_bridge.py` un servidor HTTP en `0.0.0.0:8000`
(configurable por variable de entorno `HEALTH_PORT`, default `8000`) con la ruta:

```
GET /health  →  200 OK  →  {"status": "ok"}
```

El servidor debe arrancar en un hilo daemon (o tarea asyncio) para no bloquear
el loop principal del bridge. Si FastAPI aún no está en `requirements.txt`,
agregarlo junto con `uvicorn[standard]`.

## Restricciones (CHECKPOINTS)
- C1: No introducir secretos en texto plano.
- C5: El puerto debe ser configurable vía variable de entorno.
- El endpoint NO requiere autenticación (es solo health, sin datos sensibles).
- No romper el comportamiento actual del puente Telegram.

## Formato de salida esperado
- `bridge/telegram_bridge.py` modificado con la ruta `/health`.
- `requirements.txt` actualizado con `fastapi` y `uvicorn[standard]`.
- Instrucción breve en `README.md` sobre el nuevo endpoint.

## Criterios de éxito (verificables por HAWKEYE)
1. `curl http://localhost:8000/health` devuelve `{"status":"ok"}` con HTTP 200.
2. El bridge Telegram sigue procesando mensajes mientras el endpoint responde.
3. Sin secretos expuestos. Sin tests rotos.
4. Tiempo de respuesta < 500 ms en condiciones normales.

## Preguntas abiertas para el Lead
_Ninguna. Todas resueltas en la sesión de análisis._
