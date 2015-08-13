#!/bin/sh
CGIFILE="$HOME/[your website directory]/cgi-bin/php.cgi"
INIFILE="$HOME/[your website directory]/cgi-bin/php.ini"
rsync -a /dh/cgi-system/php5.cgi "$CGIFILE"
# REMOVE THE FOLLOWING LINE TO CREATE THE UPDATE-ONLY SCRIPT:
cp /etc/php5/cgi/php.ini "$INIFILE"
perl -p -i -e '
s/.*post_max_size.*/post_max_size = 10M/;
s/.*upload_max_filesize.*/upload_max_filesize = 10M/;
' "$INIFILE"