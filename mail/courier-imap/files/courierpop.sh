#! /bin/sh
#
# $NetBSD: courierpop.sh,v 1.4 2002/01/22 22:08:53 jlam Exp $
#
# Courier POP services daemon
#
# PROVIDE: courierpop
# REQUIRE: authdaemond

if [ -e /etc/rc.subr ]
then
	. /etc/rc.subr
fi

name="courierpop"
rcvar=${name}
command="@PREFIX@/libexec/courier/couriertcpd"
ctl_command="@PREFIX@/libexec/courier/pop3d.rc"
pidfile="/var/run/pop3d.pid"
required_files="@PKG_SYSCONFDIR@/pop3d @PKG_SYSCONFDIR@/pop3d-ssl"

start_cmd="courier_doit start"
stop_cmd="courier_doit stop"

courier_doit()
{
	action=$1
	case ${action} in
	start)	echo "Starting ${name}." ;;
	stop)	echo "Stopping ${name}." ;;
	esac

	${ctl_command} ${action}
}

if [ -e /etc/rc.subr ]
then
	load_rc_config $name
	run_rc_command "$1"
else
	echo -n " ${name}"
	${start_cmd}
fi
