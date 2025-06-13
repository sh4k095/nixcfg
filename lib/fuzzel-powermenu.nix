{ pkgs }:

pkgs.writeShellScriptBin "fuzzel-powermenu" ''
  SELECTION="$(printf "🔐 Lock\n💤 Suspend\n🔄 Log out\n💀 Shutdown\n♻️ Reboot\n👹 Reboot to UEFI" | fuzzel --dmenu -l 6 -p "Power Menu: ")"
  
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
