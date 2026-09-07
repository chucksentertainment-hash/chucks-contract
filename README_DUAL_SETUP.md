# ACBU Smart Contract - Dual Instance Setup

## 📁 Directory Structure

```
Chucks/
├── acbu-smart-contract/      # Original repository (reference)
├── acbu-instance-1/          # Instance 1 (independent copy)
├── acbu-instance-2/          # Instance 2 (independent copy)
├── START_INSTANCES.bat       # Quick start both instances (tests)
├── BUILD_BOTH.bat            # Quick build both instances
├── start-both-instances.ps1  # PowerShell version (tests)
├── start-both-build.ps1      # PowerShell version (build)
├── SETUP_GUIDE.md            # Detailed setup instructions
└── README_DUAL_SETUP.md      # This file
```

## 🚀 Quick Start

### Prerequisites Check
Before running, you need Rust installed. Check if you have it:
```bash
cargo --version
```

If not installed, visit: **https://rustup.rs/**

### Method 1: Using Batch Files (Easiest)

**To run tests on both instances:**
```bash
START_INSTANCES.bat
```

**To build both instances:**
```bash
BUILD_BOTH.bat
```

### Method 2: Using PowerShell Scripts

**To run tests on both instances:**
```powershell
.\start-both-instances.ps1
```

**To build both instances:**
```powershell
.\start-both-build.ps1
```

### Method 3: Manual (Full Control)

**Terminal 1:**
```bash
cd acbu-instance-1
cargo test
# or
cargo build --target wasm32-unknown-unknown --release
```

**Terminal 2:**
```bash
cd acbu-instance-2
cargo test
# or
cargo build --target wasm32-unknown-unknown --release
```

## 🎯 What Each Instance Contains

Both instances are complete, independent copies of the ACBU smart contract project:

### 8 Smart Contracts:
1. **acbu_minting** - Converts USDC/fiat to ACBU
2. **acbu_burning** - Redeems ACBU back to fiat/tokens
3. **acbu_oracle** - Aggregates exchange rates
4. **acbu_reserve_tracker** - Tracks reserve balances
5. **acbu_savings_vault** - Interest-bearing savings
6. **acbu_lending_pool** - Peer-to-peer lending
7. **acbu_escrow** - Conditional transfers
8. **acbu_multisig** - M-of-N authorization

## 📊 Current Status

### ✅ Completed
- [x] Repository cloned
- [x] Codebase divided into 2 instances
- [x] Startup scripts created
- [x] Documentation prepared

### ⏳ Requires Installation
- [ ] Rust (cargo, rustc)
- [ ] WASM target (`rustup target add wasm32-unknown-unknown`)
- [ ] Soroban CLI (optional, for deployment)
- [ ] Nargo 0.38.0 (optional, for ZK circuits)

## 🔧 Installation Steps

### 1. Install Rust

**Windows (PowerShell):**
```powershell
# Download and run the installer
Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe
.\rustup-init.exe
```

**Or visit:** https://rustup.rs/

### 2. Add WASM Target
```bash
rustup target add wasm32-unknown-unknown
```

### 3. Install Soroban CLI (for deployment)
```bash
cargo install --locked soroban-cli
```

### 4. Verify Installation
```bash
cargo --version
rustc --version
```

## 🏃 Running Both Instances

Once Rust is installed:

1. **Double-click** `START_INSTANCES.bat`
   - OR -
2. **Run** `.\start-both-instances.ps1` in PowerShell

Two new terminal windows will open, each running one instance.

## 🔄 Development Workflow

### Typical Usage:

1. **Start both instances** to run tests continuously
2. **Edit code** in either instance independently
3. **Tests auto-run** when files change (with cargo-watch)
4. **Build** when ready for deployment

### Advanced: Watch Mode

Install cargo-watch for auto-recompile:
```bash
cargo install cargo-watch
```

Then run in each instance:
```bash
cd acbu-instance-1
cargo watch -x test

cd acbu-instance-2
cargo watch -x test
```

## 🌐 Deployment

Each instance can be deployed independently to testnet or mainnet:

```bash
# Set your Stellar secret key
export STELLAR_SECRET_KEY="your-secret-key"

# Deploy instance 1
cd acbu-instance-1
make deploy-testnet

# Deploy instance 2
cd acbu-instance-2
make deploy-testnet
```

## 📖 Additional Documentation

- **SETUP_GUIDE.md** - Detailed setup and usage guide
- **acbu-instance-1/README.md** - Smart contract documentation
- **acbu-instance-2/README.md** - Smart contract documentation
- **acbu-instance-1/INSTANCE_INFO.md** - Instance 1 details
- **acbu-instance-2/INSTANCE_INFO.md** - Instance 2 details

## 🆘 Troubleshooting

### "cargo: command not found"
- Install Rust from https://rustup.rs/
- Restart your terminal after installation

### "wasm32-unknown-unknown not installed"
```bash
rustup target add wasm32-unknown-unknown
```

### Build errors
```bash
# Clean and rebuild
cd acbu-instance-1
cargo clean
cargo build
```

## 💡 Use Cases

### Why Two Instances?

1. **A/B Testing** - Test different configurations
2. **Version Comparison** - Compare old vs new code
3. **Development/Staging** - One for dev, one stable
4. **Independent Features** - Work on different features
5. **Load Testing** - Run parallel operations

## 📝 Notes

- Both instances are **completely independent**
- Changes in one **don't affect** the other
- Each has its own **build artifacts**
- Each has its own **test results**
- Deploy them to **different networks** or **same network**

## 🔗 Useful Links

- **Rust Installation**: https://rustup.rs/
- **Soroban Docs**: https://soroban.stellar.org/
- **Project Repository**: https://github.com/Pi-Defi-world/acbu-smart-contract

---

**Ready to go?** Run `START_INSTANCES.bat` to start both instances! 🚀
