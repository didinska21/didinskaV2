# 📱 Telegram Bot Setup Guide

Complete guide to setup Telegram notifications for DIDINSKA Wallet Hunter v4.0

---

## 📋 Table of Contents

1. [Why Use Telegram?](#why-use-telegram)
2. [Step 1: Create Telegram Bot](#step-1-create-telegram-bot)
3. [Step 2: Get Your Chat ID](#step-2-get-your-chat-id)
4. [Step 3: Configure Bot](#step-3-configure-bot)
5. [Step 4: Test Connection](#step-4-test-connection)
6. [Notification Types](#notification-types)
7. [Troubleshooting](#troubleshooting)
8. [Advanced Features](#advanced-features)

---

## 🎯 Why Use Telegram?

Telegram notifications allow you to:
- ✅ **Real-time alerts** when wallets with balance are found
- ✅ **Remote monitoring** - run on VPS, get notified on phone
- ✅ **Batch reports** - periodic updates on scan progress
- ✅ **Error alerts** - immediate notification of issues
- ✅ **Complete info** - address, private key, balance, all in one message
- ✅ **Security** - encrypted messages, private bot

---

## Step 1: Create Telegram Bot

### 1.1 Open Telegram

Open Telegram app on your phone or use [Telegram Web](https://web.telegram.org)

### 1.2 Find BotFather

Search for `@BotFather` (official Telegram bot creator)

**Important:** 
- ✅ Username: `@BotFather` 
- ✅ Has blue verified checkmark
- ❌ Beware of fake bots!

### 1.3 Create New Bot

Send this command to BotFather:
```
/newbot
```

### 1.4 Set Bot Name

BotFather will ask: **"Alright, a new bot. How are we going to call it?"**

Enter your bot's display name:
```
DIDINSKA Wallet Hunter
```

This is the name that will appear in chats.

### 1.5 Set Bot Username

BotFather will ask: **"Now let's choose a username for your bot."**

Enter a unique username (must end with `bot`):
```
didinska_wallet_bot
```

**Note:** If username is taken, try:
- `didinska_hunter_bot`
- `wallet_finder_bot`
- `your_name_wallet_bot`

### 1.6 Get Bot Token

BotFather will respond with:
```
Done! Congratulations on your new bot...

Use this token to access the HTTP API:
123456789:ABCdefGHIjklMNOpqrsTUVwxyz-1234567

Keep your token secure and store it safely...
```

**🔑 COPY THIS TOKEN!** You'll need it later.

Token format: `{bot_id}:{random_string}`
Example: `1234567890:ABCdefGHIjklMNOpqrsTUVwxyz`

### 1.7 Customize Bot (Optional)

You can customize your bot with these commands to BotFather:

**Set description:**
```
/setdescription
```
Then select your bot and enter:
```
Advanced cryptocurrency wallet scanner with multi-chain support. 
This bot sends notifications when wallets with balance are found.
```

**Set about text:**
```
/setabouttext
```
Then:
```
DIDINSKA Wallet Hunter v4.0 - Multi-chain wallet scanner
```

**Set profile picture:**
```
/setuserpic
```
Upload a 512x512 image (optional)

---

## Step 2: Get Your Chat ID

You need your Chat ID to receive messages from the bot.

### Method 1: Using @userinfobot (Easiest)

1. Search for `@userinfobot` in Telegram
2. Click START
3. Send any message (e.g., "hi")
4. Bot will reply with your information:
   ```
   Id: 123456789
   First name: Your Name
   Username: @yourusername
   ```
5. **Copy the `Id` number** - this is your Chat ID

### Method 2: Using @get_id_bot

1. Search for `@get_id_bot`
2. Click START
3. Your Chat ID will be shown immediately

### Method 3: Using Bot API (Manual)

1. First, send `/start` to YOUR bot (the one you just created)
2. Send any message to your bot (e.g., "Hello")
3. Open this URL in your browser (replace `YOUR_BOT_TOKEN`):
   ```
   https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates
   ```
4. You'll see JSON response like:
   ```json
   {
     "ok": true,
     "result": [
       {
         "update_id": 123456789,
         "message": {
           "message_id": 1,
           "from": {
             "id": 987654321,
             "first_name": "Your Name"
           }
         }
       }
     ]
   }
   ```
5. Look for `"from": {"id": 987654321}` - that number is your Chat ID

### Method 4: Using Python Script

Save this as `get_chat_id.py`:
```python
import requests
import sys

if len(sys.argv) < 2:
    print("Usage: python get_chat_id.py YOUR_BOT_TOKEN")
    sys.exit(1)

token = sys.argv[1]
url = f"https://api.telegram.org/bot{token}/getUpdates"

response = requests.get(url)
data = response.json()

if data['ok'] and data['result']:
    for update in data['result']:
        if 'message' in update:
            chat_id = update['message']['from']['id']
            name = update['message']['from'].get('first_name', 'Unknown')
            print(f"Chat ID: {chat_id}")
            print(f"Name: {name}")
else:
    print("No messages found. Please send a message to your bot first!")
```

Run:
```bash
python get_chat_id.py 123456789:ABCdefGHIjklMNOpqrsTUVwxyz
```

---

## Step 3: Configure Bot

### 3.1 Open .env File

Navigate to your project directory and open `.env`:

```bash
cd ~/didinska
nano .env
```

### 3.2 Add Your Credentials

Find these lines and replace with your actual values:

```env
# Telegram Bot Token (Get from @BotFather)
TELEGRAM_BOT_TOKEN=123456789:ABCdefGHIjklMNOpqrsTUVwxyz

# Telegram Chat ID (Get from @userinfobot)
TELEGRAM_CHAT_ID=987654321
```

**Example with real values:**
```env
TELEGRAM_BOT_TOKEN=1234567890:ABCdefGHIjklMNOpqrsTUVwxyz-1234567
TELEGRAM_CHAT_ID=987654321
```

### 3.3 Save File

- If using `nano`: Press `Ctrl+X`, then `Y`, then `Enter`
- If using `vim`: Press `Esc`, type `:wq`, press `Enter`
- If using VS Code: Just save normally (`Ctrl+S`)

### 3.4 Verify Configuration

Check if values are correctly set:

```bash
cat .env | grep TELEGRAM
```

Should show:
```
TELEGRAM_BOT_TOKEN=1234567890:ABC...
TELEGRAM_CHAT_ID=987654321
```

---

## Step 4: Test Connection

### 4.1 Test from Command Line

```bash
cd ~/didinska
source venv/bin/activate  # If using virtual environment
python3 -c "from utils.telegram import test_connection; test_connection()"
```

**Expected output:**
```
✅ Telegram bot connected!
   Bot Name: DIDINSKA Wallet Hunter
   Username: @didinska_wallet_bot
✅ Test message sent successfully!
```

**Check your Telegram** - you should receive a test message!

### 4.2 Test from Python Script

Create `test_telegram.py`:
```python
#!/usr/bin/env python3
from utils.telegram import test_connection, send_message

print("Testing Telegram connection...")
if test_connection():
    print("\n✅ Connection successful!")
    print("Check your Telegram for test message.")
else:
    print("\n❌ Connection failed!")
    print("Please check your bot token and chat ID.")
```

Run:
```bash
python3 test_telegram.py
```

### 4.3 Manual API Test

Test using curl (Linux/Mac):
```bash
curl -X POST "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendMessage" \
  -d "chat_id=<YOUR_CHAT_ID>" \
  -d "text=Hello from DIDINSKA!"
```

**Windows PowerShell:**
```powershell
$botToken = "YOUR_BOT_TOKEN"
$chatId = "YOUR_CHAT_ID"
$text = "Hello from DIDINSKA!"

Invoke-WebRequest -Uri "https://api.telegram.org/bot$botToken/sendMessage" `
  -Method POST `
  -Body @{chat_id=$chatId; text=$text}
```

---

## 📬 Notification Types

Your bot will send different types of notifications:

### 1. 🎉 Wallet Found Alert

Sent immediately when wallet with balance is discovered:

```
🎉 WALLET FOUND! 🎉

💰 Balance: $1,234.56
📍 Address: 0x1234...5678
🔑 Private Key: abc123...
📝 Seed Phrase: word1 word2 ... word12

💎 Coins:
  • ETH: 0.5
  • USDT: 1000

🌐 Chains: ethereum, polygon
📊 Transactions: 15
⏰ Found at: 2025-10-18T10:30:45

DIDINSKA Wallet Hunter v4.0
```

### 2. 🔍 Phrase Found (Phrase Finder Mode)

```
🔍 PHRASE FOUND! 🔍

📝 Recovered Phrase:
wind air fire break warrior extra fire door ocean water water color

📍 Address: 0xabcd...
💰 Balance: $500.00

💎 Coins:
  • ETH: 0.25

🌐 Chains: ethereum

Phrase Finder - DIDINSKA v4.0
```

### 3. 📭 Empty Wallets Batch Report

Sent every 60 seconds (configurable):

```
📭 Empty Wallets Report

🔍 Scanned: 150 wallets
❌ Empty: 150
📊 Total Checked: 1,500
⏰ Time: 2025-10-18 10:30:45

Batch scan completed - DIDINSKA
```

### 4. 🚀 Scan Start Notification

```
🚀 Scan Started

🎯 Target: 10,000 wallets
⚡ Workers: 16
🔍 Mode: Random
🕐 Started: 2025-10-18 09:00:00

DIDINSKA Wallet Hunter is running...
```

### 5. ✅ Scan Complete

```
✅ Scan Completed

📊 Statistics:
  • Generated: 10,000
  • Checked: 10,000
  • Found: 5
  • Empty: 9,995
  • Speed: 5.23 wallet/s
  • Runtime: 31:54

DIDINSKA Wallet Hunter
```

### 6. ⚠️ Error Alert

```
⚠️ Error Alert

🔴 Type: RPC Connection Failed
📝 Message: Connection timeout to ethereum
⏰ Time: 2025-10-18 10:45:00

DIDINSKA Wallet Hunter
```

### 7. 🖥️ System Status

```
🖥️ System Status

🌐 Chains: 12 connected
🔍 DeBank: ✅ Active
📱 Telegram: ✅ Active
⚡ Workers: 16
⏰ Time: 2025-10-18 10:00:00

DIDINSKA Wallet Hunter v4.0
```

---

## 🔧 Troubleshooting

### Problem: "❌ Telegram not configured"

**Cause:** Bot token or chat ID not set in `.env`

**Solution:**
1. Check if `.env` file exists
2. Open `.env` and verify:
   ```env
   TELEGRAM_BOT_TOKEN=your_actual_token
   TELEGRAM_CHAT_ID=your_actual_chat_id
   ```
3. Make sure no quotes around values
4. Restart application

### Problem: "❌ Telegram bot error: 401"

**Cause:** Invalid bot token

**Solution:**
1. Go back to @BotFather
2. Send `/token` command
3. Select your bot
4. Copy new token
5. Update `.env` file

**Or create new bot:**
1. Send `/newbot` to @BotFather
2. Follow setup steps again

### Problem: "❌ Telegram bot error: 400 - Chat not found"

**Cause:** Incorrect chat ID or haven't started bot

**Solution:**
1. Open Telegram
2. Find YOUR bot
3. Click START button
4. Send any message
5. Verify chat ID is correct in `.env`

### Problem: "Connection timeout"

**Cause:** Network/firewall blocking Telegram API

**Solution:**
1. Check internet connection
2. Test access to Telegram API:
   ```bash
   curl https://api.telegram.org/
   ```
3. Check firewall settings
4. Try different network
5. Use VPN if Telegram is blocked in your region

### Problem: Bot receives no messages

**Possible causes:**
1. Wrong chat ID
2. Bot not started
3. Token expired

**Solution:**
1. Delete bot and create new one
2. Get fresh chat ID
3. Update `.env` with new values

### Problem: "Rate limit exceeded"

**Cause:** Sending too many messages too quickly

**Solution:**
- Telegram limit: 30 messages/second
- Increase batch report interval in config
- Reduce notification frequency

### Problem: Messages arrive delayed

**Cause:** High load or network latency

**Solution:**
- Normal behavior during high load
- Messages are queued
- Check network speed
- Try different server location

---

## 🚀 Advanced Features

### Custom Notification Filters

Edit `.env` to control notifications:

```env
# Only notify for wallets with balance > $10
TELEGRAM_MIN_BALANCE_ALERT=10

# Batch report interval (seconds)
TELEGRAM_BATCH_INTERVAL=60
```

### Group Notifications

Send notifications to Telegram group:

1. Create Telegram group
2. Add your bot to group
3. Make bot admin (optional)
4. Get group chat ID:
   - Send message in group
   - Check bot updates
   - Group ID starts with `-` (e.g., `-1001234567890`)
5. Use group ID as `TELEGRAM_CHAT_ID`

### Multiple Recipients

Send to multiple users/groups:

**Option 1: Separate bots**
- Create multiple bots
- Run multiple instances with different `.env`

**Option 2: Modify code**
Edit `utils/telegram.py`:
```python
TELEGRAM_CHAT_IDS = ["123456789", "987654321", "-1001234567890"]

def send_message(message, parse_mode='HTML'):
    for chat_id in TELEGRAM_CHAT_IDS:
        # Send to each chat_id
        ...
```

### Rich Formatting

Telegram supports HTML formatting:

```python
message = """
<b>Bold text</b>
<i>Italic text</i>
<code>Monospace</code>
<pre>Preformatted</pre>
<a href="http://example.com">Link</a>
"""
```

### Scheduled Reports

Add cron job for daily reports:

```bash
# Edit crontab
crontab -e

# Add daily report at 9 AM
0 9 * * * cd /path/to/didinska && python3 send_daily_report.py
```

---

## 🔐 Security Best Practices

### 1. Keep Token Secret

- ❌ Never commit token to Git
- ❌ Never share screenshots with token visible
- ❌ Never post token in public forums
- ✅ Use environment variables
- ✅ Add `.env` to `.gitignore`

### 2. Revoke Compromised Tokens

If token is leaked:
1. Go to @BotFather
2. Send `/revoke`
3. Select your bot
4. Confirm revocation
5. Create new bot

### 3. Private Bot

Keep your bot private:
1. Don't share bot username
2. Don't add to public groups
3. Verify chat ID before sending sensitive info

### 4. Limit Permissions

Bot doesn't need admin rights in groups:
- Uncheck all unnecessary permissions
- Only allow "Send messages"

### 5. Monitor Usage

Check who's using your bot:
```bash
curl "https://api.telegram.org/bot<TOKEN>/getUpdates"
```

Look for unexpected chat IDs.

---

## 📞 Support

### Official Telegram Resources

- 📖 Bot API Documentation: https://core.telegram.org/bots/api
- 💬 Bot Support: @BotSupport
- 🐛 Report Bot Issues: @BotSupport

### DIDINSKA Support

- 📖 Main README: [README.md](README.md)
- 🐛 Report Issues: GitHub Issues

---

## ✅ Setup Complete Checklist

Before running the scanner, verify:

- [ ] Created bot with @BotFather
- [ ] Copied bot token
- [ ] Got chat ID from @userinfobot
- [ ] Added both to `.env` file
- [ ] Started bot in Telegram (clicked START)
- [ ] Tested connection successfully
- [ ] Received test message
- [ ] Understand notification types
- [ ] Read security best practices

---

**🎉 Congratulations!**

Your Telegram bot is now configured and ready to send notifications!

Run your wallet scanner and watch for real-time alerts on your phone! 📱

---

**Happy Hunting! 🔍**
