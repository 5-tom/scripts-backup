#!/bin/bash
set -e
cd $HOME

sudo apt install -y curl libarchive-tools
curl -O https://dl.google.com/android/repository/platform-tools_r33.0.3-linux.zip
bsdtar xvf platform-tools_r33.0.3-linux.zip
sudo cp platform-tools/adb /usr/local/bin
gio trash platform-tools platform-tools_r33.0.3-linux.zip
echo "alias pusha='adb push * /sdcard'" >> .zshrc
echo "alias push='adb push \$(fzf) /sdcard'" >> .zshrc
while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' > adb-fix
#!/bin/bash
codes="$(lsusb | grep Pixel | cut -d' ' -f6)"
if test $codes
then
true
else
echo "no device"
exit
fi
vid=$(echo "$codes" | cut -d':' -f1)
pid=$(echo "$codes" | cut -d':' -f2)
sudo gio trash /etc/udev/rules.d/51-android.rules
sudo touch /etc/udev/rules.d/51-android.rules
echo "SUBSYSTEM==\\"usb\\", ATTR{idVendor}==\\""$vid"\\", ATTR{idProduct}==\\""$pid"\\", MODE=\\"0666\\", GROUP=\\"plugdev\\"" | sudo tee -a /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
echo "re-plug your device"
EOF
sudo mv adb-fix /usr/local/bin
