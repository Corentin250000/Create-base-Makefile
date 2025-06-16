# Create-base-Makefile

This program generates a blank Makefile template (following the Epitech coding style), as well as a `.gitignore` file to prevent accidental pushes of unit test files to GitHub.

## How to use the program?

Download the shell script named **create_makefile.sh** and run it (`./create_makefile.sh [year]`) in the folder where you want the Makefile to be created.  
If the file is not executable, you can make it so with the command:  
`chmod +x create_makefile.sh`.  
The **year** parameter is used to insert the specified year in the **Makefile header**.

For more advanced users, you can add a path (**PATH**) in your **.bashrc** file (if using bash, in other cases, check documentation for other shells) with the command:  
`export PATH=$PATH:` followed by the absolute path to the folder where the script is located.  
This allows you to execute the script from anywhere in your filesystem (command: `create_makefile.sh [year]`).

**Warning: running the script will overwrite any existing Makefile.**

## Additional Instructions

- It is **recommended** to put the `main` function in a **separate file** to avoid issues with **unit test compilation**.

- In the `SRC` variable, list all your **source files**, except those used for **unit testing**.

- In the `SRC_UNIT_TESTS` variable, include all your **source files** (**except the one containing the main function**), including those used for **unit testing**.

- The `NAME` variable sets the name of the compiled executable.

- The `FLAGS` and `LIBS` variables should be filled in if needed (use the **-I** option in `FLAGS` to point to your **header file directory** [for C], like this: `-I[path to directory]`).  
**Important:** Don't forget to either **fill in or remove** the **-I** option—if left empty, the Makefile will trigger an **error**.

- Finally, if you're using a **static library compiled** with another Makefile, you can **uncomment** the line that compiles the library.  
If your library folder is not named `lib`, feel free to modify it to match your structure, following this **pattern**:  
`make re -C [path to the library's Makefile]`.  
Additionally, you may remove the redirection to `/dev/null` if you want to see the output in the terminal.
