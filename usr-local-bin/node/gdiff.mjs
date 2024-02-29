#!/usr/bin/env node
import "zx/globals";
//https://regex101.com/
//$.verbose = false

const fetchyn = (
	await $`read -p "Run git fetch? (y/n): " fetchyn && echo -n $fetchyn`
).stdout;
if (fetchyn === "y") {
	await $`git fetch`;
}

let branchOne = (await $`git branch -a`).stdout;
branchOne = branchOne
	.replace(/.*remotes\//gm, "")
	.replace(/^\s*/gm, "")
	.replace(/\* /gm, "");
branchOne = (
	await $`echo ${branchOne} | fzf --prompt="Select branch one: "`
).stdout.replace(/\n$/, "");

let one = (
	await $`git log --pretty=oneline ${branchOne}`.pipe(
		$`fzf --prompt="Select commit hash from ${branchOne} : "`
	)
).stdout;
one = one.split(" ")[0];

let branchTwo = (await $`git branch -a`).stdout;
branchTwo = branchTwo
	.replace(/.*remotes\//gm, "")
	.replace(/^\s*/gm, "")
	.replace(/\* /gm, "");
branchTwo = (
	await $`echo ${branchTwo} | fzf --prompt="Select branch two: "`
).stdout.replace(/\n$/, "");

let two = (
	await $`git log --pretty=oneline ${branchTwo}`.pipe(
		$`fzf --prompt="Select commit hash from ${branchTwo} : "`
	)
).stdout;
two = two.split(" ")[0];

await $`git difftool -t meld -d ${one} ${two}`;
