#!/bin/bash

# This script creates a Makefile adapted to the Epitech convention.

FILE="Makefile"

YEAR=$1

HEADER="##\n## EPITECH PROJECT, "$YEAR"\n## "$FILE"\n## File description:\n## ...\n##"

echo -e $HEADER > $FILE

echo -e "\nSRC\t=\t\$(shell find src -name \"*.c\")" >> $FILE

echo -e "\nSRC_TESTS\t=\t\$(shell find src tests -name \"*.c\" ! -name \"main.c\")" >> $FILE

echo -e "\nNAME\t=" >> $FILE

echo -e "\nOBJ\t=\t\$(SRC:.c=.o)" >> $FILE

echo -e "\nCFLAGS\t=\t-Wall -Wextra" >> $FILE

echo -e "\nCC\t=\tepiclang" >> $FILE

printf '\nGREEN = \\033[0;32m\n' >> $FILE

printf '\nYELLOW = \\033[0;33m\n' >> $FILE

printf '\nCYAN = \\033[0;36m\n' >> $FILE

printf '\nRESET = \\033[0m\n' >> $FILE

echo -e "\nall:" >> $FILE
echo -e "\t@echo -e \"\$(CYAN)Building project...\$(RESET)\"" >> $FILE
echo -e "\t@\$(MAKE) \$(NAME) | grep Build" >> $FILE

echo -e "\n\$(NAME):\t\$(OBJ)" >> $FILE
echo -e "\t@if \$(CC) \$(OBJ) -o \$(NAME) \$(CFLAGS); then \\" >> $FILE
echo -e "\t\techo -e \"\$(GREEN)✓ Build successful!\$(RESET)\\\\n\"; \\" >> $FILE
echo -e "\tfi" >> $FILE

echo -e "\nclean:" >> $FILE
echo -e "\t@echo -e \"\$(CYAN)Cleaning up temporary files...\$(RESET)\"" >> $FILE
echo -e "\t@rm -rf \$(OBJ)" >> $FILE
echo -e "\t@find . -type f -name '*.gcda' -delete" >> $FILE
echo -e "\t@find . -type f -name '*.gcno' -delete" >> $FILE
echo -e "\t@find . -type f -name '*.gcov' -delete" >> $FILE
echo -e "\t@find . -type f -name '*~' -delete" >> $FILE
echo -e "\t@echo -e \"\$(GREEN)Cleaning finished!\$(RESET)\\\\n\"" >> $FILE

echo -e "\nfclean: clean" >> $FILE
echo -e "\t@echo -e \"\$(CYAN)Cleaning up binary files...\$(RESET)\"" >> $FILE
echo -e "\t@rm -rf \$(NAME)" >> $FILE
echo -e "\t@rm -rf unit_tests" >> $FILE
echo -e "\t@echo -e \"\$(GREEN)Cleaning finished!\$(RESET)\\\\n\"" >> $FILE

echo -e "\nre: fclean all" >> $FILE

echo -e "\nunit_tests:    fclean" >> $FILE
echo -e "\t@echo -e \"\$(CYAN)Building project and unit tests...\$(RESET)\"" >> $FILE
echo -e "\t@if \$(CC) -o unit_tests \$(SRC_TESTS) \$(CFLAGS) -lcriterion --coverage; \\" >> $FILE
echo -e "\tthen \\" >> $FILE
echo -e "\t\techo -e \"\$(GREEN)✓ Build successful!\$(RESET)\\\\n\"; \\" >> $FILE
echo -e "\telse \\" >> $FILE
echo -e "\t\techo -e \"\$(RED)✗ Build failed.\$(RESET)\\\\n\"; \\" >> $FILE
echo -e "\t\texit 1; \\" >> $FILE
echo -e "\tfi" >> $FILE

echo -e "\ntests_run:    unit_tests" >> $FILE
echo -e "\t@./unit_tests --verbose" >> $FILE

echo -e "\ntests_coverage: unit_tests" >> $FILE
echo -e "\t@./unit_tests --verbose" >> $FILE
echo -e "\t@echo -e \"\$(YELLOW)Lines coverage:\$(RESET)\\\\n\"" >> $FILE
echo -e "\t@gcovr --exclude tests/ --txt-metric line \\" >> $FILE
echo -e "\t\t--gcov-executable \"llvm-cov-20 gcov\"" >> $FILE
echo -e "\t@echo -e \"\$(YELLOW)Branches coverage:\$(RESET)\\\\n\"" >> $FILE
echo -e "\t@gcovr --exclude tests/ --txt-metric branch \\" >> $FILE
echo -e "\t\t--gcov-executable \"llvm-cov-20 gcov\"" >> $FILE

echo -e "\n# Cette règle ne s'adresse qu'aux étudiants Epitech possédant le script\n# effectuant la vérification de la norme de code Epitech" >> $FILE
echo -e "coding_style:\tfclean" >> $FILE
echo -e "\t\t\t@echo -e \"\$(CYAN)Executing coding style verification...\$(RESET)\"" >> $FILE
echo -e "\t\t\t@coding-style.sh . ." >> $FILE
echo -e "\t\t\t@cat coding-style-reports.log" >> $FILE
echo -e "\t\t\t@rm -f coding-style-reports.log" >> $FILE

echo -e "\n.PHONY:\tall clean fclean re unit_tests tests_run tests_coverage coding_style" >> $FILE

GITIGNORE=".gitignore"

printf '\n*.gcda\n*.gcno\n*.gcov\n*~\n*.o\nunit_tests\ncoding-style-reports.log\n' >> $GITIGNORE

exit 0
