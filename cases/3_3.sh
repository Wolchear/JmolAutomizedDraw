#!/bin/sh
program=${1}
currentDir=${2}
select='helix'
inputFile="$currentDir/inputs/1X8D.cif"
outputFile="$currentDir/outputs/$(basename ${0} .sh).png"
optionFile="$currentDir/subOptionsFiles/$(basename ${0} .sh).option"

./$program -o $optionFile "$select" $inputFile $outputFile
