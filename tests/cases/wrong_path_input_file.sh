#!/bin/sh
#!/bin/sh
program=${1}
select='*:A'
testDir=${2}
inputFile="${testDir}/wrongPath/1X8D.cif"
outputFile="${testDir}/$(basename ${0} .sh).png"
./$program $select $inputFile $outputFile
