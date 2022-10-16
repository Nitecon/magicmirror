#!/bin/sh
for i in $(ls /data/mm/modules/) do;
        ln -s /data/mm/modules/$i /data/MagicMirror/modules/$i
        echo "installing node modules for $i"
        cd /data/mm/modules/$i
        npm install && npm update
done
cp -fR /data/mm/config/ /data/MagicMirror/config/

cd /data/MagicMirror/
npm run server