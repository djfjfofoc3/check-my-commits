# Remove-Item -Recurse -Force .git
Write-Output "Initializing Git Repository"
git init;
Write-Output "Resetting History"
git checkout --orphan tmp;
git branch -D main;
git checkout --orphan main;
git branch -D tmp;
Write-Output "Adding Files"
git add .;
Write-Output "Making empty-message commit"
$env:GIT_COMMITTER_DATE = "1970-01-01T00:00:00.000Z"
git commit -a --allow-empty-message -m " " --date="$env:GIT_COMMITTER_DATE";
Write-Output "Committing all commits in COMMITS.txt"
$env:GIT_COMMITTER_DATE = "1987-7-27T00:00:00.000Z"
foreach($line in Get-Content .\COMMITS.txt) {
  git commit -m "$line" --allow-empty --allow-empty-message --date="$env:GIT_COMMITTER_DATE"
}
Write-Output "Pushing to origin, if available"
git push --force -u origin main
