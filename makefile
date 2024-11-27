# Dir paths
CURRENT_DIR = .
INPUT_DIR = inputs
OUTPUTS_DIR = outputs
SCRIPTS_DIR = scripts
LOGS_DIR = logs
CASES_DIR = cases
TESTS_DIR = tests
TESTS_INPUTS_DIR = ${TESTS_DIR}/inputs
TESTS_OUTPUTS_DIR = ${TESTS_DIR}/outputs
TESTS_DIFF_DIR = ${TESTS_DIR}/diff
TESTS_CASES_DIR = ${TESTS_DIR}/cases

# Scripts
DOWNLOAD_PDB =  ${SCRIPTS_DIR}/downloadPDB
PDBX_DRAW = ${SCRIPTS_DIR}/pdbx-draw-secondary

# Files extencions
INPUT_EXT = cif
OUT_EXT = png
IDS_EXT = txt
TESTS_OUT_EXT = out
DIFF_EXT = diff
CASES_EXT = sh

# Files
IDS_FILE = my_ids.${IDS_EXT}
INPUT_FILES_NAME = $(addsuffix .${INPUT_EXT}, $(shell cat ${IDS_FILE}))
INPUT_FILES = $(addprefix ${INPUT_DIR}/, ${INPUT_FILES_NAME})
OUTPUT_CASES = $(wildcard ${CASES_DIR}/*.${CASES_EXT})
OUTPUT_FILES = $(patsubst ${CASES_DIR}/%.${CASES_EXT}, ${OUTPUTS_DIR}/%.${OUT_EXT}, ${OUTPUT_CASES})
TEST_CASES =  $(wildcard ${TESTS_CASES_DIR}/*.${CASES_EXT})
DIFF_FILES = $(patsubst ${TESTS_CASES_DIR}/%.${CASES_EXT}, ${TESTS_DIFF_DIR}/%.${DIFF_EXT}, ${TEST_CASES})

# Links
INPUT_LINK = http://www.rcsb.org/pdb/files

.PHONY: all clean distclean

all: ${DIFF_FILES} ${OUTPUT_FILES} ${INPUT_FILES}


${OUTPUTS_DIR}/%.${OUT_EXT}: ${CASES_DIR}/%.${CASES_EXT} ${INPUT_FILES}
	./$< ${PDBX_DRAW} ${CURRENT_DIR}

${TESTS_DIFF_DIR}/%.${DIFF_EXT}: ${TESTS_CASES_DIR}/%.${CASES_EXT}
	@./$< ${PDBX_DRAW} ${TESTS_DIR} 2>&1|\
	diff -b - ${TESTS_OUTPUTS_DIR}/$*.${TESTS_OUT_EXT} > $@;\
	if [ ! -s $@ ]; then \
		printf "Test %-30s passed\n" $$(basename $@); \
	else\
		printf "Test %-30s not passed\n" $$(basename $@); \
	fi \

	
${INPUT_DIR}/%.${INPUT_EXT}:
	./${DOWNLOAD_PDB} ${INPUT_DIR} ${INPUT_LINK} $*.${INPUT_EXT} ${LOGS_DIR}

clean:
	rm -f ${TESTS_DIFF_DIR}/*.${DIFF_EXT};
	rm -f ${INPUT_DIR}/*.${INPUT_EXT}

distclean: clean
	rm -f ${OUTPUTS_DIR}/*.${OUT_EXT};

