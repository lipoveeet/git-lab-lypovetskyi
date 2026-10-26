git config --global user.name "Bohdan Lypovetskyi"
git config --global user.email "lipoveeet@users.noreply.github.com"
git clone -q https://github.com/lipoveeet/git-lab-lypovetskyi.git && cd git-lab-lypovetskyi && git log --oneline --graph -12
---
ls
---
cat notes.txt
---
git checkout -b conflict_test
sed -i '2s/.*/Status: changed in conflict_test branch/' notes.txt
git commit -am "conflict_test: change status line"
git push -q -u origin conflict_test
---
git checkout main
sed -i '2s/.*/Status: changed in main branch/' notes.txt
git commit -am "main: change status line"
git push -q origin main
---
git merge conflict_test
---
git status
---
cat notes.txt
---
printf 'Project: git-lab-lypovetskyi\nStatus: changed in main and conflict_test (conflict resolved)\nAuthor: Bohdan Lypovetskyi\n' > notes.txt
cat notes.txt
---
git add notes.txt
git commit -m "Resolve merge conflict between main and conflict_test"
---
git log --oneline --graph -6
---
git push origin main
---
printf '# Logs\n*.log\n\n# Temporary folder\ntemp/\n' > .gitignore
cat .gitignore
---
mkdir -p temp
echo "error at line 1" > app.log
echo "debug info" > debug.log
echo "cache" > temp/cache.txt
echo "this file must be tracked" > readme_test.txt
ls -la . temp
---
git status
---
git add .
git commit -m "Add .gitignore (ignore *.log and temp/)"
git status --ignored
---
git push origin main
---
echo "console.log('WRONG CODE - this commit will be reverted');" >> app.js
git commit -am "Add wrong debug line to app.js"
tail -2 app.js
---
git log --oneline -3
---
git revert --no-edit HEAD
---
git log --oneline -4
---
tail -2 app.js
---
git show --stat HEAD
---
git push origin main
