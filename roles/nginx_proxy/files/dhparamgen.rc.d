#!/bin/sh
#
# PROVIDE: dhparamgen
# REQUIRE: DAEMON
# KEYWORD: shutdown
#
# Add the following lines to /etc/rc.conf to enable dhparamgen:
#
# dhparamgen_enable (bool):             Set it to "YES" to enable dhparamgen
# dhparamgen_opensslpath (str):         Set the path of the openssl binary to use
# dhparamgen_pempath (str):             Set the path to keep the dhparam files in
# dhparamgen_pemcount (str):            Set the number of dhparams to keep ready
# dhparamgen_logfile (str):             Set the logfile path
#
. /etc/rc.subr

name="dhparamgen"
rcvar=dhparamgen_enable

load_rc_config $name

: ${dhparamgen_enable="NO"}
: ${dhparamgen_opensslpath="/usr/bin/openssl"}
: ${dhparamgen_pempath="/usr/local/etc/ssl/"}
: ${dhparamgen_pemcount="10"}
: ${dhparamgen_logfile:="/var/log/dhparamgen.log"}

command="/usr/local/bin/dhparamgen"
command_args="$dhparamgen_pempath $dhparamgen_opensslpath $dhparamgen_pemcount >> $dhparamgen_logfile 2>&1 &"
command_interpreter="/bin/sh"
run_rc_command "$1"

