# Panel de Activos Corporativos — Chavín

Este proyecto es una suite interactiva de herramientas web para la generación y personalización de recursos de marca de **Agrícola y Ganadera Chavín de Huantar S.A.**

El proyecto está diseñado como una aplicación web portable y auto-contenida que funciona directamente en cualquier navegador web moderno sin necesidad de servidores ni instalaciones adicionales.

---

## 📂 Estructura del Proyecto

* **[index.html](file:///c:/Disco%20D/PROYECTOS/firma/index.html):** Panel principal (Dashboard) para acceder a las diferentes herramientas.
* **[firmas/index.html](file:///c:/Disco%20D/PROYECTOS/firma/firmas/index.html):** Generador interactivo de firmas de correo electrónico.
* **[credenciales/index.html](file:///c:/Disco%20D/PROYECTOS/firma/credenciales/index.html):** Generador de fotochecks e identificaciones para el personal.
* **[assets/](file:///c:/Disco%20D/PROYECTOS/firma/assets):** Carpeta de recursos compartidos (logotipo corporativo y banner ambiental).
* **[build.ps1](file:///c:/Disco%20D/PROYECTOS/firma/build.ps1):** Script de automatización en PowerShell que procesa las imágenes y las embebe en Base64 dentro del código final para evitar problemas de seguridad del navegador (CORS).

---

## 🛠️ Herramientas Incluidas

### 1. Generador de Firmas de Correo
Permite crear la firma institucional con los datos dinámicos del colaborador:
* **Nombre completo y Cargo.**
* **Número de celular temporal** (volátil, se borra al actualizar).
* **Campos corporativos fijos** (razón social, dirección, banner ecológico).
* Descarga de imagen en alta resolución en formato **PNG, JPG o WebP**.
* Botón **Copiar Código HTML** para pegarla directamente en la configuración de Outlook, Gmail u otros clientes.

### 2. Generador de Credenciales y Fotochecks (Nuevo)
Permite diseñar credenciales de identificación listas para imprimir:
* Campos de texto: **Nombre completo, Cargo, Área/Departamento y DNI**.
* **Carga de foto de perfil** desde el dispositivo (recortada y adaptada automáticamente).
* **Generación automática de Código QR** que contiene la ficha de datos del empleado.
* Selección de orientación en tiempo real:
  * **Vertical**: Formato clásico de fotocheck con banda azul superior y foto de perfil centrada.
  * **Horizontal**: Formato tipo tarjeta de presentación, con la banda azul orientada verticalmente a la izquierda (cubriendo hasta la mitad de la foto de perfil) y la información de contacto y QR a la derecha sobre fondo claro.
* Exportación a escala 4x (alta resolución para impresión) en **PNG, JPG o WebP**.

---

## 🚀 Cómo utilizar la suite

1. Haz doble clic sobre el archivo **[index.html](file:///c:/Disco%20D/PROYECTOS/firma/index.html)** en la raíz del proyecto.
2. Selecciona la herramienta que deseas utilizar (Firmas o Credenciales).
3. Rellena los datos en el panel izquierdo.
4. Observa el resultado en tiempo real en la vista previa del panel derecho.
5. Elige el formato y descarga tu recurso listo para usar.

---

## ⚙️ Modificación y Recompilación

Si cambias los archivos fuente o editas las plantillas:
1. Las plantillas editables son **`firmas/plantilla.html`** y **`credenciales/plantilla.html`**.
2. Las imágenes fuente están en la carpeta **`assets/`**.
3. Una vez realizados los cambios, abre PowerShell en la raíz del proyecto y ejecuta el script de compilación para actualizar los archivos de producción:

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

Esto generará automáticamente los archivos actualizados `index.html` correspondientes en las carpetas `firmas/` y `credenciales/`.
