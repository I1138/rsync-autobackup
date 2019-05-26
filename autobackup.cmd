#!/usr/bin/bash

#config

sources=~/.backup/.sources.conf
echo "read sources from $sources"

destFile=$(cat ~/.backup/.dest.conf)
echo "read destination as $destFile"

echo "starting backup"

for i in $(cat $sources)
do
  echo "backing up $i to $destFile"
  backup $i $destFile
done

echo "backup complete"
