set previousClipboard to (the clipboard as text)

set the clipboard to "¯\\_(ツ)_/¯"
tell application "System Events" to keystroke "v" using command down

set the clipboard to previousClipboard
