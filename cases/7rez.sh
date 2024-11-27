#!/bin/sh
program=${1}
currentDir=${2}
select='*:A'
inputFile="$currentDir/inputs/7REZ.cif"
outputFile="$currentDir/outputs/$(basename ${0} .sh).png"
optionFile="$currentDir/subOptionsFiles/$(basename ${0} .sh).option"
rotationFile="$currentDir/rotationFiles/$(basename ${0} .sh).ras"

./$program -o $optionFile -r $rotationFile "$select" $inputFile $outputFile
