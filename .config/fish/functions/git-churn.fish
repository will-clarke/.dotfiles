function git-churn
 git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10; 
end
