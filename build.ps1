# ============================================================
# Script de compilación - Generador de Firmas Chavín
# ============================================================
# Este script lee la plantilla HTML (plantilla.html) y reemplaza
# los marcadores de posición (__LOGO_SVG_BASE64__ y
# __MEDIO_AMBIENTE_BASE64__) con las imágenes codificadas
# en Base64, generando el archivo final index.html.
#
# USO:
#   Abre PowerShell en la carpeta del proyecto y ejecuta:
#   powershell -ExecutionPolicy Bypass -File .\build.ps1
# ============================================================

$currentDir = Get-Location
Write-Host "Compilando generador de firmas en: $currentDir"

# Rutas de los archivos fuente
$logoPath = Join-Path $currentDir "logo.svg"
$medioPath = Join-Path $currentDir "medio-ambiente.jpeg"
$templatePath = Join-Path $currentDir "plantilla.html"
$outputPath = Join-Path $currentDir "index.html"

# Verificar que el logo de Chavín existe
if (-not (Test-Path $logoPath)) {
    Write-Error "No se encontró el logo de Chavín en: $logoPath"
    exit 1
}

# Verificar que la imagen de medio ambiente existe
if (-not (Test-Path $medioPath)) {
    Write-Error "No se encontró la imagen de medio ambiente en: $medioPath"
    exit 1
}

# Verificar que la plantilla HTML existe
if (-not (Test-Path $templatePath)) {
    Write-Error "No se encontró la plantilla en: $templatePath"
    exit 1
}

# Leer y convertir logo.svg a Base64
Write-Host "Leyendo y convirtiendo logo.svg a Base64..."
$logoBytes = [System.IO.File]::ReadAllBytes($logoPath)
$logoBase64 = [System.Convert]::ToBase64String($logoBytes)

# Leer y convertir medio-ambiente.jpeg a Base64
Write-Host "Leyendo y convirtiendo medio-ambiente.jpeg a Base64..."
$medioBytes = [System.IO.File]::ReadAllBytes($medioPath)
$medioBase64 = [System.Convert]::ToBase64String($medioBytes)

# Leer la plantilla HTML
Write-Host "Leyendo plantilla HTML..."
$htmlContent = [System.IO.File]::ReadAllText($templatePath)

# Reemplazar los marcadores de posición con las imágenes en Base64
Write-Host "Reemplazando marcadores de posición..."
$htmlContent = $htmlContent.Replace("__LOGO_SVG_BASE64__", $logoBase64)
$htmlContent = $htmlContent.Replace("__MEDIO_AMBIENTE_BASE64__", $medioBase64)

# Guardar el archivo final index.html
Write-Host "Guardando index.html..."
[System.IO.File]::WriteAllText($outputPath, $htmlContent, [System.Text.Encoding]::UTF8)

Write-Host "¡Compilación exitosa! index.html generado."
