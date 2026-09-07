@echo off
echo ================================================
echo ACBU Smart Contract - Building Both Instances
echo ================================================
echo.

REM Check if Rust is installed
where cargo >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Rust/Cargo not found!
    echo Please install Rust from: https://rustup.rs/
    echo.
    pause
    exit /b 1
)

echo [OK] Rust found
echo.

echo Building Instance 1...
start "Build ACBU Instance 1" cmd /k "cd acbu-instance-1 && cargo build --target wasm32-unknown-unknown --release"

timeout /t 2 /nobreak >nul

echo Building Instance 2...
start "Build ACBU Instance 2" cmd /k "cd acbu-instance-2 && cargo build --target wasm32-unknown-unknown --release"

echo.
echo ================================================
echo Build started for both instances!
echo Monitor progress in the two new command windows.
echo ================================================
echo.
pause
