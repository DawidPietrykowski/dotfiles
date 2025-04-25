#!/usr/bin/fish
set command $argv[1]
set file (realpath $argv[2])
set line $argv[3]
#Enter the file repository
cd (dirname $file)
cd (git rev-parse --show-toplevel)
switch $command
    case blame
        set sha (git blame --root -L$line,$line -- $file | cut -d' ' -f 1)
        git log --pretty=format:"%h %ad %ae %s" -n 1 --date=short $sha
    case lazygit
        set dir (realpath .)
        i3-msg "exec --no-startup-id ghostty --working-directory=$dir --class=com.i3-popup.lazygit -e lazygit"
    case run_script
        set dir (realpath (dirname $file))
        ./.helix/run_script.sh $dir
end

