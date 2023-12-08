#!/usr/bin/env sh

reponame=$(basename "$PWD")

for remote in \
	"git@github.com:will-clarke/$reponame" \
	"git@git.sr.ht:~will-clarke/$reponame"; do
	git remote set-url --delete --push origin "$remote" 2>/dev/null
	git remote set-url --add --push origin "$remote"
done

git remote show origin
