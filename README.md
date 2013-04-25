lu-decomposition
================
Implementing LU decomposition in Python, using Crout's Algorithm.  
For implementation in Cython, see the [Cython branch](https://github.com/shannonzylstra/lu-decomposition/tree/Cython)
of this repository.  
Also -- if you have the stomach for it, you can glance at [my sage notebook log](http://480.sagenb.org/home/Shannon_Zylstra/6/print).

### The "Math"

Given a square matrix A, crout(A) will return matrices L and U such that A = L*U.  
L is lower triangular, and U is unit upper triangular.

### Files
crout.py

### Examples

In the sage command line (after loading the .py file!):

    sage: a = [[1, 3, 5], [2, 4, 7], [1, 1, 0]]
    sage: crout(a)
    ([[1.0, 0, 0], [2.0, -2.0, 0], [1.0, -2.0, -2.0]], [[1.0, 3.0, 5.0], [0, 1.0, 1.5], [0, 0, 1.0]])

If we want to view L and U separately:

    sage: L = crout(a)[0]
    sage: U = crout(a)[1]
