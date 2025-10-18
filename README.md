# 🔍 DIDINSKA Wallet Hunter v4.0

Advanced cryptocurrency wallet scanner with multi-mode support, Telegram integration, and multi-chain balance checking.

```
╔══════════════════════════════════════════════════════════════════════╗
║  ██████╗ ██╗██████╗ ██╗███╗   ██╗███████╗██╗  ██╗ █████╗            ║
║  ██╔══██╗██║██╔══██╗██║████╗  ██║██╔════╝██║ ██╔╝██╔══██╗           ║
║  ██║  ██║██║██║  ██║██║██╔██╗ ██║███████╗█████╔╝ ███████║           ║
║  ██║  ██║██║██║  ██║██║██║╚██╗██║╚════██║██╔═██╗ ██╔══██║           ║
║  ██████╔╝██║██████╔╝██║██║ ╚████║███████║██║  ██╗██║  ██║           ║
║  ╚═════╝ ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝           ║
╚══════════════════════════════════════════════════════════════════════╝
```

## ✨ Features

### 🎲 **Mode 1: Random Wallet Generator**
- Generate random 12-word BIP39 phrases
- Scan for balances across multiple chains
- Multi-threaded concurrent checking
- Real-time progress tracking
- Telegram notifications

### 🔍 **Mode 2: Phrase Finder (Wildcard Search)**
- Search with 1-3 unknown words
- Pattern-based phrase recovery
- Efficient combination generation
- Checksum validation
- Perfect for wallet recovery

### 📱 **Telegram Integration**
- Real-time wallet found notifications
- Batch empty wallet reports
- Scan start/complete alerts
- Error notifications
- Full HTML formatting

### 🌐 **Multi-Chain Support**
- Ethereum
- BSC (Binance Smart Chain)
- Polygon
- Arbitrum
- Optimism
- Avalanche
- Fantom
- Base
- Blast
- Linea
- Scroll
- zkSync Era

### 🎨 **Enhanced UI**
- Colorful terminal interface
- ASCII art headers
- Progress bars
- Loading animations
- Statistics dashboard
- Box-styled menus

## 📋 Requirements

- Python 3.8+
- pip (Python package manager)

## 🚀 Installation

### 1. Clone or Download

```bash
# Create project directory
mkdir didinska && cd didinska
```

### 2. Create Virtual Environment (Recommended)

```bash
python3 -m venv venv
source venv/bin/activate  # Linux/Mac
# or
venv\Scripts\activate  # Windows
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Setup Configuration

#### a) Create `.env` file

```bash
cp .env.example .env
nano .env
```

Fill in your API keys:

```env
# DeBank API
DEBANK_ACCESS_KEY=your_debank_key_here

# Alchemy API
ALCHEMY_API_KEY=your_alchemy_key_here

# Telegram Bot
TELEGRAM_BOT_TOKEN=your_bot_token_here
TELEGRAM_CHAT_ID=your_chat_id_here

# Performance
CONCURRENT_WORKERS=16
DEBUG_MODE=False
```

#### b) Config file is already created (`config.json`)

## 🔑 Getting API Keys

### DeBank API
1. Visit https://debank.com/
2. Sign up for account
3. Go to API dashboard
4. Generate API key
5. **Free tier**: 100 requests/day

### Alchemy API
1. Visit https://www.alchemy.com/
2. Create account
3. Create new app
4. Copy API key
5. **Free tier**: 300M compute units/month

### Telegram Bot
1. Open Telegram and search `@BotFather`
2. Send `/newbot` command
3. Follow instructions to create bot
4. Copy bot token
5. Get your Chat ID from `@userinfobot`

**Detailed guide**: See `TELEGRAM_SETUP.md`

## 📖 Usage

### Start the Program

```bash
python main.py
```

### Main Menu

```
🎯 MAIN MENU - DIDINSKA WALLET HUNTER

1) Wallet Generator (Random 12-word phrases)
   → Generate random wallets and scan for balance

2) Phrase Finder    (Search with wildcards)
   → Find wallets by partial phrase (e.g: wind * * fire)

3) Exit             (Close program)

Choose (1-3):
```

### Mode 1: Random Generator

```
📋 RANDOM GENERATOR MENU

1) Quick scan      (10 wallets)
2) Medium scan     (100 wallets)
3) Large scan      (1,000 wallets)
4) Mega scan       (10,000 wallets)
5) Custom scan     (enter amount)
6) View statistics (live stats)
7) Exit            (back to main menu)
```

### Mode 2: Phrase Finder

```
🔍 PHRASE FINDER - Select Search Mode

1) Search 1 word  (~2,048 combinations)
   → Know 11 words, find 1 missing word

2) Search 2 words (~4.2 million combinations)
   → Know 10 words, find 2 missing words

3) Search 3 words (~8.5 billion combinations)
   → Know 9 words, find 3 missing words

4) Exit           (Back to main menu)
```

**Example input:**
```
Enter your 12-word phrase (use * for unknown words):
> wind air * break warrior extra fire door * * water color
```

## 📁 Project Structure

```
didinska/
├── main.py                    # Main menu
├── wallet_gen_random.py       # Random generator mode
├── wallet_gen_phrase.py       # Phrase finder mode
├── utils/
│   ├── __init__.py
│   ├── colors.py             # Color definitions
│   ├── telegram.py           # Telegram functions
│   ├── wallet.py             # Wallet generation
│   ├── checker.py            # Balance checking
│   └── ui.py                 # UI components
├── config.json               # Chain configurations
├── .env                      # API keys (DO NOT COMMIT)
├── requirements.txt          # Python dependencies
├── README.md                 # This file
└── TELEGRAM_SETUP.md         # Telegram bot setup guide
```

## 📊 Output Files

### `hasil.json`
Wallets with balance or transaction history:

```json
[
  {
    "address": "0x1234...",
    "private_key": "abc123...",
    "phrase": "word1 word2 ... word12",
    "balance_usd": 1234.56,
    "coins": {
      "ETH": 0.5,
      "USDT": 1000
    },
    "chains": ["ethereum", "polygon"],
    "nonce": 15,
    "found_at": "2025-10-18T10:30:45"
  }
]
```

### `empty_wallets.json`
Empty wallets (no balance, no history):

```json
[
  {
    "address": "0x5678...",
    "phrase": "word1 word2 ... word12",
    "checked_at": "2025-10-18T10:30:45"
  }
]
```

### `phrase_found.json`
Wallets found via phrase finder:

```json
[
  {
    "address": "0xabcd...",
    "private_key": "def456...",
    "phrase": "found phrase here",
