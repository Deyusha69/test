#!/bin/bash

echo "This script will install Thorium Browser (SSE3 and regular), Firefox, and Brave Browser."
echo "1. Thorium Browser (SSE3 Version on Older Computers)"
echo "2. Thorium Browser (regular)"
echo "3. Firefox"
echo "4. Brave Browser"
echo "5. Cancel installation"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        paru -S thorium-browser-sse3-bin
        ;;
    2)
        paru -S thorium-browser-bin
        ;;
    3)
        sudo pacman -S firefox
        ;;
    4)
        paru -S brave-bin
        ;;
    5)
        echo "Installation canceled."
        exit 1
        ;;
    *)
        echo "Invalid choice. Installation canceled."
        exit 1
        ;;
esac

echo "This script will install touchpad gestures if you using a desktop type no:"
echo "1. wmctrl"
echo "2. xdotool"
echo "3. paru"
echo "4. libinput-gestures"
echo "5. Add user to 'input' group"

read -p "Do you want to continue? (yes/no): " confirmation

if [ "$confirmation" == "yes" ]; then
    sudo pacman -S wmctrl xdotool
    paru -S libinput-gestures
    sudo gpasswd -a $USER input
    echo "Installation completed."
else
    echo "Installation canceled."
fi

logo "Installing Themes"				 
git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
cd Tokyo-Night-GTK-Theme/
sudo cp -r themes/Tokyonight-Dark-BL-LB /usr/share/themes/
cd
printf "%s%sDone!!%s\n" "${BLD}" "${CGR}" "${CNC}"
sleep 2	  
clear

logo "Setup TimeZone Asia/Manila.."
sudo timedatectl set-timezone Asia/Manila >/dev/null 2>&1
printf "%s%sSuccesfully!%s\n" "${BLD}" "${CGR}" "${CNC}"
sleep 2
clear
