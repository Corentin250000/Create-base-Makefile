# Create-base-Makefile

This program generates a blank Makefile template (following the Epitech coding style), as well as a `.gitignore` file to prevent accidental pushes of unit test files to GitHub.

## How to use the program?

Download the shell script named **create_makefile.sh** and run it (`./create_makefile.sh [year] [C|C++]`) in the folder where you want the Makefile to be created.  
If the file is not executable, you can make it so with the command:  
`chmod +x create_makefile.sh`.  
The **year** parameter is used to insert the specified year in the **Makefile header**.  
The **language** parameter lets you generate a **C** or **C++** Makefile (`C` or `C++`).  
Use `-h` or `--help` to display the usage instructions.

For more advanced users, you can add a path (**PATH**) in your **.bashrc** file (if using bash, in other cases, check documentation for other shells) with the command:  
`export PATH=$PATH:` followed by the absolute path to the folder where the script is located.  
This allows you to execute the script from anywhere in your filesystem (command: `create_makefile.sh [year] [c|cpp]`).

**Warning: running the script will overwrite any existing Makefile.**

## Additional Instructions

- It is **recommended** to put the `main` function in a **separate file** to avoid issues with **unit test compilation**.

- The `SRC` variable uses `$(shell find src -name "*.c")` or `$(shell find src -name "*.cpp")` (depending on the language) to **automatically discover** all your **source files** in the `src` directory. If your source code is organized differently, feel free to **modify this pattern** to match your project structure.

- The `SRC_TESTS` variable automatically finds all **source files** in both `src` and `tests` directories, **excluding main.c or main.cpp** (depending on the language). This ensures all functions are available for **unit testing** without the main entry point causing conflicts. Adjust the find pattern if your structure is different.

- The `NAME` variable sets the name of the compiled **executable**. Leave it empty to be filled in with your project name.

- For **C**, the `CC` variable is set by default (you can change it to any C compiler you prefer).

- For **C++**, the `CXX` variable is set by default (you can change it to any C++ compiler you prefer).

- For **C**, the `CFLAGS` variable contains the **compilation flags**. Feel free to **add additional flags** as needed.  

- For **C++**, the `CXXFLAGS` variable contains the **compilation flags** (including the standard and include path). Feel free to **add additional flags** as needed.

- The Makefile includes several **built-in rules**:
  - `make all` - Builds the project
  - `make clean` - Removes object files and temporary files
  - `make fclean` - Removes the compiled executable and all temporary files
  - `make re` - Performs a full rebuild
  - `make unit_tests` - Compiles unit tests with coverage support
  - `make tests_run` - Runs the unit tests
  - `make tests_coverage` - Runs tests and displays code coverage reports
  - `make coding_style` - Executes the Epitech coding style verification (**C Makefile only**)
