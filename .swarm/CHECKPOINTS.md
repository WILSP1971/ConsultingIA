# CHECKPOINTS — Propiedades estructurales (se evalúan en CADA spec)

- [ ] **C1** Todo modelo de negocio nuevo o modificado hereda de `BaseData` con sus campos estándar.
- [ ] **C2** Borrado **lógico** en entidades transaccionales (estado Activo/Inactivo), nunca DELETE físico.
- [ ] **C3** Variables sensibles (credenciales, tokens, passwords) NO van como texto plano:
      usar variables de entorno / secret manager.
- [ ] **C4** Toda SPEC tiene criterios de aceptación verificables y medibles.
- [ ] **C5** Módulos de integración no importan directamente de otros proyectos de App:
      usan contratos/adaptadores.
- [ ] **C6** Cambios sensibles (auth, pagos, datos personales, despliegue) pasan por aprobación del Lead.
- [ ] **C7** Toda lógica nueva o modificada tiene pruebas (unitarias/integración) en verde; cobertura razonable.
- [ ] **C8** El objetivo partió de un prompt optimizado y registrado en `prompt-lab/prompts/`.

> Estas reglas son la "constitución" del enjambre. BLACK PANTHER, DAREDEVIL, BLACK WIDOW y HAWKEYE las
> verifican antes de cerrar (ver `PROCESO.md`).
