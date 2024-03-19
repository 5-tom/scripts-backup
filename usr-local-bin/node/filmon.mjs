#!/usr/bin/env node
import "zx/globals";

const url = await $`yt-dlp https://www.filmon.com/tv/bbc-news --get-url`;
const command = JSON.stringify({ command: ["loadfile", `${url}`] });
await $`echo ${command}`.pipe($`socat - /tmp/mpvsocket`);

while (true) {
	let err;
	try {
		err = (await $`grep -q "HTTP error 403 Forbidden" /home/tom/mpvtest`)
			.exitCode;
	} catch {}
	if (err === 0) {
		const url = await $`yt-dlp https://www.filmon.com/tv/bbc-news --get-url`;
		const command = JSON.stringify({ command: ["loadfile", `${url}`] });
		await $`echo ${command}`.pipe($`socat - /tmp/mpvsocket`);
		await $`echo "{ \"command\": [\"set_property\", \"pause\", false] }"`.pipe(
			$`socat - /tmp/mpvsocket`
		);
		await $`echo -n "" > /home/tom/mpvtest`;
	}
	await sleep(2000);
}
