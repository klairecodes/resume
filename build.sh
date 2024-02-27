# A helper script to build the container. Supports different runtimes.
#!/bin/bash

if ! command -v docker &> /dev/null
then
    if ! command -v podman &> /dev/null
    then
        echo "Neither docker nor podman executables found in \$PATH, exiting."
    fi
fi

runtime=""

if command -v podman &> /dev/null
then
    runtime=$(command -v podman)
else
    runtime=$(command -v docker)
fi

$runtime build -t resume .
