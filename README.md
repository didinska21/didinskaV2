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
    "balance_usd": 500.00,
    "coins": {
      "ETH": 0.25
    },
    "chains": ["ethereum"],
    "nonce": 5,
    "found_at": "2025-10-18T10:35:00"
  }
]
```

## 🔔 Telegram Notifications

### Wallet Found Notification
```
🎉 WALLET FOUND! 🎉

💰 Balance USD: $1234.56
📍 Address: 0x1234...5678
🔑 Private Key: abc123...
📝 Phrase: word1 word2 ... word12

💎 Coins:
  • ETH: 0.5
  • USDT: 1000

🌐 Chains: ethereum, polygon
📊 Transactions: 15
⏰ Found at: 2025-10-18T10:30:45
```

### Empty Wallets Report (Every 60s)
```
📭 Empty Wallets Report

🔍 Scanned: 150 wallets
❌ Empty: 150
📊 Total Checked: 1,500
⏰ Time: 2025-10-18 10:30:45
```

### Scan Complete
```
✅ Scan Completed

🎯 Mode: Random
📊 Statistics:
  • Generated: 1,000
  • Checked: 1,000
  • Found: 3
  • Empty: 997
  • Speed: 5.23 wallet/s
  • Runtime: 191.23s
```

## ⚙️ Configuration

### Chain Configuration (`config.json`)

Add or remove chains:

```json
{
  "concurrent_workers": 16,
  "rpcs": {
    "your_chain": {
      "name": "Your Chain Name",
      "rpc_url": "https://your-rpc-url.com",
      "native_symbol": "TOKEN",
      "evm": true
    }
  }
}
```

### Environment Variables (`.env`)

| Variable | Description | Required |
|----------|-------------|----------|
| `DEBANK_ACCESS_KEY` | DeBank API key | Optional |
| `ALCHEMY_API_KEY` | Alchemy API key | Recommended |
| `TELEGRAM_BOT_TOKEN` | Telegram bot token | Optional |
| `TELEGRAM_CHAT_ID` | Telegram chat ID | Optional |
| `CONCURRENT_WORKERS` | Number of workers | Default: 16 |
| `DEBUG_MODE` | Enable debug logs | Default: False |

## 🎯 Use Cases

### 1. Wallet Recovery
**Scenario**: You lost 1-2 words from your 12-word phrase

```
Choose: 2 (Phrase Finder)
Choose: 1 (Search 1 word)
Enter phrase: abandon * ability about above absent absorb abstract absurd abuse access accident
```

**Time**: ~3-5 minutes for 1 word
**Success Rate**: 100% if other 11 words are correct

### 2. Security Research
**Scenario**: Testing BIP39 collision probability

```
Choose: 1 (Random Generator)
Choose: 4 (Mega scan - 10,000 wallets)
```

**Purpose**: Educational research on cryptographic security

### 3. Bug Bounty Hunting
**Scenario**: Testing wallet generation vulnerabilities

```
Choose: 1 (Random Generator)
Choose: 5 (Custom scan)
Enter amount: 100000
```

**Purpose**: Find wallets with weak entropy or predictable patterns

## ⚠️ Legal Disclaimer

### Educational Purpose Only

This tool is designed for:
- ✅ **Recovering YOUR OWN wallets** with lost phrases
- ✅ **Security research** and academic purposes
- ✅ **Bug bounty programs** with proper authorization
- ✅ **Testing blockchain security** in controlled environments

### Prohibited Uses

This tool should **NOT** be used for:
- ❌ Accessing wallets that don't belong to you
- ❌ Unauthorized access to others' funds
- ❌ Any illegal activities
- ❌ Violating terms of service

### Probability Disclaimer

**Random generation success rate**: ~1 in 2^128 (practically impossible)
- Finding a wallet with balance randomly is statistically impossible
- 2^128 ≈ 340,282,366,920,938,463,463,374,607,431,768,211,456 combinations
- More likely to find a specific atom in the universe

### Responsibility

Users are solely responsible for:
- Compliance with local laws
- Ethical use of this tool
- Any consequences of misuse

**By using this tool, you acknowledge that you understand and accept these terms.**

## 🛠️ Troubleshooting

### Error: "mnemonic library not installed"

```bash
pip install mnemonic
```

### Error: "web3 not available"

```bash
pip install web3
```

### Error: "Telegram connection failed"

1. Check bot token in `.env`
2. Verify you've sent `/start` to your bot
3. Confirm chat ID is correct
4. Test with:

```bash
python -c "from utils.telegram import test_connection; test_connection()"
```

### Error: "No RPC connections established"

1. Check `ALCHEMY_API_KEY` in `.env`
2. Verify `config.json` format
3. Try public RPCs (BSC, Avalanche)

### Error: "DeBank rate limit"

- Free tier: 100 requests/day
- Wait 24 hours or upgrade plan
- Script automatically skips DeBank on rate limit

### Slow scanning

1. Increase workers: `CONCURRENT_WORKERS=32`
2. Use faster RPC endpoints
3. Disable DeBank if rate limited
4. Run on better hardware

## 📈 Performance Optimization

### 1. Increase Workers

```env
CONCURRENT_WORKERS=32  # More threads
```

**Trade-off**: Higher CPU/memory usage, faster scanning

### 2. Use Local RPC Nodes

```json
{
  "ethereum": {
    "rpc_url": "http://localhost:8545",
    ...
  }
}
```

**Benefit**: No rate limits, faster response

### 3. Selective Chain Checking

Comment out unused chains in `config.json`:

```json
// "fantom": { ... },  // Disabled
```

### 4. Batch Processing

For phrase finder, set max combinations:

```
Enter max combinations: 10000
```

**Purpose**: Test subset before full scan

## 🔐 Security Best Practices

### 1. Protect Your `.env` File

```bash
# Add to .gitignore
echo ".env" >> .gitignore
```

**Never commit API keys to version control!**

### 2. Use Environment-Specific Keys

```
# Development
ALCHEMY_API_KEY=dev_key

# Production
ALCHEMY_API_KEY=prod_key
```

### 3. Secure Found Wallets

- ✅ Move found wallets to secure storage immediately
- ✅ Use hardware wallets for storage
- ✅ Encrypt `hasil.json` file
- ❌ Don't share private keys

### 4. Regular Key Rotation

- Rotate API keys monthly
- Use separate keys for testing/production
- Monitor API usage

## 🤝 Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

### Development Setup

```bash
# Install dev dependencies
pip install -r requirements-dev.txt

# Run tests
python -m pytest tests/

# Code formatting
black .
flake8 .
```

## 📝 Changelog

### v4.0 (Current)
- ✨ Added Phrase Finder mode
- ✨ Modular architecture with utils package
- ✨ Enhanced UI with colors and animations
- ✨ Telegram integration
- ✨ Multi-chain support (12 chains)
- ✨ Separate output files (found/empty)
- 🐛 Fixed config loading issues
- 🐛 Improved error handling

### v3.0
- Added Telegram notifications
- Enhanced statistics
- Progress bar animation

### v2.0
- Multi-chain support
- DeBank integration
- Concurrent checking

### v1.0
- Initial release
- Basic random generation

## 📞 Support

### Issues

Report bugs or request features:
- GitHub Issues: [Create Issue](https://github.com/yourusername/didinska/issues)
- Email: support@didinska.example.com

### FAQ

**Q: Can I really find wallets with balance?**
A: Statistically, no. Probability is 1 in 2^128. This is for research/recovery only.

**Q: Is this legal?**
A: Yes, for educational purposes and recovering YOUR OWN wallets. Using it to access others' wallets is illegal.

**Q: How long to scan 1 million wallets?**
A: Depends on workers and RPC speed. Approximately:
- 10 workers: ~27 hours
- 20 workers: ~14 hours
- 50 workers: ~5 hours

**Q: Can I use this on a VPS/cloud?**
A: Yes! Works on any Linux/Windows server with Python 3.8+.

**Q: Will I hit API rate limits?**
A: Possibly. Solutions:
- Use multiple API keys
- Implement caching
- Use local nodes
- Reduce concurrent workers

## 🙏 Acknowledgments

- **BIP39**: Bitcoin Improvement Proposal 39
- **eth-account**: Ethereum account library
- **web3.py**: Web3 Python library
- **Alchemy**: RPC provider
- **DeBank**: DeFi portfolio tracker

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### MIT License Summary

```
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software...

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND...
```

## 🌟 Star History

If this project helped you, please give it a ⭐ star!

## 🔗 Links

- 📖 Documentation: [Wiki](https://github.com/yourusername/didinska/wiki)
- 💬 Telegram Group: [@didinska_community](https://t.me/didinska_community)
- 🐛 Report Bug: [Issues](https://github.com/yourusername/didinska/issues)
- 💡 Request Feature: [Issues](https://github.com/yourusername/didinska/issues)

---

**Made with ❤️ by DIDINSKA Team**

**⚡ Happy Hunting! 🔍**
