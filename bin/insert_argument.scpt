on run argv

set previousClipboard to (the clipboard as text)

set the clipboard to (item 1 of argv)
tell application "System Events" to keystroke "v" using command down

set the clipboard to previousClipboard

end run
