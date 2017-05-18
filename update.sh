#!/bin/bash
#newgrp users

for d in `find . -name 'i*' -type d`
do
    # echo "searching in $d"
    if [ -d .git ]; then
       echo "Updating $d"
       (cd $d && git pull origin master)
    fi
done
#(cd isu.college && touch ./pyramid.wsgi)
#sudo chown eugeneai:users -R *
