# Lower Upper Factorization

This code takes any size square matrix (A) and breaks it down into a lower triangular matrix (L), an upper triagular matriz (U), and a pivot matrix (P).

## Inputs
* Matrix of Coefficients 

## Outputs
* Lower Triangular Matrix
* Upper Triangular Matrix
* Pivot Matrix

### Lower triangular matrix
This matrix is a square matrix with 1's running down the diagonal. The upper part of this matrix will be all 0s. The places a21 and a31 , for a 3x3 matrix, will be what a11 would have to be multiplied by to end up with a 0 in places a21 and a31.
 The new A matrix after this would have the original top line of matrix A, and the new values for the second and third line. The process would repeat for with lines 2 and 3 to acheive a 0 in the a32 place.

### Upper Triangular matrix. 
This matrix would have the actual values found in the lower triangular matrix displayed.

### Pivot matrix
This matrix would show how the matrix was pivoted around to acheive a lower and upper matrix without any errors. 
