# ACBU Smart Contract - Instance 1

## 8 Soroban Smart Contracts

This instance contains the complete ACBU smart contract suite:

### Contracts:
1. **acbu_minting** - Mint ACBU from USDC/fiat deposits
2. **acbu_burning** - Burn ACBU to redeem fiat/tokens
3. **acbu_oracle** - Aggregate exchange rates from validators
4. **acbu_reserve_tracker** - Track and verify reserve balances
5. **acbu_savings_vault** - Interest-bearing savings accounts
6. **acbu_lending_pool** - Peer-to-peer ACBU lending
7. **acbu_escrow** - Conditional and time-locked transfers
8. **acbu_multisig** - M-of-N threshold authorization

### Quick Start:
```bash
# Build all contracts
cargo build --target wasm32-unknown-unknown --release

# Run tests
cargo test

# Build specific contract
cd acbu_minting && cargo build --release
```

### Requirements:
- Rust 1.88.0+
- wasm32-unknown-unknown target
- Soroban CLI (for deployment)
