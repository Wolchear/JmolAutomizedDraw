#!/bin/sh
program=${1}
select='*:A'
testDir=${2}
inputFile="${testDir}/inputs/notpdb.cif"
outputFile="${testDir}/$(basename ${0} .sh).png"
./$program $select $inputFile $outputFile
