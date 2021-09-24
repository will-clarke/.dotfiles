function git-what-did-i-do
 git log --author="wmmclarke@gmail.com" --pretty=tformat: --numstat | sort -n; 
end
