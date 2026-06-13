# Launch the TorchCode JupyterLab notebook environment.
# Usage:  powershell -ExecutionPolicy Bypass -File .\run_notebook.ps1
$ErrorActionPreference = "Stop"
$repo = $PSScriptRoot
$vpy  = Join-Path $repo ".venv\Scripts\python.exe"

# Render box-drawing chars in status() correctly, and keep all progress in ONE file
$env:PYTHONIOENCODING = "utf-8"
$env:PROGRESS_PATH    = Join-Path $repo "data\progress.json"

Write-Host "Progress file: $env:PROGRESS_PATH"
Write-Host "Starting JupyterLab on http://127.0.0.1:8888 ..."

& $vpy -m jupyter lab `
    --no-browser `
    --ServerApp.ip=127.0.0.1 `
    --ServerApp.port=8888 `
    --ServerApp.root_dir="$repo"
