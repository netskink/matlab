% Use Mean-absolute-error (MAE) as the matching criterion

% MAE(B1,B2) = 1/(MxN) sum i=1 to M sum j=1 N abs( B1(i,j)-B2(i,j) )

function result = MAE(X,Y)
    result = sum( sum( abs(X-Y) ) ) / length( X(:) );
end
