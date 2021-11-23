function gl --wraps='git log --oneline --graph' --wraps='git log --pretty="%C(Yellow)%h  %C(reset)%C(Green)%cr%C(reset)%x09 %C(Cyan)%an: %C(reset)%s"' --wraps='git log --pretty="%C(Yellow)%h  %C(reset)%C(Green)%cr%C(reset)%x09 %C(Cyan)%an: %C(reset)%s%C(bold yellow)%d%C(reset)"'
  git log --pretty="%C(Yellow)%h  %C(reset)%C(Green)%cr%C(reset)%x09 %C(Cyan)%an: %C(reset)%s%C(bold yellow)%d%C(reset)" $argv;
end
