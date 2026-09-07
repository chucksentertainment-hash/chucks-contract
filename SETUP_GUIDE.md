# ACBU Smart Contract - Dual Instance Setup Guide

## Current Status
✅ **Codebase divided into 2 instances:**
- `acbu-instance-1/` - Instance 1 (Independent copy)
- `acbu-instance-2/` - Instance 2 (Independent copy)
- `acbu-smart-contract/` - Original repository (kept for reference)

## Prerequisites Required

### 1. Install Rust
Rust is required to build and run these Soroban smart contracts.

**Installation Steps:**
```bash
# Download and install Rust from https://rustup.rs/
# Or run this command in PowerShell:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# After installation, restart your terminal and verify:
rustc --version
cargo --version
```

### 2. Add WASM Target
```bash
rustup target add wasm32-unknown-unknown
```

### 3. Install Soroban CLI
```bash
cargo install --locked soroban-cli
```

### 4. Install Nargo (for ZK circuits)
```bash
# Download from: https://github.com/noir-lang/noir/releases/tag/v0.38.0
# Required version: 0.38.0
```

## Running Both Instances

### Option 1: Run Tests Simultaneously

**Terminal 1 (Instance 1):**
```bash
cd acbu-instance-1
cargo test
```

**Terminal 2 (Instance 2):**
```bash
cd acbu-instance-2
cargo test
```

### Option 2: Build Both Simultaneously

**Terminal 1 (Instance 1):**
```bash
cd acbu-instance-1
make build
```

**Terminal 2 (Instance 2):**
```bash
cd acbu-instance-2
make build
```

### Option 3: Watch Mode (Continuous Testing)

Install cargo-watch first:
```bash
cargo install cargo-watch
```

**Terminal 1 (Instance 1):**
```bash
cd acbu-instance-1
cargo watch -x test
```

**Terminal 2 (Instance 2):**
```bash
cd acbu-instance-2
cargo watch -x test
```

## Development Workflow

### Building Contracts
```bash
# Instance 1
cd acbu-instance-1
make build          # Build all contracts
make build-minting  # Build specific contract

# Instance 2
cd acbu-instance-2
make build
make build-minting
```

### Running Tests
```bash
# Instance 1
cd acbu-instance-1
make test           # All tests
make test-minting   # Specific contract

# Instance 2
cd acbu-instance-2
make test
make test-minting
```

### Deploy to Testnet
```bash
# Set your Stellar secret key
export STELLAR_SECRET_KEY="your-testnet-secret-key"

# Instance 1
cd acbu-instance-1
make deploy-testnet

# Instance 2
cd acbu-instance-2
make deploy-testnet
```

## Instance Isolation

Both instances are completely independent:
- Separate build artifacts
- Separate test outputs
- Separate deployment configurations
- Independent git histories

## Quick Reference

| Task | Instance 1 | Instance 2 |
|------|-----------|-----------|
| Navigate | `cd acbu-instance-1` | `cd acbu-instance-2` |
| Build | `make build` | `make build` |
| Test | `make test` | `make test` |
| Deploy | `make deploy-testnet` | `make deploy-testnet` |

## Next Steps

1. **Install Rust** (see above)
2. **Install dependencies** (WASM target, Soroban CLI)
3. **Open two terminals**
4. **Run both instances simultaneously**

## Automated Startup Script

Once Rust is installed, you can use this PowerShell script to start both:

**start-both-instances.ps1:**
```powershell
# Start Instance 1
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd acbu-instance-1; cargo watch -x test"

# Start Instance 2
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd acbu-instance-2; cargo watch -x test"
```

Run it with:
```powershell
.\start-both-instances.ps1
```
