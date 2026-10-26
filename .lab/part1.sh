git --version
---
git config --global user.name "Bohdan Lypovetskyi"
git config --global user.email "lipoveeet@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global --get-regexp '^user\.'
---
git clone https://github.com/lipoveeet/git-lab-lypovetskyi.git
---
cd git-lab-lypovetskyi && ls -la && git log --oneline
---
cat > index.html <<'H'
<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Git lab - Lypovetskyi</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Лабораторна робота №3: Git та GitHub</h1>
  <p id="greeting"></p>
  <script src="app.js"></script>
</body>
</html>
H
printf 'body { font-family: Arial, sans-serif; margin: 40px; background: #f5f7fa; }\nh1 { color: #24292f; }\n' > style.css
printf "document.getElementById('greeting').textContent = 'Hello from Bohdan Lypovetskyi!';\n" > app.js
printf 'Project: git-lab-lypovetskyi\nStatus: initial version\nAuthor: Bohdan Lypovetskyi\n' > notes.txt
ls
---
git status
---
git add .
git commit -m "Add simple web page and notes"
---
git push origin main
---
git log --oneline
---
git checkout -b feature_7
---
cat >> app.js <<'J'

function sum(a, b) {
  return a + b;
}
console.log('feature_7: 2 + 3 =', sum(2, 3));
J
echo "Feature 7: sum() function in app.js" > feature_7.txt
git status --short
---
git add .
git commit -m "feature_7: add sum() function"
---
git push -u origin feature_7
---
git branch -a
---
git checkout main
git checkout -b development
---
cat > about.html <<'H'
<!DOCTYPE html>
<html lang="uk"><head><meta charset="UTF-8"><title>Про проєкт</title></head>
<body><h1>Про проєкт</h1><p>Навчальний репозиторій для вивчення Git.</p></body></html>
H
git add about.html
git commit -m "development: add about page"
---
cat > contacts.html <<'H'
<!DOCTYPE html>
<html lang="uk"><head><meta charset="UTF-8"><title>Контакти</title></head>
<body><h1>Контакти</h1><p>Липовецький Богдан, ПІ-23-03</p></body></html>
H
git add contacts.html
git commit -m "development: add contacts page"
---
git log --oneline --graph --all
---
git push -u origin development
