#!/usr/bin/env zx

let codes;
try {
	codes = (await $`lsusb`.pipe($`grep Pixel`)).stdout;
	codes = codes.split(" ")[5];
} catch {
	console.log("no device");
	process.exit();
}

const vid = codes.split(":")[0];
const pid = codes.split(":")[1];

await $`sudo gio trash /etc/udev/rules.d/51-android.rules`;
await $`sudo touch /etc/udev/rules.d/51-android.rules`;
await $`echo "SUBSYSTEM==\\"usb\\", ATTR{idVendor}==\\"${vid}\\", ATTR{idProduct}==\\"${pid}\\", MODE=\\"0666\\", GROUP=\\"plugdev\\"" | sudo tee -a /etc/udev/rules.d/51-android.rules`;
await $`sudo udevadm control --reload-rules`;
console.log("re-plug your device");
