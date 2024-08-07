#!/bin/bash

# This script create an empty Makefile adapted to the Epitech convention.

FILE="Makefile"
HEADER="##\n## EPITECH PROJECT, 2024\n## "$FILE"\n## File description:\n## "$FILE"\n##"

echo -e $HEADER > $FILE

echo -e "\nSRC\t=" >> $FILE

echo -e "\nSRC_UNIT_TESTS\t=" >> $FILE

echo -e "\nOBJ\t=\t$""(SRC:.c=.o)" >> $FILE

echo -e "\nOBJ_UNIT_TESTS\t=\t$""(SRC_UNIT_TESTS:.c=.o)" >> $FILE

echo -e "\nNAME\t=" >> $FILE

echo -e "\nCC\t=\tgcc" >> $FILE

echo -e "\nFLAGS\t=\t-Wall -Wextra -g" >> $FILE

echo -e "\nCFLAGS\t=" >> $FILE

echo -e "\nLIBS\t=" >> $FILE

echo -e "\n$""(NAME):\n\t\t$""(CC) -o $""(NAME) $""(SRC) $""(FLAGS) $""(CFLAGS) $""(LIBS)" >> $FILE

echo -e "\nall:\t$""(NAME)" >> $FILE

echo -e "\nclean:\n\t\trm -f $""(OBJ)" >> $FILE

echo -e "\nfclean:\tclean\n\t\trm -f $""(NAME)\n\t\trm -f a.out" >> $FILE

echo -e "\nre:\t\tfclean all" >> $FILE

echo -e "\ntests_run:\t$""(OBJ_UNIT_TESTS)\n\t\t$""(CC) -o unit_tests $""(OBJ_UNIT_TESTS) --coverage -lcriterion\n\t\t./unit_tests --verbose" >> $FILE

echo -e "\n.PHONY:\tall clean fclean re tests_run" >> $FILE

exit 0
