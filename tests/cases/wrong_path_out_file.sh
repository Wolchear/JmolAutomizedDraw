#!/bin/sh
program=${1}
select='*:A'
testDir=${2}
inputFile="${testDir}/inputs/1X8D.cif"
outputFile="${testDir}/wrongPath/$(basename ${0} .sh).png"
./$program $select $inputFile $outputFile