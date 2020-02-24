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

#eof# app-functions.sh
