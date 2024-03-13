import std.stdio;

void findSexyPrimes(in int lower, in int upper) {
    // Prime sieve
    auto isPrime = new bool[upper + 1];
    isPrime[2..$] = true;

    for (int i = 2; i * i <= upper; ++i) {
        if (isPrime[i]) {
            for (int j = i * i; j <= upper; j += i) {
                isPrime[j] = false;
            }
        }
    }
    
    // Outputting sexy primes
    foreach (i; lower..upper - 6) {
        if (isPrime[i] && isPrime[i + 6]) {
            writef("(%d,%d), ", i, i + 6);
        }
    }
}

void main() {
    const LOWERBOUND = 2; // Lower bound
    const UPPERBOUND = 500; // Upper bound
    
    findSexyPrimes(LOWERBOUND, UPPERBOUND);
}
