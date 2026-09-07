# ACBU Smart Contract - Dual Build Script
# This script builds both instances simultaneously

Write-Host "Building Both ACBU Smart Contract Instances" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Rust is installed
try {
    $rustVersion = cargo --version 2>&1
    Write-Host "✓ Rust detected: $rustVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Rust not found. Please install Rust first:" -ForegroundColor Red
    Write-Host "  Visit: https://rustup.rs/" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Building Instance 1..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command",
    "Write-Host 'Building ACBU Instance 1' -ForegroundColor Green; cd '$PSScriptRoot\acbu-instance-1'; cargo build --target wasm32-unknown-unknown --release"
)

Start-Sleep -Seconds 2

Write-Host "Building Instance 2..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command", 
    "Write-Host 'Building ACBU Instance 2' -ForegroundColor Blue; cd '$PSScriptRoot\acbu-instance-2'; cargo build --target wasm32-unknown-unknown --release"
)

Write-Host ""
Write-Host "✓ Build started for both instances!" -ForegroundColor Green
Write-Host ""
Write-Host "Monitor the build progress in the two new terminal windows." -ForegroundColor Cyan
Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
