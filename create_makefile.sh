#!/bin/bash

# This script create an empty Makefile adapted to the Epitech convention.

FILE="Makefile"

YEAR=$1

HEADER="##\n## EPITECH PROJECT, "$YEAR"\n## "$FILE"\n## File description:\n## "$FILE"\n##"

echo -e $HEADER > $FILE

echo -e "\nSRC\t=" >> $FILE

echo -e "\nSRC_UNIT_TESTS\t=" >> $FILE

echo -e "\nOBJ\t=\t$""(SRC:.c=.o)" >> $FILE

echo -e "\nOBJ_UNIT_TESTS\t=\t$""(SRC_UNIT_TESTS:.c=.o)" >> $FILE

echo -e "\nNAME\t=" >> $FILE

echo -e "\nCC\t=\tgcc" >> $FILE

echo -e "\nFLAGS\t=\t-Wall -Wextra -g -I" >> $FILE

echo -e "\nLIBS\t=" >> $FILE

echo -e "\nCFLAGS\t=\t$""(FLAGS) $""(LIBS)" >> $FILE

echo -e "\n$""(NAME):\t$""(OBJ)\n#\t\tmake re -C lib/ > /dev/null\n\t\t$""(CC) -o $""(NAME) $""(OBJ) $""(CFLAGS)" >> $FILE

echo -e "\nall:\t$""(NAME)" >> $FILE

echo -e "\nclean:\n\t\trm -f $""(OBJ)\n\t\trm -f $""(OBJ_UNIT_TESTS)\n\t\tfind . -type f -name '*.gcda' -delete\n\t\tfind . -type f -name '*.gcno' -delete\n\t\tfind . -type f -name '*.gcov' -delete\n\t\tfind . -type f -name '*~' -delete" >> $FILE

echo -e "\nfclean:\tclean\n\t\trm -f $""(NAME)\n\t\trm -f a.out\n\t\trm -f unit_tests" >> $FILE

echo -e "\nre:\t\tfclean all" >> $FILE

echo -e "\ntests_run:\t$""(OBJ_UNIT_TESTS)\n\t\t$""(CC) --coverage -lcriterion -o unit_tests $""(OBJ_UNIT_TESTS) $""(CFLAGS)\n\t\t./unit_tests --verbose" >> $FILE

echo -e "\n# Cette règle ne s'adresse qu'aux étudiants Epitech possédant le script\n# effectuant la vérification de la norme de code Epitech" >> $FILE

echo -e "\ncoding_style:\tfclean\n\t\t\tcoding-style . .\n\t\t\tcat coding-style-reports.log\n\t\t\trm -f coding-style-reports.log" >> $FILE

echo -e "\n.PHONY:\tall clean fclean re tests_run coding_style" >> $FILE

#.gitignore

GITIGNORE=".gitignore"

echo -e "\n.gitignore\n*.gcda\n*.gcno\n*.o\nunit_tests\ncoding-style-reports.log" >> $GITIGNORE

exit 0
