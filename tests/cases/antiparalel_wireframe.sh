#!/bin/sh
program=${1}
testDir=${2}
select='*:A and sheets'
inputFile="${testDir}/inputs/1X8D.cif"
outputFile="${testDir}/$(basename ${0} .sh).png"
optionFile="${testDir}/subOptionsFiles/$(basename ${0} .sh).option"
rotationFile="${testDir}/rotateFiles/$(basename ${0} .sh).ras"

./$program -o $optionFile -r $rotationFile "$select" $inputFile $outputFile > /dev/null
convert $outputFile -strip "$outputFile.converted"
sha256sum "$outputFile.converted"
rm -rf $outputFile
rm -rf "$outputFile.converted"
