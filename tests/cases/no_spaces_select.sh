#!/bin/sh
select='*:Aandhelix'
program=${1}
testDir=${2}
inputFile="${testDir}/inputs/1X8D.cif"
outputFile="${testDir}/$(basename ${0} .sh).png"

./$program $select $inputFile $outputFile