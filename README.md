# Generador de Firmas Chavín

Programa interactivo diseñado para generar y personalizar las firmas de correo institucional de **Agrícola y Ganadera Chavín de Huantar S.A.** de manera sencilla y rápida.

Funciona directamente en cualquier navegador web y está completamente auto-contenido (no necesita servidor ni instalación).

---

## 🚀 Cómo utilizar el programa

1. **Abrir el generador:**
   * Haz doble clic sobre el archivo `index.html` para abrirlo en tu navegador favorito (Google Chrome, Microsoft Edge, Mozilla Firefox o Safari).

2. **Personalizar la información:**
   * **Nombre Completo:** Escribe tu nombre tal como quieres que aparezca.
   * **Cargo / Puesto:** Escribe tu puesto de trabajo.
   * **Número de Celular:** Ingresa el número telefónico. 
     > ⚠️ **Nota:** Este número es temporal. Por seguridad y privacidad, no se guardará en el navegador y se borrará si cierras o recargas la pestaña del programa.

3. **Elegir el formato de descarga:**
   * En el selector de formato, elige cómo quieres descargar la firma:
     * **PNG:** Formato de alta calidad sin pérdida de detalles (Recomendado).
     * **JPG:** Formato comprimido estándar.
     * **WebP:** Formato moderno optimizado para web con compresión avanzada.

4. **Descargar la firma como imagen:**
   * Haz clic en el botón **Descargar Firma**. El programa convertirá tu firma en una imagen de alta resolución y la descargará en la carpeta de descargas de tu computadora.

5. **Copiar la firma en formato HTML:**
   * Si en lugar de una imagen necesitas el código HTML para pegarlo directamente en Outlook, Gmail u otro gestor de correo, haz clic en el botón **Copiar Código HTML**. Esto copiará el código del diseño al portapapeles para que puedas pegarlo directamente en la configuración de firmas de tu correo.

---

## 📂 Estructura del Proyecto

| Archivo               | Descripción                                                                                                                                           |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `index.html`          | La aplicación interactiva final. Contiene las imágenes embebidas en Base64 para funcionar sin problemas de seguridad al abrirlo localmente.          |
| `plantilla.html`      | La plantilla fuente del generador. Contiene marcadores (`__LOGO_SVG_BASE64__` y `__MEDIO_AMBIENTE_BASE64__`) que se reemplazan al compilar.          |
| `logo.svg`            | Logotipo corporativo vectorizado de Chavín.                                                                                                           |
| `medio-ambiente.jpeg` | Banner del cuidado del medio ambiente.                                                                                                                |
| `build.ps1`           | Script de compilación en PowerShell. Toma la plantilla y las imágenes, y genera `index.html` con todo embebido.                                      |
| `README.md`           | Este archivo de documentación.                                                                                                                        |

---

## 🔧 Recompilar el proyecto

Si cambias las imágenes (`logo.svg` o `medio-ambiente.jpeg`) o editas la plantilla (`plantilla.html`), necesitas regenerar `index.html`.

Abre PowerShell en la carpeta del proyecto y ejecuta:

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

Esto regenerará el archivo `index.html` con las imágenes actualizadas embebidas en Base64.
