def crout(A):
    """
    Crout function.
    """
    cdef int n = len(A)
    L = [[0] * n for i in xrange(n)]
    U = [[0] * n for i in xrange(n)]
    for j in xrange(n):
        U[j][j] = 1.0
        for i in xrange(j, n):
            alpha = float(A[i][j])
            for k in xrange(j):
                alpha -= L[i][k]*U[k][j]
            L[i][j] = alpha
        for i in xrange(j+1, n):
            tempU = float(A[j][i])
            for k in xrange(j):
                tempU -= L[j][k]*U[k][i]
            U[j][i] = tempU/L[j][j]
    return L, U
