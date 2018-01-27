#!/bin/bash
targetdir=".git/hooks"
fname="pre-commit"
target=$targetdir/$fname
if [ ! -s $target ];then
    touch $target
    echo "#!/bin/sh" > $target
    chmod 755 $target
fi

# TODO Find a way to test directly
# TODO handle errors (that makes wc results in 0)
r=$(tr '\n' ' ' < $target | grep -f <(tr '\n' ' ' < $fname) | wc -l)
if [ $r -eq 0 ];then
    cat $fname >> $target
fi
