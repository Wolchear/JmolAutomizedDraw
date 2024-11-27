#!/bin/sh
program=${1}
select='*:A'
testDir=${2}
inputFile="${testDir}/inputs/1X8D.cif"
outputFile="${testDir}/$(basename ${0} .sh).png"
r_file="${testDir}/rotateFiles/rotation_works.ras"

./$program -r $r_file $select $inputFile $outputFile  > /dev/null
convert $outputFile -strip "$outputFile.converted"
sha256sum "$outputFile.converted"
rm -rf "$outputFile.converted"
rm -rf $outputFile
