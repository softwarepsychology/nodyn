#!/bin/sh

#MVN=/usr/local/bin/mvn
if [ "$MVN" = '' ] ; then
  MVN=mvn
fi
OUTFILE=./tmp/build
TASK="clean verify"

# command line interpolation is broken, I think
# OPTS='-Dtest.pattern="**/netPauseSpec.js"'

if [ ! -e ./tmp ] ; then
  mkdir tmp
fi

for i in {1..100}
do
  #${MVN} ${TASK} ${OPTS} > ${OUTFILE}-${i}.log 2>&1
  echo ${MVN} ${TASK} -Dtest.pattern="**/netPauseSpec.js"
  ${MVN} ${TASK} -Dtest.pattern="**/netPauseSpec.js" > ${OUTFILE}-${i}.log 2>&1
done
