#!/bin/sh -l

lftp "${INPUT_SERVER}" -u "${INPUT_USERNAME},${INPUT_PASSWORD}" \
-e "set ftp:use-feat off; set ftp:ssl-force $INPUT_FORCESSL; set ftp:ssl-allow ${INPUT_ALLOWSSL}; mirror --reverse -n -P=5 ${INPUT_LOCALDIR} ${INPUT_REMOTEDIR}; quit"

echo "::set-output name=result::$?"