#!/usr/bin/env bash

# colors settings
COLOR_NC='\e[0m'
COLOR_WHITE='\e[1;37m'
COLOR_RED='\e[1;31m'
COLOR_YELLOW='\e[1;33m'

# msg settings
MSG_YN='inline: y n '
MSG_OPTION_Y='y'
MSG_OPTION_N='n'

# functions

# msg( $1:message, $2:color:valid_values:<none>|white|red|yellow )
#
msg() {
	case "$2" in
		'white') MSG_COLOR="$COLOR_WHITE";;
		'yellow') MSG_COLOR="$COLOR_YELLOW";;
		'red') MSG_COLOR="$COLOR_RED";;
		*) MSG_COLOR="$COLOR_NC";;
	esac
	echo -ne "${MSG_COLOR}$1${COLOR_NC}"
}

# msg_error( $1:message )
#
msg_title() {
	msg "\n$1\n\n" 'yellow'
}

# msg_error( $1:message )
#
msg_bold() {
	msg "$1" 'white'
}

# msg_warning( $1:message )
#
msg_warning() {
	msg "$1" 'red'
}

# msg_error( $1:message )
#
msg_error() {
	msg_warning "\nerror: "
	msg_bold "$1\n\n"
	exit
}

# msg_success( $1:message )
#
msg_success() {
	msg_title "$1"
	exit
}

# read_option( 
#   $1:message, 
#   $2:menu_type:(inline|list):value_list_delimit_space,  
#   $3:default_value 
# )
# Function: export read value to environemt variable OPTION
#
read_OPTION_var() {
	MSG_MESSAGE="$1"
	MSG_MENU_TYPE=$(echo "$2" | cut -f1 -d':')
	MSG_MENU_OPTIONS="$(echo "$2" | cut -f2 -d':')"
	MSG_DEFAULT_VALUE="$3"
	OPTION=''

	# for list options, ex. ' prod staging dev ' => prod | staging | dev
	#
	if [ "$MSG_MENU_TYPE" = 'list' ]; then
		msg "Options: "
		FIRST=1
		for M in $(echo "$MSG_MENU_OPTIONS")
		do
			[ "$M" = "" ] && continue

			[ $FIRST -eq 0 ] && echo -ne ' | '
			FIRST=0

			msg "$M"
		done
		echo
		echo
	fi


	# for inline option, ex. ' y n ' => (y|n)
	#
	while true
	do
		msg_bold "$MSG_MESSAGE"

		if [ "$MSG_MENU_TYPE" = 'inline' ]; then
			msg_bold ' ('
			FIRST=1
			for M in $(echo "$MSG_MENU_OPTIONS")
			do
				[ $FIRST -eq 0 ] && echo -ne '/'
				msg_bold "$M"
				FIRST=0
			done
			msg_bold ')'
		fi

		msg " (default="
		msg_bold "$MSG_DEFAULT_VALUE"
		msg ") "
		read -p "" OPTION
		if [ "$OPTION" = "" ];then
			export OPTION="$MSG_DEFAULT_VALUE"
			break;
		fi

		if [ "$MSG_MENU_TYPE" = 'text' ]; then
			break
		fi

		if [ $(echo " $MSG_MENU_OPTIONS " | grep -c "$OPTION") -ne 0 ]; then
			break
		fi

		msg_warning "\n\"$OPTION\" is invalid option. "
		msg "Please try again or type \"ENTER\" for default value.\n\n"
	done

	echo
}

# Author: Alexander Klimetschek
# reference: https://unix.stackexchange.com/questions/146570/arrow-key-enter-menu
# Renders a text based list of options that can be selected by the
# user using up, down and enter keys and returns the chosen option.
#
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
function select_option {

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = $ESC[A ]]; then echo up;    fi
                         if [[ $key = $ESC[B ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "$opt"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}

press_continue() {
  msg  "Press key enter or return to continue..." 'cyan'
  read -t3
}
#eof# app-functions.sh
