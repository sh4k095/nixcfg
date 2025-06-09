{ pkgs }:

pkgs.writeShellScriptBin "fuzzel-powermenu" ''
  SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Reboot\n5 - Reboot to UEFI\n6 - Hard reboot\n7 - Shutdown" | fuzzel --dmenu -l 7 -p "Power Menu: ")"
  
  case $SELECTION in
	  *"🔐 Lock")
	  	swaylock;;
	  *"💤 Suspend")
	  	systemctl suspend;;
	  *"🔄 Log out")
	  	swaymsg exit;;
	  *"💀 Shutdown")
	  	systemctl poweroff;;
	  *"♻️ Reboot")
	  	systemctl reboot;;
	  *"👹 Reboot to UEFI")
	  	systemctl reboot --firmware-setup;;
  esac
''
