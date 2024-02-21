#!/usr/bin/env zx

import inquirer from "inquirer";
import { extname, basename, dirname } from "node:path";

const files = (
	await $`find . -name "*.mp4" -o -name "*.mkv" -o -name "*.srt" | fzf -m --prompt="Select the files you want to rename (Press Esc to skip): "`
).stdout
	.replace(/\n$/, "")
	.split("\n");

const answers = await inquirer.prompt(
	files.map(function (file, index) {
		return {
			name: String(index),
			message: `Enter a new filename for ${basename(
				file
			)} (Press Enter to skip):`
		};
	})
);

const move = files.map(function (oldPath, index) {
	return {
		oldPath,
		newPath: `${dirname(oldPath)}/${answers[index]}${extname(oldPath)}`
	};
});

move.forEach(async function (paths) {
	await $`mv ${paths.oldPath} ${paths.newPath}`;
});

console.log(move);
