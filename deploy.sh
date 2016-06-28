#!/bin/bash

echo -e "\033[0;32mdeploying updates to github...\033[0m"

hugo --buildDrafts

cd public
git add -A

msg="rebuilding site `date`"
if [ $# -eq 1 ]; then
	msg="$1"
fi
git commit -m "$msg"

git push origin master

cd ..
