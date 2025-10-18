#!/bin/bash
# DIDINSKA Wallet Hunter v4.0 - Quick Install Script

echo ""
echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║                    DIDINSKA WALLET HUNTER v4.0                       ║"
echo "║                      Quick Installation Script                       ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check if Python 3 is installed
echo -e "${CYAN}[1/8] Checking Python installation...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}✗ Python 3 is not installed!${NC}"
    echo -e "${YELLOW}Please install Python 3.8 or higher first.${NC}"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1,2)
echo -e "${GREEN}✓ Python $PYTHON_VERSION found${NC}"

# Check Python version
PYTHON_MAJOR=$(echo $PYTHON_VERSION | cut -d'.' -f1)
PYTHON_MINOR=$(echo $PYTHON_VERSION | cut -d'.' -f2)

if [ "$PYTHON_MAJOR" -lt 3 ] || ([ "$PYTHON_MAJOR" -eq 3 ] && [ "$PYTHON_MINOR" -lt 8 ]); then
    echo -e "${RED}✗ Python 3.8+ required, found $PYTHON_VERSION${NC}"
    exit 1
fi

# Check if pip is installed
echo -e "${CYAN}[2/8] Checking pip installation...${NC}"
if ! command -v pip3 &> /dev/null; then
    echo -e "${RED}✗ pip3 is not installed!${NC}"
    echo -e "${YELLOW}Please install pip3 first.${NC}"
    exit 1
fi
echo -e "${GREEN}✓ pip3 found${NC}"

# Create virtual environment
echo -e "${CYAN}[3/8] Creating virtual environment...${NC}"
if [ -d "venv" ]; then
    echo -e "${YELLOW}⚠ Virtual environment already exists, skipping...${NC}"
else
    python3 -m venv venv
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Virtual environment created${NC}"
    else
        echo -e "${RED}✗ Failed to create virtual environment${NC}"
        exit 1
    fi
fi

# Activate virtual environment
echo -e "${CYAN}[4/8] Activating virtual environment...${NC}"
source venv/bin/activate
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Virtual environment activated${NC}"
else
    echo -e "${RED}✗ Failed to activate virtual environment${NC}"
    exit 1
fi

# Upgrade pip
echo -e "${CYAN}[5/8] Upgrading pip...${NC}"
pip install --upgrade pip > /dev/null 2>&1
echo -e "${GREEN}✓ pip upgraded${NC}"

# Install dependencies
echo -e "${CYAN}[6/8] Installing dependencies...${NC}"
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Dependencies installed${NC}"
    else
        echo -e "${RED}✗ Failed to install dependencies${NC}"
        exit 1
    fi
else
    echo -e "${RED}✗ requirements.txt not found!${NC}"
    exit 1
fi

# Verify installation
echo -e "${CYAN}[7/8] Verifying installation...${NC}"
python3 -c "import mnemonic, web3, eth_account, requests; print('OK')" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ All dependencies verified${NC}"
else
    echo -e "${RED}✗ Dependency verification failed${NC}"
    exit 1
fi

# Check configuration
echo -e "${CYAN}[8/8] Checking configuration...${NC}"

if [ ! -f "config.json" ]; then
    echo -e "${YELLOW}⚠ config.json not found${NC}"
    echo -e "${YELLOW}  Please create config.json file${NC}"
fi

if [ ! -f ".env" ]; then
    echo -e "${YELLOW}⚠ .env not found${NC}"
    echo -e "${YELLOW}  Please create .env file with your API keys${NC}"
    
    # Create .env template
    cat > .env << 'EOF'
# DeBank API
DEBANK_ACCESS_KEY=your_debank_key_here

# Alchemy API
ALCHEMY_API_KEY=your_alchemy_key_here

# Telegram Bot
TELEGRAM_BOT_TOKEN=your_bot_token_here
TELEGRAM_CHAT_ID=your_chat_id_here

# Files
CONFIG_FILE=config.json
OUTPUT_FILE=hasil.json
EMPTY_WALLETS_FILE=empty_wallets.json

# Performance
DEBUG_MODE=False
CONCURRENT_WORKERS=16
EOF
    echo -e "${GREEN}✓ Created .env template${NC}"
    echo -e "${YELLOW}  Please edit .env and add your API keys${NC}"
else
    echo -e "${GREEN}✓ .env file exists${NC}"
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║                    INSTALLATION COMPLETED! ✅                        ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo -e "  1. Edit ${CYAN}.env${NC} file and add your API keys"
echo -e "  2. Make sure ${CYAN}config.json${NC} exists"
echo -e "  3. Run the program:"
echo -e "     ${YELLOW}source venv/bin/activate${NC}"
echo -e "     ${YELLOW}python3 main.py${NC}"
echo ""
echo -e "${CYAN}For detailed setup, see SETUP_GUIDE.md${NC}"
echo ""
