#!/bin/bash
save_file=$(mktemp)
all_file=$(mktemp)

git branch --no-color --format='%(refname:short)' > $save_file
git branch --no-color --format='%(refname:short)' > $all_file
echo "--- DELETE LINES FOR BRANCHES YOU DON'T WANT TO KEEP ---" >> $save_file
vim $save_file

grep -vf $save_file $all_file | xargs git branch -D

rm ${save_file} ${all_file}
