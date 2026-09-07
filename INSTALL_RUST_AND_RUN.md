# Install Rust & Run Both Smart Contract Instances

## Current Status

✅ **Codebase divided**: Two independent instances created
- `acbu-instance-1/` - Full smart contract suite
- `acbu-instance-2/` - Full smart contract suite

⚠️ **Rust not installed**: Cannot run yet without Rust

## Quick Install & Run Guide

### Step 1: Install Rust (Required)

**Option A - Using PowerShell (Recommended):**
```powershell
# Download and run Rust installer
Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe
.\rustup-init.exe

# Follow prompts, then restart terminal
```

**Option B - Manual Download:**
1. Visit: https://rustup.rs/
2. Download the installer
3. Run it
4. Restart your terminal

**Option C - Using winget:**
```powershell
winget install Rustlang.Rustup
```

### Step 2: Add WASM Target
```bash
rustup target add wasm32-unknown-unknown
```

### Step 3: Verify Installation
```bash
cargo --version
rustc --version
```

### Step 4: Run Both Instances

**Automatic (Easiest):**
```bash
START_INSTANCES.bat
```

**Manual (2 separate terminals):**

Terminal 1:
```bash
cd acbu-instance-1
cargo test
```

Terminal 2:
```bash
cd acbu-instance-2
cargo test
```

## What Will Happen When Running

Both instances will:
1. Compile all 8 smart contracts
2. Run comprehensive test suites
3. Execute in parallel independently
4. Display test results in real-time

### Expected Output (Each Instance):
```
Compiling shared v0.1.0
Compiling acbu_minting v0.1.0
Compiling acbu_burning v0.1.0
Compiling acbu_oracle v0.1.0
Compiling acbu_reserve_tracker v0.1.0
Compiling acbu_savings_vault v0.1.0
Compiling acbu_lending_pool v0.1.0
Compiling acbu_escrow v0.1.0
Compiling acbu_multisig v0.1.0

Running tests...
test result: ok. 150+ tests passed
```

## Alternative: Build Without Running Tests

If you just want to compile the smart contracts:

**Terminal 1:**
```bash
cd acbu-instance-1
cargo build --target wasm32-unknown-unknown --release
```

**Terminal 2:**
```bash
cd acbu-instance-2
cargo build --target wasm32-unknown-unknown --release
```

## Watch Mode (Auto-rebuild on changes)

Install cargo-watch:
```bash
cargo install cargo-watch
```

Then run in each terminal:
```bash
# Terminal 1
cd acbu-instance-1
cargo watch -x test

# Terminal 2
cd acbu-instance-2
cargo watch -x test
```

## Troubleshooting

### "cargo: command not found"
- Rust not installed or terminal not restarted
- Run: `rustup --version` to check

### "wasm32-unknown-unknown not installed"
```bash
rustup target add wasm32-unknown-unknown
```

### Build takes too long
- First build is slow (compiles dependencies)
- Subsequent builds are much faster
- Expected first build: 5-10 minutes

## Time Estimates

| Task | First Time | Subsequent |
|------|-----------|------------|
| Install Rust | 5 minutes | - |
| First build | 5-10 minutes | - |
| Run tests | 2-5 minutes | 1-2 minutes |
| Build only | 5-8 minutes | 1 minute |

## Summary

**To get both instances running:**

1. Install Rust (5 min)
2. Add WASM target (1 min)
3. Run `START_INSTANCES.bat` (will compile & test)
4. Wait for compilation (5-10 min first time)
5. Both instances will be running tests

**Total time to first run: ~15-20 minutes**

---

**Ready to install?** Run the commands above or double-click `rustup-init.exe` after downloading!
