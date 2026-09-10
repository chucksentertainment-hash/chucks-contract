# ACBU Smart Contract - Dual Instance Setup

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Rust](https://img.shields.io/badge/rust-1.88.0-orange.svg)](https://www.rust-lang.org/)
[![Soroban](https://img.shields.io/badge/Soroban-Smart%20Contracts-purple.svg)](https://soroban.stellar.org/)

> **Dual-instance deployment setup for ACBU (African Currency Basket Unit) Soroban smart contracts**

This repository contains a complete dual-instance setup of the ACBU smart contract ecosystem, enabling parallel development, testing, and deployment workflows.

## 📋 Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Quick Start](#quick-start)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running Both Instances](#running-both-instances)
- [Smart Contracts](#smart-contracts)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This setup provides **two independent instances** of the complete ACBU smart contract suite, allowing you to:

- 🔄 Run parallel development and testing
- 🧪 A/B test different configurations
- 🌐 Deploy to multiple networks simultaneously
- 📊 Compare performance and behavior
- 🚀 Maintain stable and development versions

## 📁 Repository Structure

```
chucks-contract/
├── chucks-contract-1/          # Instance 1 - Full smart contract suite
├── chucks-contract-2/          # Instance 2 - Full smart contract suite
├── acbu-smart-contract/      # Original repository (reference)
│
├── START_INSTANCES.bat       # 🚀 Quick start - Run both instances
├── BUILD_BOTH.bat            # 🔨 Build both instances
├── start-both-instances.ps1  # PowerShell: Run both instances
├── start-both-build.ps1      # PowerShell: Build both instances
│
├── 🚀_START_HERE.txt         # Quick start guide
├── README_DUAL_SETUP.md      # Comprehensive setup guide
├── SETUP_GUIDE.md            # Detailed instructions
└── README.md                 # This file
```

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/chucksentertainment-hash/chucks-contract.git
cd chucks-contract
```

### 2. Install Prerequisites

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add WASM target
rustup target add wasm32-unknown-unknown

# Install Soroban CLI
cargo install --locked soroban-cli
```

### 3. Run Both Instances

**Windows (Easiest):**
```bash
# Double-click START_INSTANCES.bat
# OR
START_INSTANCES.bat
```

**PowerShell:**
```powershell
.\start-both-instances.ps1
```

**Manual:**
```bash
# Terminal 1
cd acbu-instance-1
cargo test

# Terminal 2
cd acbu-instance-2
cargo test
```

## 📦 Prerequisites

### Required

- **Rust 1.88.0+** - [Install from rustup.rs](https://rustup.rs/)
- **WASM Target** - `rustup target add wasm32-unknown-unknown`
- **Git** - For version control

### Optional

- **Soroban CLI** - For deployment: `cargo install --locked soroban-cli`
- **Nargo 0.38.0** - For ZK circuits: [Download here](https://github.com/noir-lang/noir/releases/tag/v0.38.0)
- **cargo-watch** - For auto-rebuild: `cargo install cargo-watch`

## 🛠️ Installation

### Step-by-Step Setup

1. **Install Rust:**
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   source $HOME/.cargo/env  # Linux/macOS
   ```

2. **Add WASM Target:**
   ```bash
   rustup target add wasm32-unknown-unknown
   ```

3. **Verify Installation:**
   ```bash
   cargo --version
   rustc --version
   ```

4. **Clone & Build:**
   ```bash
   git clone https://github.com/chucksentertainment-hash/chucks-contract.git
   cd chucks-contract
   
   # Build both instances
   BUILD_BOTH.bat  # Windows
   # OR
   cd acbu-instance-1 && cargo build --release
   cd ../acbu-instance-2 && cargo build --release
   ```

## 🏃 Running Both Instances

### Option 1: Automated Scripts (Recommended)

**Run Tests:**
```bash
START_INSTANCES.bat           # Windows CMD
.\start-both-instances.ps1    # PowerShell
```

**Build:**
```bash
BUILD_BOTH.bat                # Windows CMD
.\start-both-build.ps1        # PowerShell
```

### Option 2: Watch Mode (Auto-rebuild)

```bash
# Install cargo-watch first
cargo install cargo-watch

# Terminal 1
cd acbu-instance-1
cargo watch -x test

# Terminal 2
cd acbu-instance-2
cargo watch -x test
```

### Option 3: Individual Commands

**Instance 1:**
```bash
cd acbu-instance-1
make build          # Build all contracts
make test           # Run all tests
make build-minting  # Build specific contract
```

**Instance 2:**
```bash
cd acbu-instance-2
make build
make test
```

## 📜 Smart Contracts

Each instance contains **8 Soroban smart contracts**:

| Contract | Description | Location |
|----------|-------------|----------|
| **Minting** | Converts USDC/fiat deposits to ACBU | `acbu_minting/` |
| **Burning** | Redeems ACBU back to fiat or S-tokens | `acbu_burning/` |
| **Oracle** | Aggregates exchange rates from validators | `acbu_oracle/` |
| **Reserve Tracker** | Tracks and verifies reserve balances | `acbu_reserve_tracker/` |
| **Savings Vault** | Interest-bearing savings accounts | `acbu_savings_vault/` |
| **Lending Pool** | Peer-to-peer ACBU lending | `acbu_lending_pool/` |
| **Escrow** | Conditional and time-locked transfers | `acbu_escrow/` |
| **Multisig** | M-of-N threshold authorization | `acbu_multisig/` |

### Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        USER / FRONTEND                          │
└────────────┬────────────┬──────────┬──────────┬────────────────┘
             │            │          │          │
     ┌───────▼──────┐ ┌───▼──────┐ ┌▼────────┐ ┌▼─────────────┐
     │   Minting    │ │  Burning │ │ Savings │ │   Lending    │
     │   Contract   │ │ Contract │ │  Vault  │ │     Pool     │
     └──────┬───────┘ └────┬─────┘ └────┬────┘ └──────┬───────┘
            │              │            │              │
            │         ┌────▼──────────────────────┐   │
            │         │     Escrow Contract       │   │
            │         └───────────────────────────┘   │
            │                                          │
     ┌──────▼──────────────────────────────────────────▼───────┐
     │              INFRASTRUCTURE LAYER                       │
     │  ┌──────────────────┐   ┌────────────────────────────┐ │
     │  │ Oracle Contract  │   │ Reserve Tracker Contract   │ │
     │  └──────────────────┘   └────────────────────────────┘ │
     └─────────────────────────────────────────────────────────┘
                             │
     ┌───────────────────────▼──────────────────────────────────┐
     │             SHARED / GOVERNANCE LAYER                    │
     │  ┌────────────────────────┐  ┌──────────────────────┐   │
     │  │   Multisig Contract    │  │   Shared Library     │   │
     │  │  (M-of-N admin auth)   │  │  (types, utilities)  │   │
     │  └────────────────────────┘  └──────────────────────┘   │
     └──────────────────────────────────────────────────────────┘
```

## 🌐 Deployment

### Deploy to Testnet

```bash
# Set your Stellar secret key
export STELLAR_SECRET_KEY="your-testnet-secret-key"

# Deploy Instance 1
cd acbu-instance-1
make deploy-testnet

# Deploy Instance 2
cd acbu-instance-2
make deploy-testnet
```

### Deploy to Mainnet

```bash
# Set environment variables
export STELLAR_SECRET_KEY="your-mainnet-secret-key"
export DEPLOY_CONFIRM=deploy

# Deploy
cd acbu-instance-1
make deploy-mainnet
```

## 📖 Documentation

### Core Documentation
- **🚀_START_HERE.txt** - Quick start guide
- **README_DUAL_SETUP.md** - Complete setup documentation
- **SETUP_GUIDE.md** - Detailed installation instructions

### Contract Documentation
- **acbu-instance-1/README.md** - Full smart contract documentation
- **acbu-instance-1/docs/CONTRACTS.md** - Per-contract function reference
- **acbu-instance-1/docs/ERROR_CODES.md** - Error code listing
- **acbu-instance-1/DEPLOYMENT.md** - Deployment guide
- **acbu-instance-1/INTEGRATION.md** - Integration guide

### Instance Information
- **acbu-instance-1/INSTANCE_INFO.md** - Instance 1 details
- **acbu-instance-2/INSTANCE_INFO.md** - Instance 2 details

## 🧪 Testing

### Run All Tests

```bash
# Instance 1
cd acbu-instance-1
make test

# Instance 2
cd acbu-instance-2
make test
```

### Run Specific Contract Tests

```bash
cd acbu-instance-1
make test-minting
make test-oracle
# etc.
```

### Integration Tests

```bash
cd acbu-instance-1
cargo test --test integration_mint_burn_flow
cargo test --test integration_rounding
```

## 💡 Use Cases

### Why Two Instances?

1. **A/B Testing** - Test different configurations or versions
2. **Development/Production** - Keep one stable, one for development
3. **Multi-Network Deployment** - Deploy to testnet and mainnet
4. **Feature Comparison** - Compare implementations
5. **Load Testing** - Test parallel operations

## 🔐 Security

- All admin functions require multisig (3 of 5)
- Rate limits on transactions
- Circuit breakers for anomalies
- Time locks for critical operations
- Re-entrancy protection on all contracts

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- **Original Repository**: [Pi-Defi-world/acbu-smart-contract](https://github.com/Pi-Defi-world/acbu-smart-contract)
- **Soroban Documentation**: [soroban.stellar.org](https://soroban.stellar.org/)
- **Stellar Network**: [stellar.org](https://stellar.org/)

## 📞 Support

For issues, questions, or contributions:
- Open an issue on GitHub
- Email: chucksentertainment@gmail.com

---

**Built with ❤️ for the ACBU ecosystem**
