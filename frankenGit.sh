alias dollar="export PS1='$ '"
alias remove_dollar="export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '"

# Creates copy of file(s) in the same directory.
# hiddenBackup profile.css creates .profile.css next to profile.css
function hiddenBackup() {
    for var in "$@"
    do
        filename=".$(basename $var)"
        copy_dest="$(dirname $var)/$filename"
        cp $var $copy_dest
    done
}
# Use only in git initalized files.
function gitHiddenBackup() {
    hiddenBackup $(git ls-files -m)
}
# Reverts all dirty files back to head.
function statusToHEAD() {
    git checkout HEAD $(git ls-files -m)
}

function gitDiff() {
    input_params=$(git ls-files -m)
    N=$1
    string=($input_params)
    param=${string[N-1]}
    git diff $param
}