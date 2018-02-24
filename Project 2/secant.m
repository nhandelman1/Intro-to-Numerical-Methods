## 
## secant method
##

function [ ret ] = secant ( func, begin_pt, end_pt, TOL, max_iter)

  total_iterations = 0;

  fprintf(1,'===================\n');
  fprintf(1,'Secant algorithm\n');
  fprintf(1,'  begin endpoint: %.3f\n', begin_pt);
  fprintf(1,'  end endpoint: %.3f\n', end_pt);
  fprintf(1,'  tolerance: %.2e\n', TOL);
  fprintf(1,'  max iterations: %d\n\n', max_iter);

  #
  #  your secant algorithm goes here
  #



  fprintf(1,'  total iterations: %d\n\n', total_iterations);

endfunction
