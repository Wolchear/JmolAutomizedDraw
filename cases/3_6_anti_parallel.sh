#!/bin/sh
program=${1}
currentDir=${2}
select='*:A and sheets'
inputFile="$currentDir/inputs/1X8D.cif"
outputFile="$currentDir/outputs/$(basename ${0} .sh).png"
optionFile="$currentDir/subOptionsFiles/$(basename ${0} .sh).option"
rotationFile="$currentDir/rotationFiles/$(basename ${0} .sh).ras"

./$program -o $optionFile -r $rotationFile "$select" $inputFile $outputFile



