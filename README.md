# Pwn-Box

A docker environment for Pwning in CTF.
Based on **phusion/baseimage**.

## Usage

Run interactive script:

```
wget https://raw.githubusercontent.com/finn79426/Pwn-Box/master/start.sh
./start.sh
```

Suggest: Put the `start.sh` in root directory of your CTFs, One container for one game ;)

```
 ____                       ____
|  _ \__      ___ __       | __ )  _____  __
| |_) \ \ /\ / / '_ \      |  _ \ / _ \ \/ /
|  __/ \ V  V /| | | |     | |_) | (_) >  <
|_|     \_/\_/ |_| |_|     |____/ \___/_/\_\


========================================================

Enter project name (default "temp"): BabyCTF
Remove container when used ? [Y/n] n

root@BabyCTF:/box# # Enjoy!
```



## Include tools & software

- Capstone
- CMake
- GNU Debugger
- IPython
- ltrace & strace
- NASM
- net-tools
- Nmap
- OneGadget
- [PEDA (scwuaptx)](https://github.com/scwuaptx/peda)
- pwngdb
- pwntools
- Python2 & 3
- ROPgadget
- Ruby 2.3
- tmux
- Wget

持續更新 (如果有上手新的工具)
