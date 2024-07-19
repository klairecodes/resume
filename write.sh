#!/bin/bash
# This script changes a variable in the LaTeX source for ease of resume objective changing.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <new_objective>"
    exit 1
fi

new_objective=$1
filename=./kcurde.tex

# Use sed to replace the values inside the curly braces.
sed -i.bak -E "s/(\\\tagline\{)[^}]+(\})/\1$new_objective\2/" ${filename}

# Remove backup file.
rm ${filename}.bak

# Compile the final file.
make pretty
echo "Done."
