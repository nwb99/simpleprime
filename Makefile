CC = clang
GCC = gcc

prime: main.c
	$(CC) -O0 -o prime_O0 main.c
	$(CC) -O1 -o prime_O1 main.c
	$(CC) -O2 -o prime_O2 main.c
	$(CC) -O3 -o prime_O3 main.c
	$(CC) -Ofast -o prime_Ofast main.c

gcc:
	$(GCC) -O0 -o prime_O0 main.c
	$(GCC) -O1 -o prime_O1 main.c
	$(GCC) -O2 -o prime_O2 main.c
	$(GCC) -O3 -o prime_O3 main.c
	$(GCC) -Ofast -o prime_Ofast main.c

clean:
	rm -f ./prime_O*
	rm -f ./results.txt
