---
description: Toma una captura de la pantalla y la envía a Telegram con un texto al pie.
argument-hint: <texto descriptivo de la captura>
---

Ejecuta el script de captura para enviarme al celular una imagen del estado actual:

```
powershell -ExecutionPolicy Bypass -File bridge/enviar_captura.ps1 -Caption "$ARGUMENTS"
```

Si `$ARGUMENTS` está vacío, usa un texto por defecto como "Estado del proyecto".
Después confírmame que la captura fue enviada (o el error si lo hubo).
