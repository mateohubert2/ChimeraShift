#!/bin/bash
echo ""
echo "→ Pre-engagement phase"

options=("Exclude an IP address or IP range" "Exclude a service or port" "Exclude a domain" "Exclude a user" "Finish")
selected=0
menu_lines=${#options[@]}
menu_title="=== Select hosts or services to exclude ==="

clear_lines() {
    local lines=$1
    for ((i=0; i<lines; i++)); do
        tput cuu1
        tput el
    done
}

print_menu() {
    if [ "$1" = "with_title" ]; then
        echo "$menu_title"
    fi
    
    for i in "${!options[@]}"; do
        if [ "$i" -eq "$selected" ]; then
            echo -e "[\e[32mx\e[0m] ${options[$i]}"
        else
            echo -e "[ ] ${options[$i]}"
        fi
    done
}

finish=0
while [ $finish -eq 0 ]; do
    echo "$menu_title"
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

        clear_lines $((menu_lines))
        print_menu
    done

    clear_lines $((menu_lines + 1))
    
    echo ""
    echo "------------------------------"
    lines_added=2

    case "${options[$selected]}" in
        "Exclude an IP address or IP range")
            echo "→ Specify an IP address or subnet"
            echo "→ e.g: 192.168.1.15 or 192.168.1.0/24"
            lines_added=$((lines_added + 2))
            
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

            invalid_attempts=0
            read -p "Target: " target
            lines_added=$((lines_added + 1))
            
            while ! validate_target "$target"; do
                echo "❌ Invalid format"
                read -p "Target: " target
                lines_added=$((lines_added + 2))
                invalid_attempts=$((invalid_attempts + 1))
            done

            echo "✅ IP/subnet excluded: $target"
            echo "Press any key to return to the menu..."
            lines_added=$((lines_added + 2))
            read -n 1 -s
            ;;
        "Exclude a service or port")
            echo "→ Exclude a service or port"
            lines_added=$((lines_added + 1))
            
            read -p "Service/Port: " service
            lines_added=$((lines_added + 1))
            
            echo "✅ Service/Port excluded: $service"
            echo "Press any key to return to the menu..."
            lines_added=$((lines_added + 2))
            read -n 1 -s
            ;;
        "Exclude a domain")
            echo "→ Exclude a domain"
            lines_added=$((lines_added + 1))
            
            read -p "Domain: " domain
            lines_added=$((lines_added + 1))
            
            echo "✅ Domain excluded: $domain"
            echo "Press any key to return to the menu..."
            lines_added=$((lines_added + 2))
            read -n 1 -s
            ;;
        "Exclude a user")
            echo "→ Exclude a user"
            lines_added=$((lines_added + 1))
            
            read -p "User: " user
            lines_added=$((lines_added + 1))
            
            echo "✅ User excluded: $user"
            echo "Press any key to return to the menu..."
            lines_added=$((lines_added + 2))
            read -n 1 -s
            ;;
        "Finish")
            echo "→ See you soon!"
            finish=1
            ;;
    esac
    
    if [ $finish -eq 0 ]; then
        clear_lines $((lines_added))
    fi
done