#!/bin/sh

set -eu
set -x

# Start rsyslog (background)
/usr/sbin/rsyslogd

# Start sshd (foreground)
exec /usr/sbin/sshd -D
