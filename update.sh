#!/bin/bash
#newgrp users

for d in `find . -name 'i*' -type d`
do
    # echo "searching in $d"
    pushd $d
    if [ -d .git ]; then
       echo "Updating $d"
       git pull $*
<<<<<<< HEAD
=======
       git submodule update
>>>>>>> 27ee61b509cef32486017f32c7f01f90fa708d70
    fi
    popd
done
#(cd isu.college && touch ./pyramid.wsgi)
#sudo chown eugeneai:users -R *
