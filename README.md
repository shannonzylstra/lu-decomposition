lu-decomposition
================
Implementing LU decomposition in Cython, using Crout's Algorithm.

### The "Math"

Given a square matrix A, crout(A) will return matrices L and U such that A = L*U.  
L is lower triangular, and U is unit upper triangular.

### Files
crout.py  
crout.pyx

### Examples

In the sage command line (after loading the .pyx file!):

    sage: a = [[1, 3, 5], [2, 4, 7], [1, 1, 0]]
    sage: crout(a)
    ([[1.0, 0, 0], [2.0, -2.0, 0], [1.0, -2.0, -2.0]], [[1.0, 3.0, 5.0], [0, 1.0, 1.5], [0, 0, 1.0]])

### Using %timeit
 
 Cython cuts the time of this loopy (sad face) .py program in half!
 
 Using %timeit on crout.py:
 
     sage: a = [[1, 3, 5], [2, 4, 7], [1, 1, 0]]
     sage: %timeit crout(a)
     625 loops, best of 3: 25.6 µs per loop

Using %timeit on crout.pyx:

     sage: a = [[1, 3, 5], [2, 4, 7], [1, 1, 0]]
     sage: %timeit crout(a)
     625 loops, best of 3: 10.3 µs per loop
