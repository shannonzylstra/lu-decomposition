# Second implementation: store L and U in A, use cdef (cython)
"""
Obtain the LU decomposition of a square matrix.

Beware, this program is really crude, and does not anticipate exceptions.
It assumes the given matrix is a list of lists, and that these lists are
the ordered vectors of its rows.

AUTHOR:

    - Shannon Rae Zylstra, April 2013
"""

from cmath import e

def crout(A):
    """
    Returns the lower-triangular matrix L and the unit upper-triangular
    matrix U such that L*U = the given matrix A.
    The computation uses Crout's Algorithm to perform LU decomposition on A.

    INPUT:

        - A: list; the square matrix to decompose

    OUTPUT:

        - list; the matrix formed by the non-zero entries of L and the
                non-zero, non-diagonal entries of U
    """
    # This is Crout's Algorithm.
    cdef int n = len(A)
    for j in xrange(n):
        for i in xrange(j, n):  # starting at L[j][j], solve j-th column of L
            alpha = float(A[i][j])
            for k in xrange(j):
                alpha -= A[i][k]*A[k][j]
            A[i][j] = alpha
        for i in xrange(j+1, n):# starting at U[j][j+1], solve j-th row of U
            alpha = float(A[j][i])
            for k in xrange(j):
                alpha -= A[j][k]*A[k][i]
            if int(A[j][j]) == 0:
                A[j][j] = e-40
            A[j][i] = alpha/A[j][j]
    return A
