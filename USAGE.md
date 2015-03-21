### Usage/Testing

For this assignment, we're instructed **not** to run others' code.  However, I wanted to see if my code worked.  So while this is not part of the assignment, I include this for the edification of anyone interested who might have run into the same problem (I will also post this on the forum).

To get it to work, I needed to generate square matrices with random numbers - when I used linear or repeated integer sequences to generate the matrices, they were throwing this error:

	Error in solve.default(data, ...) : 
	  Lapack routine dgesv: system is exactly singular: U[3,3] = 0 

Some investigation revealed that this means that the matrix itself is singular, and therefore not invertible.  It's not a problem with the code, but with the particular data in the matrix.  Therefore, I was able to solve the issue by generating matrices composed of random numbers.  One way to do this is as follows:

	source("cachematrix.R")
	## generate a 4x4 matrix with 16 random integers from 1:100
	randmat <- matrix(sample(100, 16), 4, 4)
	## generate our pseudo-matrix (really, the list) from this matrix
	pseudomat <- makeCacheMatrix(randmat)
	## invert the matrix with cacheSolve;
	## this will show the expected output instead of the error above
	cacheSolve(pseudomat)

	## For example, something along the lines of:
	             [,1]         [,2]        [,3]        [,4]
	[1,] -0.012114316  0.035433891  0.01007139 -0.02032358
	[2,]  0.002921507 -0.004688495  0.01294245 -0.00161057
	[3,] -0.053088201  0.012998656 -0.03017762  0.05696379
	[4,]  0.078413794 -0.035679014  0.02555616 -0.05052896

Well, now, that was a fun and interesting aside!
