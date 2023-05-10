#!/bin/bash
set -e
cd $HOME

sudo apt install -y khard
ln -s $HOME/Documents/dotcontacts $HOME/.contacts
mkdir -p .config/khard
echo "alias vcf='khard file | while read line; do; cat \$line; done'" >> .zshrc
while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' > .config/khard/khard.conf
# example configuration file for khard version > 0.14.0
# place it under ~/.config/khard/khard.conf
# This file is parsed by the configobj library.  The syntax is described at
# https://configobj.readthedocs.io/en/latest/configobj.html#the-config-file-format

[addressbooks]
#[[family]]
#path = ~/.contacts/family/
#[[friends]]
#path = ~/.contacts/friends/
[[contacts]]
path = ~/.contacts/default/

[general]
debug = no
default_action = list
# These are either strings or comma seperated lists
#editor = vim, -i, NONE
editor = nano
merge_editor = vimdiff

[contact table]
# display names by first or last name: first_name / last_name / formatted_name
display = first_name
# group by address book: yes / no
group_by_addressbook = no
# reverse table ordering: yes / no
reverse = no
# append nicknames to name column: yes / no
show_nicknames = no
# show uid table column: yes / no
show_uids = yes
# sort by first or last name: first_name / last_name / formatted_name
sort = last_name
# localize dates: yes / no
localize_dates = yes
# set a comma separated list of preferred phone number types in descending priority
# or nothing for non-filtered alphabetical order
preferred_phone_number_type = pref, cell, home
# set a comma separated list of preferred email address types in descending priority
# or nothing for non-filtered alphabetical order
preferred_email_address_type = pref, work, home

[vcard]
# extend contacts with your own private objects
# these objects are stored with a leading "X-" before the object name in the vcard files
# every object label may only contain letters, digits and the - character
# example:
#   private_objects = Jabber, Skype, Twitter
# default: ,  (the empty list)
private_objects = Jabber, Skype, Twitter
# preferred vcard version: 3.0 / 4.0
preferred_version = 3.0
# Look into source vcf files to speed up search queries: yes / no
search_in_source_files = no
# skip unparsable vcard files: yes / no
skip_unparsable = no
EOF
