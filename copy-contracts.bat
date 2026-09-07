@echo off
echo Copying smart contracts to both instances...
echo.

REM Copy all 8 contracts and shared library to Instance 1
echo Copying to smart-contract-1...
xcopy acbu-smart-contract\acbu_burning smart-contract-1\acbu_burning\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_escrow smart-contract-1\acbu_escrow\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_lending_pool smart-contract-1\acbu_lending_pool\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_multisig smart-contract-1\acbu_multisig\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_oracle smart-contract-1\acbu_oracle\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_reserve_tracker smart-contract-1\acbu_reserve_tracker\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_savings_vault smart-contract-1\acbu_savings_vault\ /E /I /H /Y >nul
xcopy acbu-smart-contract\shared smart-contract-1\shared\ /E /I /H /Y >nul

REM Copy essential root files to Instance 1
copy acbu-smart-contract\Cargo.toml smart-contract-1\ >nul
copy acbu-smart-contract\rust-toolchain.toml smart-contract-1\ >nul
copy acbu-smart-contract\build.rs smart-contract-1\ >nul
copy acbu-smart-contract\soroban_token_contract.wasm smart-contract-1\ >nul

echo Instance 1 complete!
echo.

REM Copy all 8 contracts and shared library to Instance 2
echo Copying to smart-contract-2...
xcopy acbu-smart-contract\acbu_minting smart-contract-2\acbu_minting\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_burning smart-contract-2\acbu_burning\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_escrow smart-contract-2\acbu_escrow\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_lending_pool smart-contract-2\acbu_lending_pool\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_multisig smart-contract-2\acbu_multisig\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_oracle smart-contract-2\acbu_oracle\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_reserve_tracker smart-contract-2\acbu_reserve_tracker\ /E /I /H /Y >nul
xcopy acbu-smart-contract\acbu_savings_vault smart-contract-2\acbu_savings_vault\ /E /I /H /Y >nul
xcopy acbu-smart-contract\shared smart-contract-2\shared\ /E /I /H /Y >nul

REM Copy essential root files to Instance 2
copy acbu-smart-contract\Cargo.toml smart-contract-2\ >nul
copy acbu-smart-contract\rust-toolchain.toml smart-contract-2\ >nul
copy acbu-smart-contract\build.rs smart-contract-2\ >nul
copy acbu-smart-contract\soroban_token_contract.wasm smart-contract-2\ >nul

echo Instance 2 complete!
echo.
echo ================================================
echo Smart contracts copied to both instances!
echo ================================================
pause
