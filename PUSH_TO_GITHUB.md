# Push to GitHub Instructions

## ✅ Git Setup Complete!

Your local repository has been initialized and committed with all files.

## 🚀 Next Steps: Create GitHub Repository & Push

### Option 1: Using GitHub Website (Recommended for first-time)

1. **Go to GitHub**: https://github.com/new

2. **Create Repository with these settings**:
   - Repository name: `chucks-contract`
   - Description: `Chucks Contract - Dual Instance Smart Contract Suite for Soroban`
   - Visibility: ✓ Public (or Private if you prefer)
   - ❌ **DO NOT** initialize with README, .gitignore, or license (we already have them)

3. **After creating, GitHub will show you commands. Use these instead**:

```bash
git remote add origin https://github.com/chucksentertainment-hash/chucks-contract.git
git branch -M main
git push -u origin main
```

### Option 2: Using GitHub CLI (if installed)

```bash
# Install GitHub CLI first if needed: https://cli.github.com/

# Create repo and push
gh repo create chucks-contract --public --source=. --remote=origin
git branch -M main
git push -u origin main
```

### Option 3: Manual Commands (after creating repo on GitHub)

```bash
# Add remote (replace with your actual repo URL)
git remote add origin https://github.com/chucksentertainment-hash/chucks-contract.git

# Rename branch to main
git branch -M main

# Push to GitHub
git push -u origin main
```

## 🔐 Authentication

When you push, GitHub will ask for authentication:

### Using Personal Access Token (Recommended):

1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Give it a name: "ACBU Dual Instance"
4. Select scopes: ✓ repo (all)
5. Click "Generate token"
6. Copy the token
7. When pushing, use:
   - Username: `chucksentertainment-hash`
   - Password: `<paste-your-token-here>`

### Or use GitHub CLI for easier auth:

```bash
gh auth login
```

## ✅ Verification

After pushing, verify at:
https://github.com/chucksentertainment-hash/chucks-contract

## 📊 What's Being Pushed

- ✓ acbu-instance-1/ (Full smart contract suite)
- ✓ acbu-instance-2/ (Full smart contract suite)
- ✓ acbu-smart-contract/ (Original reference)
- ✓ START_INSTANCES.bat (Quick start script)
- ✓ BUILD_BOTH.bat (Build script)
- ✓ All PowerShell scripts
- ✓ Complete documentation
- ✓ .gitignore (excludes build artifacts)

## 🆘 Troubleshooting

### "Permission denied"
- Make sure you're using a Personal Access Token, not your password
- GitHub no longer accepts password authentication

### "Repository not found"
- Make sure you created the repository on GitHub first
- Check the repository name matches exactly

### "Failed to push"
- Check your internet connection
- Verify the remote URL: `git remote -v`
- Try: `git push -u origin main --force` (only if nothing important is on GitHub yet)

## 📝 Commands Reference

```bash
# Check status
git status

# View commits
git log --oneline

# View remote
git remote -v

# Change remote URL if needed
git remote set-url origin https://github.com/chucksentertainment-hash/chucks-contract.git

# Push
git push -u origin main
```

---

**Ready to push!** Follow Option 1 above to create your repository on GitHub.
