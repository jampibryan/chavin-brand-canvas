# ============================================================
# Script de compilación - Panel de Activos Chavín
# ============================================================
# Este script toma las plantillas HTML del generador de firmas
# y del generador de credenciales, y las compila insertando
# las imágenes corporativas locales en formato Base64.
#
# Genera:
#   - firmas/index.html (a partir de firmas/plantilla.html)
#   - credenciales/index.html (a partir de credenciales/plantilla.html)
#
# USO:
#   Abre PowerShell en la carpeta raíz del proyecto y ejecuta:
#   powershell -ExecutionPolicy Bypass -File .\build.ps1
# ============================================================

$currentDir = Get-Location
Write-Host "Compilando activos corporativos de Chavín en: $currentDir" -ForegroundColor Cyan

# Rutas de los activos de imagen compartidos
$logoPath = Join-Path $currentDir "assets\logo.svg"
$medioPath = Join-Path $currentDir "assets\medio-ambiente.jpeg"

# Verificar que existan las imágenes
if (-not (Test-Path $logoPath)) {
    Write-Error "No se encontró el logo de Chavín en: $logoPath"
    exit 1
}
if (-not (Test-Path $medioPath)) {
    Write-Error "No se encontró la imagen de medio ambiente en: $medioPath"
    exit 1
}

# Convertir imágenes compartidas a Base64 una sola vez
Write-Host "Leyendo y convirtiendo logo.svg a Base64..." -ForegroundColor Gray
$logoBytes = [System.IO.File]::ReadAllBytes($logoPath)
$logoBase64 = [System.Convert]::ToBase64String($logoBytes)

Write-Host "Leyendo y convirtiendo medio-ambiente.jpeg a Base64..." -ForegroundColor Gray
$medioBytes = [System.IO.File]::ReadAllBytes($medioPath)
$medioBase64 = [System.Convert]::ToBase64String($medioBytes)

# --- COMPILACIÓN 1: Generador de Firmas ---
$firmaTemplate = Join-Path $currentDir "firmas\plantilla.html"
$firmaOutput = Join-Path $currentDir "firmas\index.html"

if (Test-Path $firmaTemplate) {
    Write-Host "Compilando módulo de Firmas..." -ForegroundColor Yellow
    $htmlFirmas = [System.IO.File]::ReadAllText($firmaTemplate)
    $htmlFirmas = $htmlFirmas.Replace("__LOGO_SVG_BASE64__", $logoBase64)
    $htmlFirmas = $htmlFirmas.Replace("__MEDIO_AMBIENTE_BASE64__", $medioBase64)
    [System.IO.File]::WriteAllText($firmaOutput, $htmlFirmas, [System.Text.Encoding]::UTF8)
    Write-Host "  -> Generado: firmas/index.html" -ForegroundColor Green
} else {
    Write-Warning "No se encontró la plantilla de firmas en: $firmaTemplate"
}

# --- COMPILACIÓN 2: Generador de Credenciales ---
$credTemplate = Join-Path $currentDir "credenciales\plantilla.html"
$credOutput = Join-Path $currentDir "credenciales\index.html"

if (Test-Path $credTemplate) {
    Write-Host "Compilando módulo de Credenciales..." -ForegroundColor Yellow
    $htmlCreds = [System.IO.File]::ReadAllText($credTemplate)
    $htmlCreds = $htmlCreds.Replace("__LOGO_SVG_BASE64__", $logoBase64)
    [System.IO.File]::WriteAllText($credOutput, $htmlCreds, [System.Text.Encoding]::UTF8)
    Write-Host "  -> Generado: credenciales/index.html" -ForegroundColor Green
} else {
    Write-Warning "No se encontró la plantilla de credenciales en: $credTemplate"
}

Write-Host "`n¡Compilación exitosa de todos los activos corporativos!" -ForegroundColor Cyan
