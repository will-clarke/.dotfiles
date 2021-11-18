on run argv

set previousClipboard to (the clipboard as text)

delay 0.1
set the clipboard to (item 1 of argv)
delay 0.1
tell application "System Events" to keystroke "v" using command down
delay 0.1

set the clipboard to previousClipboard

end run
