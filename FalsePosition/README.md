# False Position Root Finding Algorithm
This code will estimate where the root of a function is given several parameters.

## Inputs
* func
* xl
* xu
### Optional Inputs
* es
* maxit
* varargin

## Outputs
* root
* fx
* ea
* iter

### func
This is the function that this code will evaluate where the root lies.

### xl
This is the guess that is to the left of the root, if looking at a graph.

### xu
This is the guess that is to the right of the root, if looking at a graph. 

#### es
This is the relative stopping error. 
- If not specified it automatically defaults to 0.0001%.

#### maxit
This is the maximum number of iterations that the code will run through, if it does not stop sooner.
- If not specificed it will automatically default to 200 iterations. 

#### varargin
This is for any more parameters that are needed for this function to find it's root. 
- It is not needed at all, so it does not default to anything if not specified.

### root
This is where the code estimates the root (where the function crosses the x axis) lies on the x axis. 

### fx
This is what the function is evaluated at the root. 
- Also known as the y value at the root.

### ea
This is the approximate relative percent error. (((Approximation2 - Approximation1)/Approximation2) x 100)

### iter
This is the number of iterations the code went through to get the most accurate approximation of where the root lies. 
