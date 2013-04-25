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

        - list; the matrix L followed by the matrix U
    """
    # This is Crout's Algorithm.
    n = len(A)
    L = [[0] * n for i in xrange(n)]
    U = [[0] * n for i in xrange(n)]
    for j in xrange(n):
        U[j][j] = 1             # set the j,j-th entry of U to 1
        for i in xrange(j, n):  # starting at L[j][j], solve j-th column of L
            alpha = float(A[i][j])
            for k in xrange(j):
                alpha -= L[i][k]*U[k][j]
            L[i][j] = alpha
        for i in xrange(j+1, n):# starting at U[j][j+1], solve j-th row of U
            tempU = float(A[j][i])
            for k in xrange(j):
                tempU -= L[j][k]*U[k][i]
            if int(L[j][j]) == 0:
                L[j][j] = e-40
            U[j][i] = tempU/L[j][j]
    return [L, U]
