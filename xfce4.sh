#!/bin/bash
set -e
cd $HOME

#xfce4-power-manager-plugins
sudo apt install -y xfce4-terminal
#xfce4-panel --add=power-manager-plugin &
mkdir -p .config/xfce4/terminal
while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' > .config/xfce4/terminal/terminalrc
[Configuration]
FontName=Monospace 18
MiscAlwaysShowTabs=FALSE
MiscBell=FALSE
MiscBellUrgent=FALSE
MiscBordersDefault=TRUE
MiscCursorBlinks=FALSE
MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK
MiscDefaultGeometry=67x17
MiscInheritGeometry=FALSE
MiscMenubarDefault=TRUE
MiscMouseAutohide=FALSE
MiscMouseWheelZoom=TRUE
MiscToolbarDefault=FALSE
MiscConfirmClose=TRUE
MiscCycleTabs=TRUE
MiscTabCloseButtons=TRUE
MiscTabCloseMiddleClick=TRUE
MiscTabPosition=GTK_POS_TOP
MiscHighlightUrls=TRUE
MiscMiddleClickOpensUri=FALSE
MiscCopyOnSelect=FALSE
MiscShowRelaunchDialog=TRUE
MiscRewrapOnResize=TRUE
MiscUseShiftArrowsToScroll=FALSE
MiscSlimTabs=FALSE
MiscNewTabAdjacent=FALSE
MiscSearchDialogOpacity=100
MiscShowUnsafePasteDialog=TRUE
MiscRightClickAction=TERMINAL_RIGHT_CLICK_ACTION_CONTEXT_MENU
ColorForeground=#e9e9dadab2b2
ColorBackground=#1e1e20202121
BackgroundMode=TERMINAL_BACKGROUND_TRANSPARENT
BackgroundDarkness=0.990000
EOF
sudo apt install -y tesseract-ocr
xfconf-query -c xfwm4 -p /general/focus_new -s false
while read
do
	printf '%s\n' "$REPLY"
done <<'EOF' > xfce4-screenshooter-tesseract
#!/bin/bash
a=$(mktemp)
tesseract "$1" "$a" 2>/dev/null
mousepad "$a".txt
EOF
chmod +x xfce4-screenshooter-tesseract
sudo mv xfce4-screenshooter-tesseract $HOME/Documents/scripts/usr-local-bin
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/Print -s "xfce4-screenshooter -r -o $HOME/Documents/scripts/usr-local-bin/xfce4-screenshooter-tesseract"
