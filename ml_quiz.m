% to exec this file simply type ml_quiz at >> prompt when this
% is the current directory

% This is how you can convert some matrices into a single vector.

X=ones(2,3)
Y=2*X
vec1 = [ X(:); Y(:) ]

% This is how you recover the matricies from the combined vector
X1 = reshape(vec1(1:6),2,3)
Y1 = reshape(vec1(7:12),2,3)

% This is how you make an anonymous function
approxDerivative = @(theta,epislon) ( (theta+epislon)^3 - (theta-epislon)^3 ) / (2*epislon);

theta = 1
epislon = 0.01

result1 = approxDerivative(theta,epislon)


