# ACBU Smart Contract - Dual Instance Startup Script
# This script starts both instances of the ACBU smart contract in separate terminals

Write-Host "Starting ACBU Smart Contract - Dual Instance Mode" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

# Check if Rust is installed
try {
    $rustVersion = cargo --version 2>&1
    Write-Host "✓ Rust detected: $rustVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Rust not found. Please install Rust first:" -ForegroundColor Red
    Write-Host "  Visit: https://rustup.rs/" -ForegroundColor Yellow
    Write-Host "  Or run: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Launching Instance 1..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command",
    "Write-Host 'ACBU Instance 1 - Running Tests' -ForegroundColor Green; cd '$PSScriptRoot\acbu-instance-1'; cargo test"
)

Start-Sleep -Seconds 2

Write-Host "Launching Instance 2..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList @(
    "-NoExit", 
    "-Command",
    "Write-Host 'ACBU Instance 2 - Running Tests' -ForegroundColor Blue; cd '$PSScriptRoot\acbu-instance-2'; cargo test"
)

Write-Host ""
Write-Host "✓ Both instances started successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Two new PowerShell windows have been opened:" -ForegroundColor Cyan
Write-Host "  - Instance 1 (Green) - acbu-instance-1" -ForegroundColor Green
Write-Host "  - Instance 2 (Blue)  - acbu-instance-2" -ForegroundColor Blue
Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
