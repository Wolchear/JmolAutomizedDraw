#!/bin/sh
program=${1}
select='sheets'
testDir=${2}
inputFile="${testDir}/inputs/1X8D.cif"
outputFile="${testDir}/$(basename ${0} .sh).png"

./$program $select $inputFile $outputFile > /dev/null
convert $outputFile -strip "$outputFile.converted"
sha256sum "$outputFile.converted"
rm -rf $outputFile
rm -rf "$outputFile.converted"
