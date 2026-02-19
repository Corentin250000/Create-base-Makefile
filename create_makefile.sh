#!/bin/bash

# This script creates a Makefile adapted to the Epitech convention.

FILE="Makefile"

print_help() {
	echo "Usage: $0 <year> <C|C++>"
	echo -e "\tyear : 4-digit year (e.g. 2026)"
	echo -e "\tC    : generate a C Makefile"
	echo -e "\tC++  : generate a C++ Makefile"
	echo -e "\tPrecision:"
    echo -e "\t\tFor langage C, 'C' and 'c' are valid."
    echo -e "\t\tFor langage C++, 'cpp', 'c++', 'C++', 'cxx' and 'CXX' are valid."
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	print_help
	exit 0
fi

if [[ $# -ne 2 ]]; then
	print_help
	exit 1
fi

YEAR=$1
LANG=$2

if [[ ! "$YEAR" =~ ^[0-9]{4}$ ]]; then
	print_help
	exit 1
fi

case "$LANG" in
	c|C)
		EXT="c"
		MAIN="main.c"
		COMPILER_VAR="CC"
		COMPILER_DEFAULT="gcc"
		FLAGS_VAR="CFLAGS"
		FLAGS_DEFAULT="-Wall -Wextra"
		IS_C=1
		;;
	cpp|c++|C++|cxx|CXX)
		EXT="cpp"
		MAIN="main.cpp"
		COMPILER_VAR="CXX"
		COMPILER_DEFAULT="g++"
		FLAGS_VAR="CXXFLAGS"
		FLAGS_DEFAULT="-std=c++20 -Wall -Wextra -Werror -I./src"
		IS_C=0
		;;
	*)
		print_help
		exit 1
		;;
esac

HEADER="##\n## EPITECH PROJECT, "$YEAR"\n## "$FILE"\n## File description:\n## ...\n##"

echo -e $HEADER > $FILE

echo -e "\nSRC\t=\t\$(shell find src -name \"*.${EXT}\")" >> $FILE

echo -e "\nSRC_TESTS\t=\t\$(shell find src tests -name \"*.${EXT}\" ! -name \"${MAIN}\")" >> $FILE

echo -e "\nNAME\t=" >> $FILE

echo -e "\nOBJ\t=\t\$(SRC:.${EXT}=.o)" >> $FILE

echo -e "\n${FLAGS_VAR}\t=\t${FLAGS_DEFAULT}" >> $FILE

echo -e "\n${COMPILER_VAR}\t=\t${COMPILER_DEFAULT}" >> $FILE

printf '\nGREEN = \\033[0;32m\n' >> $FILE

printf '\nCYAN = \\033[0;36m\n' >> $FILE

printf '\nMAGENTA = \\033[0;35m\n' >> $FILE

printf '\nRESET = \\033[0m\n' >> $FILE

echo -e "\nall:" >> $FILE
echo -e "\t@echo -e \"\$(CYAN)Building project...\$(RESET)\"" >> $FILE
echo -e "\t@\$(MAKE) \$(NAME) | grep Build" >> $FILE

echo -e "\n\$(NAME):\t\$(OBJ)" >> $FILE
echo -e "\t@if \$(${COMPILER_VAR}) \$(OBJ) -o \$(NAME) \$(${FLAGS_VAR}); then \\" >> $FILE
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
echo -e "\t@if \$(${COMPILER_VAR}) -o unit_tests \$(SRC_TESTS) \$(${FLAGS_VAR}) -lcriterion --coverage; \\" >> $FILE
echo -e "\tthen \\" >> $FILE
echo -e "\t\techo -e \"\$(GREEN)✓ Build successful!\$(RESET)\\\\n\"; \\" >> $FILE
echo -e "\tfi" >> $FILE

echo -e "\ntests_run:    unit_tests" >> $FILE
echo -e "\t@./unit_tests --verbose" >> $FILE

echo -e "\ntests_coverage: unit_tests" >> $FILE
echo -e "\t@./unit_tests --verbose" >> $FILE
echo -e "\t@echo -e \"\$(MAGENTA)Lines coverage:\$(RESET)\\\\n\"" >> $FILE
echo -e "\t@gcovr --exclude tests/ --txt-metric line \\" >> $FILE
echo -e "\t\t--gcov-executable \"llvm-cov-20 gcov\"" >> $FILE
echo -e "\t@echo -e \"\$(MAGENTA)Branches coverage:\$(RESET)\\\\n\"" >> $FILE
echo -e "\t@gcovr --exclude tests/ --txt-metric branch \\" >> $FILE
echo -e "\t\t--gcov-executable \"llvm-cov-20 gcov\"" >> $FILE

if [[ "$IS_C" -eq 1 ]]; then
    echo -e "\n# Cette règle ne s'adresse qu'aux étudiants Epitech possédant le script\n# effectuant la vérification de la norme de code Epitech" >> $FILE
	echo -e "coding_style:\tfclean" >> $FILE
	echo -e "\t@echo -e \"\$(CYAN)Executing coding style verification...\$(RESET)\"" >> $FILE
	echo -e "\t@coding-style.sh . ." >> $FILE
	echo -e "\t@cat coding-style-reports.log" >> $FILE
	echo -e "\t@rm -f coding-style-reports.log" >> $FILE
fi

if [[ "$IS_C" -eq 1 ]]; then
	echo -e "\n.PHONY:\tall clean fclean re unit_tests tests_run tests_coverage coding_style" >> $FILE
else
	echo -e "\n.PHONY:\tall clean fclean re unit_tests tests_run tests_coverage" >> $FILE
fi

GITIGNORE=".gitignore"

printf '\n.gitignore\n*.gcda\n*.gcno\n*.gcov\n*~\n*.o\nunit_tests\ncoding-style-reports.log\n' >> $GITIGNORE

exit 0
