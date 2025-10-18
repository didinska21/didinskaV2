# 🚀 DIDINSKA Wallet Hunter - Complete Setup Guide

Step-by-step installation guide for beginners.

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Configuration](#configuration)
4. [First Run](#first-run)
5. [Troubleshooting](#troubleshooting)

---

## 1️⃣ Prerequisites

### Check Python Version

```bash
python3 --version
# Should be Python 3.8 or higher
```

If Python is not installed:

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

**CentOS/RHEL:**
```bash
sudo yum install python3 python3-pip
```

**macOS:**
```bash
brew install python3
```

**Windows:**
Download from https://www.python.org/downloads/

---

## 2️⃣ Installation

### Step 1: Create Project Directory

```bash
mkdir ~/didinska
cd ~/didinska
```

### Step 2: Create Virtual Environment

```bash
python3 -m venv venv
```

### Step 3: Activate Virtual Environment

**Linux/Mac:**
```bash
source venv/bin/activate
```

**Windows:**
```cmd
venv\Scripts\activate
```

You should see `(venv)` in your terminal prompt.

### Step 4: Create Project Structure

```bash
# Create directories
mkdir utils

# Create empty files
touch main.py
touch wallet_gen_random.py
touch wallet_gen_phrase.py
touch config.json
touch .env
touch requirements.txt
touch .gitignore

# Create utils files
touch utils/__init__.py
touch utils/colors.py
touch utils/ui.py
touch utils/telegram.py
touch utils/wallet.py
touch utils/checker.py
```

### Step 5: Copy Code Files

Copy all the code from the artifacts into their respective files:

1. `main.py` - Main menu code
2. `wallet_gen_random.py` - Random generator code
3. `wallet_gen_phrase.py` - Phrase finder code
4. `utils/colors.py` - Colors code
5. `utils/ui.py` - UI code
6. `utils/telegram.py` - Telegram code
7. `utils/wallet.py` - Wallet code
8. `utils/checker.py` - Checker code
9. `utils/__init__.py` - Init code
10. `requirements.txt` - Dependencies
11. `config.json` - Configuration
12. `.env` - Environment template
13. `.gitignore` - Git ignore file

### Step 6: Install Dependencies

```bash
pip install -r requirements.txt
```

Expected output:
```
Collecting web3==6.11.1
Collecting mnemonic==0.20
Collecting eth-account==0.10.0
...
Successfully installed ...
```

### Step 7: Verify Installation

```bash
python3 -c "import mnemonic, web3, eth_account; print('✅ All dependencies installed')"
```

---

## 3️⃣ Configuration

### Step 1: Get DeBank API Key (Optional)

1. Visit https://debank.com/
2. Sign up for free account
3. Go to API section
4. Generate API key
5. Copy the key

### Step 2: Get Alchemy API Key (Recommended)

1. Visit https://www.alchemy.com/
2. Sign up for free account
3. Click "Create App"
4. Fill in details:
   - Name: DIDINSKA
   - Chain: Ethereum
   - Network: Mainnet
5. Click "Create app"
6. Click "View Key"
7. Copy the API Key

### Step 3: Setup Telegram Bot (Optional)

#### Create Bot:

1. Open Telegram
2. Search for `@BotFather`
3. Send `/newbot`
4. Enter bot name: `DIDINSKA Wallet Hunter`
5. Enter username: `didinska_wallet_bot` (must be unique)
6. Copy the bot token (looks like: `123456789:ABCdefGHIjklMNOpqrsTUVwxyz`)

#### Get Chat ID:

1. Search for `@userinfobot` on Telegram
2. Send `/start`
3. Copy your ID (looks like: `123456789`)

#### Test Bot:

1. Search for your bot username
2. Click START
3. Send a test message

### Step 4: Configure .env File

Edit `.env`:

```bash
nano .env
```

Fill in your keys:

```env
# DeBank API (Optional)
DEBANK_ACCESS_KEY=your_actual_debank_key_here

# Alchemy API (Recommended)
ALCHEMY_API_KEY=your_actual_alchemy_key_here

# Telegram Bot (Optional)
TELEGRAM_BOT_TOKEN=123456789:ABCdefGHIjklMNOpqrsTUVwxyz
TELEGRAM_CHAT_ID=123456789

# File Configuration
CONFIG_FILE=config.json
OUTPUT_FILE=hasil.json
EMPTY_WALLETS_FILE=empty_wallets.json

# Performance
DEBUG_MODE=False
CONCURRENT_WORKERS=16
```

Save and exit (Ctrl+X, then Y, then Enter in nano).

### Step 5: Verify Configuration

```bash
cat .env | grep -v "^#" | grep -v "^$"
```

You should see your actual keys (not the template values).

### Step 6: Test Configuration

```bash
python3 << 'EOF'
import os
from dotenv import load_dotenv

load_dotenv()

print("Configuration Test:")
print("=" * 50)
print(f"DeBank API: {'✅ Set' if os.getenv('DEBANK_ACCESS_KEY') else '❌ Not set'}")
print(f"Alchemy API: {'✅ Set' if os.getenv('ALCHEMY_API_KEY') else '❌ Not set'}")
print(f"Telegram Bot: {'✅ Set' if os.getenv('TELEGRAM_BOT_TOKEN') else '❌ Not set'}")
print(f"Telegram Chat: {'✅ Set' if os.getenv('TELEGRAM_CHAT_ID') else '❌ Not set'}")
print("=" * 50)
EOF
```

---

## 4️⃣ First Run

### Step 1: Test Import

```bash
python3 -c "from utils import Colors; print(f'{Colors.GREEN}✅ Utils package working!{Colors.ENDC}')"
```

### Step 2: Test Telegram (if configured)

```bash
python3 << 'EOF'
import sys
sys.path.insert(0, 'utils')
from telegram import test_connection
test_connection()
EOF
```

### Step 3: Run Main Program

```bash
python3 main.py
```

You should see the DIDINSKA header and main menu.

### Step 4: Quick Test Scan

1. Choose `1` (Wallet Generator)
2. Choose `1` (Quick scan - 10 wallets)
3. Wait for completion
4. Check output files:

```bash
ls -lh *.json
cat hasil.json
cat empty_wallets.json
```

---

## 5️⃣ Troubleshooting

### Error: "ModuleNotFoundError: No module named 'mnemonic'"

**Solution:**
```bash
source venv/bin/activate  # Activate venv first!
pip install mnemonic
```

### Error: "FileNotFoundError: [Errno 2] No such file or directory: 'config.json'"

**Solution:**
```bash
# Make sure you're in the right directory
pwd
# Should show .../didinska

# Check if config.json exists
ls -l config.json

# If not, create it with the template provided
```

### Error: "JSONDecodeError: Expecting value"

**Solution:**
```bash
# Validate JSON syntax
python3 -m json.tool config.json

# If error, fix the JSON syntax or recreate from template
```

### Error: "No RPC connections established"

**Possible causes:**

1. **Missing Alchemy API key:**
   ```bash
   grep ALCHEMY_API_KEY .env
   # Should show your actual key, not "your_alchemy_key_here"
   ```

2. **Network connectivity:**
   ```bash
   curl -s https://eth-mainnet.g.alchemy.com/v2/demo | head -n 5
   # Should return some JSON
   ```

3. **Firewall blocking:**
   ```bash
   # Check if you can reach RPC endpoints
   nc -zv eth-mainnet.g.alchemy.com 443
   ```

**Solution:**
- Add your real Alchemy API key to `.env`
- Check internet connection
- Try using public RPCs (BSC, Avalanche work without API key)

### Error: "Telegram connection failed"

**Check 1: Bot token format**
```bash
# Should be in format: 123456789:ABCdefGHIjklMNOpqrsTUVwxyz
grep TELEGRAM_BOT_TOKEN .env
```

**Check 2: Chat ID format**
```bash
# Should be numeric: 123456789
grep TELEGRAM_CHAT_ID .env
```

**Check 3: Bot activation**
- Open Telegram
- Search for your bot
- Make sure you clicked START

**Check 4: Test manually**
```bash
BOT_TOKEN="your_bot_token"
CHAT_ID="your_chat_id"
curl -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d "chat_id=${CHAT_ID}" \
  -d "text=Test message"
```

### Error: "Permission denied"

**Solution:**
```bash
# Make scripts executable
chmod +x main.py wallet_gen_random.py wallet_gen_phrase.py

# Check file permissions
ls -l *.py
```

### Slow Performance

**Optimization:**

1. **Increase workers:**
   ```env
   CONCURRENT_WORKERS=32  # In .env
   ```

2. **Use faster RPC:**
   ```json
   // Use local node or premium RPC in config.json
   ```

3. **Disable DeBank if rate limited:**
   ```env
   DEBANK_ACCESS_KEY=  # Leave empty
   ```

### Program Crashes

**Get detailed error:**
```bash
# Enable debug mode
echo "DEBUG_MODE=True" >> .env

# Run again
python3 main.py
```

**Check logs:**
```bash
# If program creates logs
tail -f *.log
```

---

## ✅ Installation Complete!

Your DIDINSKA Wallet Hunter is now ready to use!

### Quick Start Commands

```bash
# Activate virtual environment
source venv/bin/activate

# Run program
python3 main.py

# Deactivate when done
deactivate
```

### Next Steps

1. Read the [README.md](README.md) for usage instructions
2. Check [TELEGRAM_SETUP.md](TELEGRAM_SETUP.md) for detailed Telegram setup
3. Review [Legal Disclaimer](README.md#legal-disclaimer)
4. Start with quick test scans before large operations

### Need Help?

- 📖 Check the [README.md](README.md)
- 🐛 Report issues on GitHub
- 💬 Join Telegram community

---

**Happy Hunting! 🔍**
