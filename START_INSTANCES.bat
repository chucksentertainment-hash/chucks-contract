@echo off
echo ================================================
echo ACBU Smart Contract - Starting Both Instances
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

echo Starting Instance 1...
start "ACBU Instance 1" cmd /k "cd acbu-instance-1 && echo Running Instance 1 Tests... && cargo test"

timeout /t 2 /nobreak >nul

echo Starting Instance 2...
start "ACBU Instance 2" cmd /k "cd acbu-instance-2 && echo Running Instance 2 Tests... && cargo test"

echo.
echo ================================================
echo Both instances have been launched!
echo Two new command windows are now running:
echo   - ACBU Instance 1
echo   - ACBU Instance 2
echo ================================================
echo.
pause
