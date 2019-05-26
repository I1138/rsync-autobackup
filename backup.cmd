#!/usr/bin/bash

# abort on command failure
set -e
set -o pipefail

#sync files
echo "Syncing files"
rsync -avzhP $1 $2

#delete files not accessed in 6 months (183 days) from local
echo "Removing local copies of old files"
find  $1 -not -path '*/\.*' -type f -atime +2 -delete | cat

#delete empty directories
echo "Removing empty folders"
find $1 -not -path '*/\.*' -type d -empty -delete | cat
