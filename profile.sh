#!/bin/bash
set -e
cd $HOME

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> .profile
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

alias wget='wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts'

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
EOF

while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' >> .zshrc
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

alias wget='wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts'

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
EOF

source .profile
mkdir -p "$XDG_STATE_HOME"/bash
echo 'export HISTFILE="$XDG_STATE_HOME"/bash/history' >> .bashrc
