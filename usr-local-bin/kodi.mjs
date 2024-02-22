#!/usr/bin/env zx

import inquirer from "inquirer";
import { extname, basename, dirname } from "node:path";

// const files = (
// 	await $`find . -name "*.mp4" -o -name "*.mkv" -o -name "*.srt" | fzf -m --prompt="Select the files you want to rename (Press Esc to skip): "`
// ).stdout
// 	.replace(/\n$/, "")
// 	.split("\n");

// const answers = await inquirer.prompt(
// 	files.map(function (file, index) {
// 		return {
// 			name: String(index),
// 			message: `Enter a new filename for ${basename(
// 				file
// 			)} (Press Enter to skip):`
// 		};
// 	})
// );

// const move = files.map(function (oldPath, index) {
// 	return {
// 		oldPath,
// 		newPath: `${dirname(oldPath)}/${answers[index]}${extname(oldPath)}`
// 	};
// });

// move.forEach(async function (paths) {
// 	await $`mv ${paths.oldPath} ${paths.newPath}`;
// });

const dir = (
	await inquirer.prompt([
		{
			name: "dir",
			message:
				"Is your destination folder in /home or /media? (Type either home or media):"
		}
	])
).dir;

let outDir;
switch (dir) {
	case "home":
		outDir = $`find /home -type d | fzf --prompt="Select destination folder: "`;
		break;
	case "media":
		outDir = $`find /media -type d | fzf --prompt="Select destination folder: "`;
		break;
	default:
		console.log("You can only pick home or media. Exiting...");
		process.exit(1);
}

console.log(dir);
