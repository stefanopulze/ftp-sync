#!/bin/sh -l

lftp "${INPUT_SERVER}" -u "${INPUT_USERNAME},${INPUT_PASSWORD}" \
-e "set ftp:use-feat off; set ftp:ssl-force $INPUT_FORCESSL; set ftp:ssl-allow ${INPUT_ALLOWSSL}; mirror --reverse --continue --dereference --overwrite -n --parallel=5 -v -x ^\.git/$ ${INPUT_LOCALDIR} ${INPUT_REMOTEDIR}; quit"

echo "::set-output name=result::$?"