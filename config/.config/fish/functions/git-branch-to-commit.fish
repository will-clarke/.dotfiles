function git-branch-to-commit
set msg (git branch --show-current | gsed -e 's/--/] /' -e 's/^/[/' -e 's/-/ /g' -e "s/\b\(.\)/\u\1/g" -e 's/ /-/')
git add .
git commit -m "$msg"
end
