# Agente organizador de Obsidian

Agente local especializado que usa Codex CLI y tu sesion de ChatGPT. Incluye iniciador, programa y reglas; no es solo un prompt. Necesita conexion a internet y acceso disponible al modelo en Codex.

## Uso

1. Abre `Iniciar agente.cmd` con doble clic.
2. Elige una etapa cerrada dentro de tu vault. Cancelar cierra sin organizar.
3. Al elegir la carpeta comienza el trabajo: se guarda un respaldo y se abre una sesion del agente, que lee, clasifica, separa notas, ajusta enlaces y crea el indice segun `instrucciones.md`.
4. Responde en esa ventana cuando el agente encuentre una ambiguedad. Codex puede mostrar permisos propios de su entorno.

La carpeta seleccionada sera el espacio de escritura. El motor conserva su sandbox; las restricciones de lectura fuera del alcance tambien dependen de las instrucciones. No se garantiza un aislamiento tecnico de lectura de todo el vault.

Antes de modificar notas se copia la carpeta a `Respaldos` junto al programa, fuera del vault. No se incluyen .git ni .obsidian. Si no se puede crear el respaldo, no se inicia el agente. El respaldo permite recuperar el estado anterior; restaurarlo no es automatico.

No organiza la raiz entera del vault. Rechaza enlaces simbolicos y uniones dentro del alcance. No se necesitan bibliotecas Python adicionales. Usa Python 3.12 y la instalacion de Codex CLI encontrada en este equipo. Los permisos, limites y disponibilidad del modelo dependen de tu sesion Codex.

## Comprobacion sin aplicar

Ejecuta `py -3.12 agente.py --comprobar` desde esta carpeta. Comprueba el programa, la version de Codex, la sesion y la ejecucion real de un comando dentro del sandbox en una carpeta temporal; no abre notas ni llama al modelo.

Para salir de una sesion usa Ctrl+C. Si interrumpes una organizacion, puede haber cambios parciales: conserva el respaldo y revisa antes de volver a iniciarla.

Referencia del motor: https://developers.openai.com/codex/cli/reference/

## Reparacion del arranque

El agente usa por sesion `windows.sandbox="unelevated"`, el fallback documentado de Windows para fallos del setup elevado. Conserva `workspace-write` y las aprobaciones `on-request`. No modifica la configuracion global de Codex. Este fallback aplica limites de escritura con un token restringido; tiene aislamiento de red mas debil y no admite rutas con lectura denegada. El aislamiento nativo MXC no esta disponible en este equipo.

Antes de respaldar o iniciar el modelo se ejecuta una comprobacion real del sandbox en el directorio elegido, que solo imprime un marcador y no lee ni modifica notas. Si falla, el agente se detiene antes de organizar.

La terminal abierta antes de esta reparacion conserva la configuracion anterior. Sal de esa sesion y vuelve a abrir `Iniciar agente.cmd`.

Documentacion oficial: https://learn.chatgpt.com/docs/windows/windows-sandbox
