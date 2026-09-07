@echo off
echo ================================================
echo BUILDING SMART CONTRACTS - DUAL INSTANCES
echo ================================================
echo.
echo Building all 8 Soroban smart contracts to WASM
echo This compiles without running tests
echo.
echo ================================================
echo.

REM Check if Rust is installed
where cargo >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Rust not found!
    echo Install from: https://rustup.rs/
    pause
    exit /b 1
)

echo [OK] Rust found - Building smart contracts...
echo.
echo ================================================
echo CHUCKS CONTRACT 1 - Building WASM contracts...
echo ================================================
start "Build Chucks Contract 1" cmd /k "cd chucks-contract-1 && echo Building 8 contracts to WASM... && cargo build --target wasm32-unknown-unknown --release"

timeout /t 3 /nobreak >nul

echo.
echo ================================================
echo CHUCKS CONTRACT 2 - Building WASM contracts...
echo ================================================
start "Build Chucks Contract 2" cmd /k "cd chucks-contract-2 && echo Building 8 contracts to WASM... && cargo build --target wasm32-unknown-unknown --release"

echo.
echo ================================================
echo Building smart contracts in both instances!
echo.
echo Output will be in:
echo   chucks-contract-1/target/wasm32-unknown-unknown/release/
echo   chucks-contract-2/target/wasm32-unknown-unknown/release/
echo.
echo Contracts being built:
echo   - acbu_minting.wasm
echo   - acbu_burning.wasm
echo   - acbu_oracle.wasm
echo   - acbu_reserve_tracker.wasm
echo   - acbu_savings_vault.wasm
echo   - acbu_lending_pool.wasm
echo   - acbu_escrow.wasm
echo   - acbu_multisig.wasm
echo ================================================
echo.
pause
