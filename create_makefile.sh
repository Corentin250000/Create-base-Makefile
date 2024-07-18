#!/bin/bash

# This script create an empty Makefile adapted to the Epitech convention.

FILE="Makefile"
HEADER="##\n## EPITECH PROJECT, 2024\n## "$FILE"\n## File description:\n## "$FILE"\n##"

echo -e $HEADER > $FILE

echo -e "\nSRC\t=" >> $FILE

echo -e "\nOBJ\t=\t$""(SRC:.c=.o)" >> $FILE

echo -e "\nNAME\t=" >> $FILE

echo -e "\nCC\t=\tgcc" >> $FILE

echo -e "\nFLAGS\t=\t-Wall -Wextra -g" >> $FILE

echo -e "\nCFLAGS\t=" >> $FILE

echo -e "\n$""(NAME):\n\t\t$""(CC) -o $""(NAME) $""(SRC) $""(FLAGS) $""(CFLAGS)" >> $FILE

echo -e "\nall:\t$""(NAME)" >> $FILE

echo -e "\nclean:\n\t\trm -f $""(OBJ)" >> $FILE

echo -e "\nfclean:\tclean\n\t\trm -f $""(NAME)\n\t\trm -f a.out" >> $FILE

echo -e "\nre:\t\tfclean all" >> $FILE

echo -e "\n.PHONY:\tall clean fclean re" >> $FILE

exit 0