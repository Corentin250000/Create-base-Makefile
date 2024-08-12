#!/bin/bash

# This script create an empty Makefile adapted to the Epitech convention.

FILE="Makefile"

YEAR=$(date | awk '{print $7}')

HEADER="##\n## EPITECH PROJECT, "$YEAR"\n## "$FILE"\n## File description:\n## "$FILE"\n##"

echo -e $HEADER > $FILE

echo -e "\nSRC\t=" >> $FILE

echo -e "\nSRC_UNIT_TESTS\t=" >> $FILE

echo -e "\nOBJ\t=\t$""(SRC:.c=.o)" >> $FILE

echo -e "\nOBJ_UNIT_TESTS\t=\t$""(SRC_UNIT_TESTS:.c=.o)" >> $FILE

echo -e "\nNAME\t=" >> $FILE

echo -e "\nCC\t=\tgcc" >> $FILE

echo -e "\nFLAGS\t=\t-Wall -Wextra -g" >> $FILE

echo -e "\nCFLAGS\t=\t-fprofile-arcs -ftest-coverage -O0" >> $FILE

echo -e "\nLIBS\t=\t--coverage -lcriterion" >> $FILE

echo -e "\n$""(NAME):\n\t\t$""(CC) -o $""(NAME) $""(SRC) $""(FLAGS) $""(CFLAGS) $""(LIBS)" >> $FILE

echo -e "\nall:\t$""(NAME)" >> $FILE

echo -e "\nclean:\n\t\trm -f $""(OBJ)\n\t\trm -f $""(OBJ_UNIT_TESTS)\n\t\tfind . -type f -name '*.gcda' -exec rm -f {} +\n\t\tfind . -type f -name '*.gcno' -exec rm -f {} +\n\t\tfind . -type f -name '*.gcov' -exec rm -f {} +" >> $FILE

echo -e "\nfclean:\tclean\n\t\trm -f $""(NAME)\n\t\trm -f a.out\n\t\trm -f unit_tests\n\t\trm -f coverage.info\n\t\trm -f coverage_filtered.info\n\t\trm -rf out\n\t\trm -f vgcore.*" >> $FILE

echo -e "\nre:\t\tfclean all" >> $FILE

echo -ne "\ntests_run:\t$""(OBJ_UNIT_TESTS)\n\t\t$""(CC) -o unit_tests $""(OBJ_UNIT_TESTS) $""(FLAGS) $""(CFLAGS) $""(LIBS)\n\t\t./unit_tests --verbose\n\t\tlcov --capture --directory . --output-file coverage.info" >> $FILE
echo -e " \\" >> $FILE
echo -ne "\t\t--ignore-errors mismatch\n\t\tlcov --remove coverage.info '*/tests/*' --output-file" >> $FILE
echo -e " \\" >> $FILE
echo -e " \t\tcoverage_filtered.info --ignore-errors mismatch\n\t\tgenhtml coverage_filtered.info --output-directory out" >> $FILE

echo -e "\n# Cette règle ne s'adresse qu'aux étudiants Epitech possédant le script" >> $FILE

echo -e "\ncoding_style:\tfclean\n\t\t\tcoding-style . .\n\t\t\tcat coding-style-reports.log\n\t\t\trm -f coding-style-reports.log" >> $FILE

echo -e "\n.PHONY:\tall clean fclean re tests_run coding_style" >> $FILE

exit 0
