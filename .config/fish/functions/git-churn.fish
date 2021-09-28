function git-churn --description 'list files which have churned most'
    git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10
end
