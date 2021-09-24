function git-what-did-i-do --description "list the files I added most code to"
    git log --author="wmmclarke@gmail.com" --pretty=tformat: --numstat | sort -n
end
