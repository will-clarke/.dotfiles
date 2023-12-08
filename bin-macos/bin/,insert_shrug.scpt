set previousClipboard to (the clipboard)

delay 0.1
set the clipboard to "¯\\_(ツ)_/¯"
delay 0.1
tell application "System Events" to keystroke "v" using command down
delay 0.1

set the clipboard to previousClipboard
