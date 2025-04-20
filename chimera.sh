#!/bin/bash
IMAGE="chimeralogo.png"
if [ ! -f "$IMAGE" ]; then
		echo "Error: File '$IMAGE' does not exist."
		exit 1
fi

if ! command -v chafa &> /dev/null; then
		echo "Error: chafa is not installed. Install it (e.g: sudo apt-get install chafa)."
		exit 1
fi

DIMENSIONS="60x30"

chafa --size=$DIMENSIONS "$IMAGE"

echo -e "\n"
echo -e "Use ChimeraShift only on systems you own or\nfor which you have explicit authorization."
echo -e "\n"
echo "Author: Matéo HUBERT -> kalilinuxesirem@gmail.com"
echo -e "\n"

options=("Perform a pentest" "See previous pentests" "Quit")
selected=0
menu_lines=${#options[@]}
menu_title="=== Select an option ==="

print_menu() {
	echo "$menu_title"
	for i in "${!options[@]}"; do
		if [ "$i" -eq "$selected" ]; then
			echo -e "[\e[32mx\e[0m] ${options[$i]}"
		else
			echo -e "[ ] ${options[$i]}"
		fi
	done
}


print_menu

while true; do
	IFS= read -rsn1 key
	if [[ $key == $'\x1b' ]]; then
		read -rsn1 -t 0.1 k1
		read -rsn1 -t 0.1 k2
		key+=$k1$k2
	fi

	case "$key" in
		$'\x1b[A')
			((selected--))
			((selected < 0)) && selected=$((${#options[@]} - 1))
			;;
		$'\x1b[B')
			((selected++))
			((selected >= ${#options[@]})) && selected=0
			;;
		"")
			break
			;;
	esac

	tput cuu $((menu_lines + 1))
	tput el
	print_menu
done

echo ""
echo "------------------------------"

case "${options[$selected]}" in
	"Perform a pentest")
		echo "→ Pentest module launched..."
		echo "→ Specify an IP address or subnet"
		echo "→ e.g: 192.168.1.15 or 192.168.1.0/24"
		read -p "Target: " target
		ip_regex='^([0-9]{1,3}\.){3}[0-9]{1,3}$'
		cidr_regex='^([0-9]{1,3}\.){3}[0-9]{1,3}/([0-9]|[12][0-9]|3[0-2])$'

		validate_target() {
			local ip=$1

			if [[ "$ip" =~ $ip_regex || "$ip" =~ $cidr_regex ]]; then
				IFS='./' read -ra parts <<< "$ip"
				for i in {0..3}; do
					if (( ${parts[i]} > 255 )); then
						return 1
					fi
				done
				return 0
			else
				return 1
			fi
		}

		while ! validate_target "$target"; do
			echo "❌ Invalid format"
			read -p "Target: " target
		done

		echo "✅ Target acquired: $target"
		;;
	"See previous pentests")
		echo "→ Loading previous reports..."
		#TODO
		;;
	"Quit")
		echo "→ See you soon!"
		;;
esac
