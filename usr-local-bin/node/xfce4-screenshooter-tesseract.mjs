#!/usr/bin/env node
import "zx/globals";

// xfce4-screenshooter -r -o ./xfce4-screenshooter-tesseract.mjs

const a = await $`mktemp`;
await $`tesseract ${argv._[0]} ${a} 2>/dev/null`;
await $`mousepad ${a}.txt`;
