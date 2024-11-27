#!/bin/sh
program=${1}
testDir=${2}
select='14-21:A'
inputFile="${testDir}/inputs/1X8D.cif"
outputFile="${testDir}/$(basename ${0} .sh).png"
optionFile="${testDir}/subOptionsFiles/$(basename ${0} .sh).option"

./$program -o $optionFile "$select" $inputFile $outputFile > /dev/null
convert $outputFile -strip "$outputFile.converted"
sha256sum "$outputFile.converted"
rm -rf $outputFile
rm -rf "$outputFile.converted"
