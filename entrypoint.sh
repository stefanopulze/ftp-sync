#!/bin/sh -l

SECONDS=0

## Default excludes
defaultExcludes="-x ^\.git/$ -x ^\.github/$"

lftp "${INPUT_SERVER}" -u "${INPUT_USERNAME},${INPUT_PASSWORD}" \
 -e "set ftp:use-feat off; set ftp:ssl-force $INPUT_FORCESSL; set ftp:ssl-allow ${INPUT_ALLOWSSL}; mirror --reverse --continue --dereference --overwrite -n --parallel=5 $defaultExcludes $INPUT_OPTS ${INPUT_LOCALDIR} ${INPUT_REMOTEDIR}; quit"

 echo "::set-output name=elapsed::$SECONDS"
