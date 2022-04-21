#!/bin/sh -l

defaultExcludes=("^\.git/$" "^\.github/$")

## Log Level
logLevel=$INPUT_LOGLEVEL
if [ ! -z $logLevel ]; then
    logLevel="-${logLevel}"
fi

## Exclude files and folder
excludes=""
for t in ${defaultExcludes[@]}; do
  excludes="${excludes} -x $t"
done

if [ ! -z $INPUT_EXCLUDE ]; then
    IFS=';' read -ra ADDR <<< "$INPUT_EXCLUDE"
    for e in "${ADDR[@]}"; do
        excludes="${excludes} -x $e"
    done
fi

echo $excludes
exit 1

lftp "${INPUT_SERVER}" -u "${INPUT_USERNAME},${INPUT_PASSWORD}" \
 -e "set ftp:use-feat off; set ftp:ssl-force $INPUT_FORCESSL; set ftp:ssl-allow ${INPUT_ALLOWSSL}; mirror --reverse --continue --dereference --overwrite -n --parallel=5 -x ^\.git/$ $logLevel ${INPUT_LOCALDIR} ${INPUT_REMOTEDIR}; quit"