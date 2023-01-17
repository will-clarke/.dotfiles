function git-branch-to-commit
    set msg (git branch --show-current | gsed -e 's/-/ /g' -e "s/\b\(.\)/\u\1/g")
    if string match '--' (git branch --show-current)
        set msg (git branch --show-current | gsed -e 's/--/] /' -e 's/^/[/' -e 's/-/ /g' -e "s/\b\(.\)/\u\1/g" -e 's/ /-/')
    end
    git commit -m "$msg"
end
