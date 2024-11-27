#!/bin/sh
program=${1}
currentDir=${2}
select='*:A'
inputFile="$currentDir/inputs/3T49.cif"
outputFile="$currentDir/outputs/$(basename ${0} .sh).png"
optionFile="$currentDir/subOptionsFiles/$(basename ${0} .sh).option"

./$program -o $optionFile "$select" $inputFile $outputFile
