#!/bin/bash

# Default
CTF="temp"
RM="Y"

echo "
 ____                       ____
|  _ \__      ___ __       | __ )  _____  __
| |_) \ \ /\ / / '_ \      |  _ \ / _ \ \/ /
|  __/ \ V  V /| | | |     | |_) | (_) >  <
|_|     \_/\_/ |_| |_|     |____/ \___/_/\_\\


========================================================
"


read -p "Enter CTF name (default \"temp\"): " INPUT
if [ ! -z "$INPUT" ]; then
    CTF=$INPUT
    unset INPUT
fi

read -r -p "Remove container when used ? [Y/n] " INPUT
if [ ! -z "$INPUT" ]; then
    if [[ "$INPUT" =~ ^([nN][oO]|[nN])+$ ]]; then
        RM="N"
        unset INPUT
    fi
fi

printf "\n"

if [ "$RM" == "N" ]; then
    docker run -it -h ${CTF} --name ${CTF} -v $(pwd)/${CTF}:/ctf --network host	--cap-add=SYS_PTRACE --privileged finn79426/pwn-box
else
    docker run -it --rm -h ${CTF} --name ${CTF} -v $(pwd)/${CTF}:/ctf --network host --cap-add=SYS_PTRACE --privileged finn79426/pwn-box
fi