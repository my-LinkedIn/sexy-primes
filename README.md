# SEXY PRIMES SEQUENCES

I stumbled across this [post](https://www.linkedin.com/feed/update/urn:li:activity:7172765957008965632?utm_source=share&utm_medium=member_desktop) and this is what [I](www.linkedin.com/in/menjaraz) came out...

Sexy primes are pairs of primes of the form (p, p+6).

The challenge was to devise a program outputing something like:

```text
(5,11), (7,13), (11,17), (13,19), (17,23), (23,29), (31,37), (37,43), (41,47), (47,53), (53,59), (61,67), (67,73), (73,79), (83,89), (97,103), (101,107), (103,109), (107,113), (131,137), (151,157), (157,163), (167,173), (173,179), (191,197), (193,199), (223,229), (227,233), (233,239), (251,257), (257,263), (263,269), (271,277), (277,283), (307,313), (311,317), (331,337), (347,353), (353,359), (367,373), (373,379), (383,389), (433,439), (443,449), (457,463), (461,467)
```

## Source code

```d
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
```

## References

[Wikipedia entry](https://en.wikipedia.org/wiki/Sexy_prime)

[Rosetta Code wiki](https://rosettacode.org/wiki/Sexy_primes)

[Wolfram Mathworld](https://mathworld.wolfram.com/SexyPrimes.html)
