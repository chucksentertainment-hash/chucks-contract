@echo off
echo ================================================
echo RUNNING SMART CONTRACTS - DUAL INSTANCES
echo ================================================
echo.
echo This will compile and run all 8 Soroban smart contracts
echo in both instances simultaneously.
echo.
echo Smart Contracts in Each Instance:
echo   1. acbu_minting      - Mint ACBU tokens
echo   2. acbu_burning      - Burn/redeem ACBU
echo   3. acbu_oracle       - Price oracle
echo   4. acbu_reserve_tracker - Reserve tracking
echo   5. acbu_savings_vault - Savings accounts
echo   6. acbu_lending_pool - P2P lending
echo   7. acbu_escrow       - Escrow service
echo   8. acbu_multisig     - Multi-signature auth
echo.
echo ================================================
echo.

REM Check if Rust is installed
where cargo >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Rust not found!
    echo.
    echo To run smart contracts, you need Rust installed:
    echo   1. Visit: https://rustup.rs/
    echo   2. Download and install Rust
    echo   3. Run: rustup target add wasm32-unknown-unknown
    echo   4. Then run this script again
    echo.
    pause
    exit /b 1
)

echo [OK] Rust found - Starting smart contracts...
echo.
echo ================================================
echo CHUCKS CONTRACT 1 - Starting...
echo ================================================
start "Chucks Contract 1" cmd /k "cd chucks-contract-1 && echo [Chucks Contract 1] Compiling 8 smart contracts... && cargo test --all"

timeout /t 3 /nobreak >nul

echo.
echo ================================================
echo CHUCKS CONTRACT 2 - Starting...
echo ================================================
start "Chucks Contract 2" cmd /k "cd chucks-contract-2 && echo [Chucks Contract 2] Compiling 8 smart contracts... && cargo test --all"

echo.
echo ================================================
echo Both Chucks Contract instances are now running!
echo.
echo Two windows opened:
echo   - Chucks Contract 1
echo   - Chucks Contract 2
echo.
echo What's happening:
echo   1. Compiling all contracts (first time: 5-10 min)
echo   2. Running comprehensive tests
echo   3. Displaying results in each window
echo.
echo You can:
echo   - Watch the compilation progress
echo   - See test results
echo   - Each instance runs independently
echo ================================================
echo.
pause
