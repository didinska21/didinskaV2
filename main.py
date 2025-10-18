#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
DIDINSKA Wallet Hunter v4.0 - Main Menu
"""
import sys
import os
from dotenv import load_dotenv

# Add utils to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'utils'))

from colors import Colors
from ui import print_header, print_box, print_loader

# Load environment
load_dotenv()

def main_menu():
    """Display main menu"""
    while True:
        print_header()
        
        menu_items = [
            f"{Colors.CYAN}1){Colors.ENDC} Wallet Generator {Colors.GRAY}(Random 12-word phrases){Colors.ENDC}",
            f"   {Colors.WHITE}→ Generate random wallets and scan for balance{Colors.ENDC}",
            f"",
            f"{Colors.CYAN}2){Colors.ENDC} Phrase Finder    {Colors.GRAY}(Search with wildcards){Colors.ENDC}",
            f"   {Colors.WHITE}→ Find wallets by partial phrase (e.g: wind * * fire){Colors.ENDC}",
            f"",
            f"{Colors.CYAN}3){Colors.ENDC} Exit             {Colors.GRAY}(Close program){Colors.ENDC}",
        ]
        
        print_box("🎯 MAIN MENU - DIDINSKA WALLET HUNTER", menu_items, Colors.BLUE)
        
        choice = input(f"{Colors.YELLOW}Choose (1-3): {Colors.ENDC}").strip()
        
        if choice == "1":
            print(f"\n{Colors.CYAN}[+] Loading Wallet Generator (Random Mode)...{Colors.ENDC}")
            print_loader("Initializing", 1)
            try:
                import wallet_gen_random
                wallet_gen_random.run()
            except KeyboardInterrupt:
                print(f"\n{Colors.YELLOW}[!] Returning to main menu...{Colors.ENDC}\n")
            except Exception as e:
                print(f"\n{Colors.RED}[!] Error: {e}{Colors.ENDC}\n")
                input("Press Enter to continue...")
        
        elif choice == "2":
            print(f"\n{Colors.CYAN}[+] Loading Phrase Finder (Wildcard Mode)...{Colors.ENDC}")
            print_loader("Initializing", 1)
            try:
                import wallet_gen_phrase
                wallet_gen_phrase.run()
            except KeyboardInterrupt:
                print(f"\n{Colors.YELLOW}[!] Returning to main menu...{Colors.ENDC}\n")
            except Exception as e:
                print(f"\n{Colors.RED}[!] Error: {e}{Colors.ENDC}\n")
                input("Press Enter to continue...")
        
        elif choice == "3":
            print(f"\n{Colors.GREEN}{'='*70}{Colors.ENDC}")
            print(f"{Colors.BOLD}{Colors.CYAN}Thank you for using DIDINSKA Wallet Hunter!{Colors.ENDC}")
            print(f"{Colors.GREEN}{'='*70}{Colors.ENDC}\n")
            print(f"{Colors.YELLOW}Stay safe and happy hunting! 🍀{Colors.ENDC}\n")
            break
        
        else:
            print(f"{Colors.RED}[!] Invalid choice. Please select 1-3.{Colors.ENDC}\n")
            input("Press Enter to continue...")

if __name__ == "__main__":
    try:
        main_menu()
    except KeyboardInterrupt:
        print(f"\n\n{Colors.YELLOW}[!] Program interrupted. Goodbye! 👋{Colors.ENDC}\n")
    except Exception as e:
        print(f"\n{Colors.RED}[!] Fatal error: {e}{Colors.ENDC}")
        import traceback
        traceback.print_exc()
