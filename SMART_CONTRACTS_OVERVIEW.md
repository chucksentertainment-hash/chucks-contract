# ACBU Smart Contracts - Dual Instance Overview

## 📦 What You Have

**Two complete instances** of 8 Soroban smart contracts each:
- **Instance 1**: `acbu-instance-1/`
- **Instance 2**: `acbu-instance-2/`

Each instance contains the full ACBU ecosystem.

## 🎯 The 8 Smart Contracts

### 1. **Minting Contract** (`acbu_minting/`)
**Purpose**: Create new ACBU tokens from deposits
- Converts USDC to ACBU
- Handles fiat deposits (off-chain)
- Validates reserve ratios
- Implements fee structure

**Key Files**:
- `acbu-instance-1/acbu_minting/src/lib.rs` - Main contract
- `acbu-instance-1/acbu_minting/Cargo.toml` - Dependencies

### 2. **Burning Contract** (`acbu_burning/`)
**Purpose**: Redeem ACBU back to underlying assets
- Burns ACBU tokens
- Transfers S-tokens or triggers fiat withdrawal
- Validates redemption requests

### 3. **Oracle Contract** (`acbu_oracle/`)
**Purpose**: Provides exchange rate data
- Aggregates rates from multiple validators
- Computes median prices
- Emergency price thresholds
- Outlier detection

### 4. **Reserve Tracker** (`acbu_reserve_tracker/`)
**Purpose**: Tracks backing reserves
- Verifies reserve adequacy
- Cross-checks with Oracle rates
- Merkle proof validation
- Supply vs reserve ratio

### 5. **Savings Vault** (`acbu_savings_vault/`)
**Purpose**: Interest-bearing ACBU accounts
- Deposit and earn interest
- Lock periods for higher rates
- Withdrawal with accrued interest

### 6. **Lending Pool** (`acbu_lending_pool/`)
**Purpose**: Peer-to-peer ACBU lending
- Lenders provide liquidity
- Borrowers request loans
- Dual authorization model
- Uncollateralized lending

### 7. **Escrow Contract** (`acbu_escrow/`)
**Purpose**: Conditional ACBU transfers
- Hold funds until conditions met
- Time-locked transfers
- Multi-party agreements
- Refund mechanisms

### 8. **Multisig Contract** (`acbu_multisig/`)
**Purpose**: M-of-N authorization for admin actions
- Proposal system
- Threshold voting
- Execute authorized actions
- Timelock features

## 🏗️ Architecture

```
┌─────────────────────────────────────────┐
│         User Applications               │
└──────────┬──────────────────────────────┘
           │
    ┌──────┴───────┬──────────┬─────────┐
    │              │          │         │
┌───▼────┐  ┌─────▼─────┐  ┌─▼────┐  ┌─▼──────┐
│Minting │  │  Burning  │  │Savings│  │Lending │
└───┬────┘  └─────┬─────┘  └──┬───┘  └────┬───┘
    │             │            │           │
    └─────────┬───┴────────────┴───────────┘
              │
    ┌─────────▼─────────────────┐
    │   Infrastructure Layer    │
    │  ┌────────┐  ┌──────────┐│
    │  │ Oracle │  │ Reserve  ││
    │  │        │  │ Tracker  ││
    │  └────────┘  └──────────┘│
    └───────────────────────────┘
              │
    ┌─────────▼─────────────────┐
    │   Governance Layer        │
    │  ┌────────┐  ┌─────────┐ │
    │  │Multisig│  │ Shared  │ │
    │  └────────┘  └─────────┘ │
    └───────────────────────────┘
```

## 📂 Instance Structure

Each instance has identical structure:

```
acbu-instance-X/
├── acbu_minting/
│   ├── src/lib.rs          (Smart contract code)
│   ├── Cargo.toml          (Dependencies)
│   └── tests/              (Test suite)
├── acbu_burning/
│   ├── src/lib.rs
│   ├── Cargo.toml
│   └── tests/
├── acbu_oracle/
│   ├── src/lib.rs
│   ├── Cargo.toml
│   └── tests/
├── acbu_reserve_tracker/
│   ├── src/lib.rs
│   ├── Cargo.toml
│   └── tests/
├── acbu_savings_vault/
│   ├── src/lib.rs
│   ├── Cargo.toml
│   └── tests/
├── acbu_lending_pool/
│   ├── src/lib.rs
│   ├── Cargo.toml
│   └── tests/
├── acbu_escrow/
│   ├── src/lib.rs
│   ├── Cargo.toml
│   └── tests/
├── acbu_multisig/
│   ├── src/lib.rs
│   ├── Cargo.toml
│   └── tests/
├── shared/                  (Common code)
│   ├── src/lib.rs
│   └── Cargo.toml
├── Cargo.toml               (Workspace config)
└── Makefile                 (Build commands)
```

## 🚀 Running the Smart Contracts

### Quick Start

**To run both instances with tests:**
```bash
RUN_SMART_CONTRACTS.bat
```

**To build WASM contracts only:**
```bash
BUILD_SMART_CONTRACTS.bat
```

### Manual Commands

**Instance 1:**
```bash
cd acbu-instance-1

# Test all contracts
cargo test --all

# Build to WASM
cargo build --target wasm32-unknown-unknown --release

# Test specific contract
cd acbu_minting && cargo test
```

**Instance 2:**
```bash
cd acbu-instance-2
cargo test --all
```

## 🔧 What Happens When Running

### Compilation Phase (5-10 minutes first time)
1. Compiles `shared` library (common code)
2. Compiles each of 8 contracts
3. Links dependencies
4. Generates WASM binaries

### Testing Phase (2-5 minutes)
1. Runs unit tests for each contract
2. Runs integration tests
3. Validates contract interactions
4. Tests edge cases and errors

### Output Files (WASM Binaries)
```
target/wasm32-unknown-unknown/release/
├── acbu_minting.wasm           (~200KB)
├── acbu_burning.wasm           (~180KB)
├── acbu_oracle.wasm            (~150KB)
├── acbu_reserve_tracker.wasm   (~160KB)
├── acbu_savings_vault.wasm     (~170KB)
├── acbu_lending_pool.wasm      (~190KB)
├── acbu_escrow.wasm            (~140KB)
└── acbu_multisig.wasm          (~160KB)
```

## 📊 Contract Statistics

| Contract | Lines of Code | Test Cases | Dependencies |
|----------|---------------|------------|--------------|
| Minting | ~800 | 25+ | Oracle, Reserve |
| Burning | ~700 | 20+ | Oracle, Reserve |
| Oracle | ~600 | 30+ | Multisig |
| Reserve Tracker | ~500 | 15+ | Oracle |
| Savings Vault | ~400 | 20+ | - |
| Lending Pool | ~500 | 18+ | - |
| Escrow | ~350 | 15+ | - |
| Multisig | ~450 | 12+ | - |
| **Total** | **~4,300** | **155+** | - |

## 🔗 Contract Dependencies

```
Minting ──────┬──▶ Oracle
              └──▶ Reserve Tracker
              
Burning ──────┬──▶ Oracle
              └──▶ Reserve Tracker

Reserve ──────▶ Oracle

Oracle ───────▶ Multisig

All Contracts ▶ Shared Library
```

## 🎯 Use Cases for Dual Instances

1. **Development + Staging**: Edit Instance 1, keep Instance 2 stable
2. **A/B Testing**: Test different configurations
3. **Testnet + Mainnet**: Deploy one to testnet, one to mainnet
4. **Feature Branches**: Different features in each instance
5. **Load Testing**: Run parallel operations

## 📖 Next Steps

1. **Install Rust** (if not installed): https://rustup.rs/
2. **Add WASM target**: `rustup target add wasm32-unknown-unknown`
3. **Run smart contracts**: `RUN_SMART_CONTRACTS.bat`
4. **Deploy to testnet**: See `DEPLOYMENT.md` in each instance

## 🔐 Security Features

- ✅ Re-entrancy protection
- ✅ Access control (admin/operator roles)
- ✅ Rate limiting
- ✅ Emergency pause mechanisms
- ✅ Multisig authorization for critical ops
- ✅ Comprehensive testing (155+ tests)

---

**Ready to run?** Execute `RUN_SMART_CONTRACTS.bat` to start both instances! 🚀
