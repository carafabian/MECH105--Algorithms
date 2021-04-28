function [base2] = binaryConverter(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary

newbase = 2;
 %10 to 2
div = base10; 
leftover = 0;

index = 1; %since it is a while loop need indexing
base2 = 0;

while div ~= 0 %binary for 0 is weird so exclude it
    leftover = mod(div, newbase); %start dividing base10 by 2s
    div = floor(div / newbase); %find the smallest number to be able to go back to the while loop and only use the new div
    base2(index) = leftover;
    index = index + 1;
end
base2 = flip(base2);  

%since matlab does this from the smallest number and goes it's way up we need to flip to get the right order. 
end
