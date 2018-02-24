## plate_factor

## Author: Jerry Ballard <JBallard@mc.edu>
## Created: 2013-10-07

function [ F_12 ] = plate_factor (a, b, c)

##  returns form/view factor between to parallel finite plates
##  formulation from Modest, pg 770, "Radiative Heat Transfer"
##
##  X = a/c,  Y = b/c,  a = width of plate, b = length of plate
##                      c = plate distance
##
##  For two plates 1 x 1 units, 
##       the F12 is 0.5 at 0.386948467150280 unit distance
##
##  The two plates only emit from the centroid of the triangle mesh
##   so the effective size is 0.975 x 0.975 units,
##       the F12 is 0.5 at 0.377274754683831 unit distance
##
##   If the effective size is 0.97 x 0.97 units,
##       the F12 is 0.5 at 0.375340012345499 unit distance
##
##   If the effective size is 0.96 x 0.96 units,
##       the F12 is 0.5 at 0.37147053 unit distance
##
X = a./c;
Y = b./c;

partA = log(sqrt( ((1 + X.^2) .* (1 + Y.^2)) ./ (1 + X.^2 + Y.^2)));

partX = X.*sqrt(1+Y.^2).*atan(X./sqrt(1+Y.^2)) - X.*atan(X);
partY = Y.*sqrt(1+X.^2).*atan(Y./sqrt(1+X.^2)) - Y.*atan(Y);

F_12 = (2 ./ (pi.*X.*Y )) .* (partA + partX + partY);

endfunction
