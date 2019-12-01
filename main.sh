#!/bin/bash

# For macOS user: make sure your bash is after v4.0 for `readarray` to work.

maindir="/root/curfew" ; mkdir $maindir/log
logfile=$maindir/log/$(date "+%Y-%m-%dT%H:%M:%S%z").txt
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3 RETURN
exec 1>$logfile 2>&1
# Everything below will go to the file '$logfile':

# readarray is supported only after bash 4.0
readarray -t app_list < $maindir/list/app_list
readarray -t user_list < $maindir/list/user_list
readarray -t url_list < $maindir/list/url_list
FunTimeStarts=170000 ; FunTimeEnds=173000
CurfewStarts=174000 ; CurfewEnds=235959
MidnightWorkStarts=000000 ; MidnightWorkEnds=060000

if_within() {
	now=$(date +"%H%M%S") ; Start=$1 ; End=$2 ;
	[[ $Start < $End ]] && over_midnight=false || over_midnight=true
	if $over_midnight ; then
		[[ $Start < $now || $now < $End ]] && echo true || echo false
	else	[[ $Start < $now && $now < $End ]] && echo true || echo false
	fi
}

ban_url() {
	echo "execute: ban_url"
	if [[ ${#url_list[@]} != 0 ]] ; then
		for url in "${url_list[@]}"; do
			echo "ban_url $url"
			if ! grep -q $url /etc/hosts ; then
				echo "127.0.0.1 $url" >> /etc/hosts
			fi
		done
	fi
}

unban_url() {
	echo "execute: unban_url"
	if [[ ${#url_list[@]} != 0 ]] ; then
		for url in "${url_list[@]}"; do
			sed -i -e "/$url/d" /etc/hosts ; echo "unban_url $url"
		done
	fi
}

suspend_user() {
	echo "execute: suspend_user"
	if [[ ${#user_list[@]} != 0 ]] ; then
		for user in "${user_list[@]}"; do
			pkill -STOP -u "$user" ; echo "suspend_user $user"
		done
	fi
}

continue_user() {
	echo "execute: continue_user"
	if [[ ${#user_list[@]} != 0 ]] ; then
		for user in "${user_list[@]}"; do
			pkill -CONT -u "$user" ; echo "continue_user $user"
		done
	fi
}

kill_app() {
	echo "execute: kill_app"
	if [[ ${#app_list[@]} != 0 ]] ; then
		for app in "${app_list[@]}"; do
			pkill "$app" ; echo "kill_app $app"
		done
	fi
}

main() {
	while true; do
		echo "current: $(date "+%Y-%m-%dT%H:%M:%S%z")"
		now=$(date +"%H%M%S") ; sleep 5
		##### if [[ $(date +%u) -lt 7 ]] ; then 				# restrictions on non-Sundays
		if [[ $(date +%u) -lt 8 ]] ; then 					# restrictions everyday!
			echo "message: restrictions for non-Sundays."
			if $(if_within $FunTimeStarts $FunTimeEnds) ; then		# during fun-time
				echo "message: fun-time on"
				unban_url
			elif $(if_within $MidnightWorkStarts $MidnightWorkEnds)	; then	# during midnight-work-time
				echo "message: midnightwork-time on"
				unban_url
			else								# during neither
				echo "message: neither fun-time nor midnightwork-time is on"
				ban_url
				kill_app
			fi
			if $(if_within $CurfewStarts $CurfewEnds) ; then		# during curfew
				echo "message: curfew on"
				suspend_user
			else								# not during curfew
				echo "message: curfew off"
				continue_user
			fi

		##### else									# no restrictions on Sundays
		##### 	echo "message: no restriction for Sundays."
		##### 	unban_url
		##### 	continue_user
		fi
	done
}

main

exit
