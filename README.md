# Simple Prime Generator

Tested on macOS Monterey and Linux.

Needs clang or gcc. Clang seems to be faster, on Linux at least.

The bash 3.2 included in macOS will not work with the test.sh script.  
Update bash using Homebrew.

`make` to make with Clang.  
`make gcc` to make with GCC.  
`make clean` to clean up results.txt and the executables.

Generated 20,000 prime numbers on M1 MacBook Air in about 1.4-1.5 seconds,
going by time command in shell.
