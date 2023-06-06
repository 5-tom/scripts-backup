#!/bin/bash
set -e
cd $HOME

sudo apt install -y khal
ln -s $HOME/Documents/dotlocal-share-khal .local/share/khal
mkdir -p .config/khal
while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' > .config/khal/config
[calendars]
	[[calendar]]
		path = ~/.local/share/khal/calendars/private/default/
	[[birthdays]]
		path = ~/.contacts/default/
		type = birthdays
		readonly = True
		color = light cyan

[locale]
timeformat = %H:%M
dateformat = %d-%m-%y
longdateformat = %d-%m-%y
datetimeformat = %d-%m-%y %H:%M
longdatetimeformat = %d-%m-%y %H:%M
EOF
echo "alias 6mo='khal --color list today \$(date +%d-%m-%y --date 6months) --format "{tab}{start-end-time-style}\" \"{calendar-color}{title}{nl}" 2>/dev/null | tac'" >> .zshrc
