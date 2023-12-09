#Deploy on click
git add . && git commit -am "sync" && git push && git tag 0.0.2 -f && git push --tags -f

#new branch
git checkout -b 0.0.2 && git push --set-upstream origin 0.0.2

