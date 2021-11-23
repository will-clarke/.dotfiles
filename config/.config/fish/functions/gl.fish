function gl --wraps='git log --oneline --graph' --wraps='git log --pretty="%C(Yellow)%h  %C(reset)%C(Green)%cr%C(reset)%x09 %C(Cyan)%an: %C(reset)%s"' --description 'alias gl=git log --pretty="%C(Yellow)%h  %C(reset)%C(Green)%cr%C(reset)%x09 %C(Cyan)%an: %C(reset)%s"'
  git log --pretty="%C(Yellow)%h  %C(reset)%C(Green)%cr%C(reset)%x09 %C(Cyan)%an: %C(reset)%s" $argv; 
end
