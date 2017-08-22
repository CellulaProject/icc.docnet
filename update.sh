#!/bin/bash
#newgrp users

for d in `find . -name 'i*' -type d`
do
    # echo "searching in $d"
    pushd $d
    if [ -d .git ]; then
       echo "Updating $d"
       git pull $*
       git submodule update
    fi
    popd
done
#(cd isu.college && touch ./pyramid.wsgi)
#sudo chown eugeneai:users -R *
