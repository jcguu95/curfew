#!/bin/sh -e
#
# rc.local
#
# This script is added by the installer of curfew.sh!

exec 2> /tmp/rc.local.log	# send stderr from rc.local to a log file
exec 1>&2			# send stdout to the same log file
set -x				# tell sh to display commands before execution

bash /root/curfew/main

exit 0
