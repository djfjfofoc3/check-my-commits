#!/bin/bash
# Copyright © 2022 MokiyCodes
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
#   documentation files (the “Software”), to deal in the Software without restriction, including without
#   limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
#   the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
#   conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions
#   of the Software.
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
#   TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#   THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
#   CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#   DEALINGS IN THE SOFTWARE.
#
# rm -rf .git
# git init
echo "Initializing Git Repository"
git init;
echo "Resetting History"
git checkout --orphan tmp;
git branch -D main;
git checkout --orphan main;
git branch -D tmp;
echo "Adding Files"
git add .;
echo "Making empty-message commit"
GIT_COMMITTER_DATE="1970-01-01T00:00:00.000Z"
git commit -a --allow-empty-message -m " " --date="$GIT_COMMITTER_DATE";
echo "Committing all commits in COMMITS.txt"
GIT_COMMITTER_DATE="1987-7-27T00:00:00.000Z"
while read in; do git commit -m "$in" --allow-empty --allow-empty-message --date="$GIT_COMMITTER_DATE"; done < COMMITS.txt
echo "Pushing to origin, if available"
git push --force -u origin main
