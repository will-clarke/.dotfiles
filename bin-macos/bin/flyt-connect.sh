#!/bin/sh

session="flyt-connect-run"

tmux new-session -d -s $session -n vim

tmux selectp -t 1
tmux send-keys "echo 'Maybe need to yarn package' && cd ~/code/justeat/flyt-connect-frontend/packages/app-connect && yarn serve " C-m

tmux splitw -v
tmux send-keys "cd ~/code/justeat/flyt-connect-backend && dev-tool docker up && open http://localhost:8082 -a Firefox" C-m
# or we could:
# open  http://localhost:8082 -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security

tmux splitw -v
tmux send-keys "cd ~/code/justeat/flyt-connect-backend && dev-tool run" C-m

tmux attach-session -t $session
