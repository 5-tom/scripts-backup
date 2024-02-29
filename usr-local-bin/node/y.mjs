#!/usr/bin/env node
import "zx/globals";

async function mpva() {
	const yn = (await $`read -ep "play with mpv? (y/n): " yn && echo -n $yn`)
		.stdout;
	switch (yn) {
		case "y":
			break;
		case "n":
			process.exit();
	}
	const toplay =
		await $`ls -d ~/Videos/* | fzf --prompt="select file to play: "`;
	await $`mpv ${toplay} --no-keepaspect-window --no-terminal 2>/dev/null &`;
}

async function defaultFunc(noOfPages) {
	const test =
		await $`echo "$(cat ~/Videos/history 2>/dev/null | sort -u)"`.pipe(
			$`fzf --prompt="search from history?: "`
		);
	if (test.stdout.replace(/\n$/, "") === "new search") {
		const search = await $`read -ep "new search: " search &&
		echo -n "$search"`;
		await $`echo ${search} >> ~/Videos/history`;
		await $`ytfzf -tL --thumb-viewer=mpv --pages=${noOfPages} ${search} |\
		xargs yt-dlp -S "height:480" -P "~/Videos"`;
		await mpva();
	} else {
		await $`ytfzf -tL --thumb-viewer=mpv --pages=${noOfPages} ${test} |\
		xargs yt-dlp -S "height:480" -P "~/Videos"`;
		await mpva();
	}
}

async function audio() {
	await $`read -ep "url [audio]: " search &&
	yt-dlp -x --audio-format mp3 -P "~/Videos" "$search"`;
	await mpva();
}

async function video() {
	await $`read -ep "url: " search &&
	yt-dlp -S "height:480" -P "~/Videos" "$search"`;
	await mpva();
}

async function channel() {
	const test =
		await $`echo "$(cat ~/Videos/history 2>/dev/null | sort -u)"`.pipe(
			$`fzf --prompt="search from history?: "`
		);
	if (test.stdout.replace(/\n$/, "") === "new search") {
		const search = await $`read -ep "channel name: " search &&
		echo -n "$search"`;
		await $`echo ${search} >> ~/Videos/history`;
		await $`ytfzf --channel-link=https://youtube.com/c/${search} |\
		ytfzf -tL --thumb-viewer=mpv -c invidious-channel |\
		xargs yt-dlp -S "height:480" -P "~/Videos"`;
		mpva();
	} else {
		await $`ytfzf --channel-link=https://youtube.com/c/${test} |\
		ytfzf -tL --thumb-viewer=mpv -c invidious-channel |\
		xargs yt-dlp -S "height:480" -P "~/Videos"`;
		await mpva();
	}
}

if (argv.a) {
	await audio();
} else if (argv.v) {
	await video();
} else if (argv.c) {
	await channel();
} else if (argv._[0]) {
	await defaultFunc(argv._[0]);
} else {
	await defaultFunc(1);
}
