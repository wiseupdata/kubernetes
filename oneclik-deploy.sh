#Deploy on click
git add . && git commit -am "sync" && git push && git tag 0.0.1 -f && git push --tags -f

#new branch
git checkout -b 0.0.1


