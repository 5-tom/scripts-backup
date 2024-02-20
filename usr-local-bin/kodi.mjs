#!/usr/bin/env zx

import inquirer from "inquirer";
import {
	basename
	// dirname
} from "node:path";

const files = (
	await $`find . -name "*.mp4" -o -name "*.mkv" -o -name "*.srt" | fzf -m --prompt="Select the files you want to rename (Press Esc to skip): "`
).stdout
	.replace(/\n$/, "")
	.split("\n");

const prompts = files.map(function (file, index) {
	return {
		name: String(index),
		message: `Enter a new filename for ${basename(file)} (Press Enter to skip):`
	};
});
const answers = await inquirer.prompt(prompts);
console.log(answers);
