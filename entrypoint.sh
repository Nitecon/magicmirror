#!/bin/sh
for i in $(ls /data/mm/modules/)
do
        ln -s /data/mm/modules/$i /data/MagicMirror/modules/$i
        echo "installing node modules for $i"
        cd /data/mm/modules/$i
        npm install --omit-dev && npm update
done
cp -f /data/mm/config/* /data/MagicMirror/config/

cd /data/MagicMirror/
npm run server