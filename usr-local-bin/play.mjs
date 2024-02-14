#!/usr/bin/env zx

let fileToPlay;
if(argv.l){
	fileToPlay = argv.l;
} else {
	fileToPlay = await $`fzf`;
};

$`nohup mpv --no-keepaspect-window --no-terminal ${fileToPlay} &>/dev/null & disown`;
