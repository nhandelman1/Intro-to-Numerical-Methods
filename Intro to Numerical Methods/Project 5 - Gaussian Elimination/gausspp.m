%
%  Gaussian Elimination with Scaled Partial Pivoting
%
%  INPUT
%  n = number of equations
%  AA = augumented matrix (n,n+1) 
%        1 <= i <= n
%        1 <= j <= n+1
%
%  OUTPUT
%  X =  n vector of solutions
%  AB = solution or message that no unique solution exists
%  add_count = number of additions and subtractions used, not including loop increments
%  mult_count = number of multiplications and divisions used
%  comp_count = number of comparisons used
%
function [ AB, X, add_count, mult_count, comp_count ] = gausspp ( AA, n )

    % initialize return values to zero
    X = zeros(1,n);
    add_count = 0;
    mult_count = 0;
    comp_count = 0;

    %  your code goes here
    if(rows(AA) != n || columns(AA) != n+1)
        AB = "Matrix dimensions must be n x n+1";
        return;
    endif

    % calculate scale factor for each row
    S = max(abs(AA(:, 1:n).'))';
    comp_count = comp_count + n*(n-1);
    
    % return error message if a scale factor is 0
    if(ismember(0,S))
        AB = 'A row consists of zero coefficients. No solution or infinite solutions.';
        return;     
    endif
    
    % perform Gaussian Elimination with scaled partial pivoting
    for i=1 : n
        %perform scaled partial pivot
        [max_ max_index] = max(abs(AA(i:n,i))./S(i:n));
        mult_count = mult_count + n - i + 1;
        comp_count = comp_count + n - i;

        if(max_ == 0) % rows not linearly independent
            AB = strcat(mat2str(AA), "\nCoefficients in Column: ", num2str(i), 
                ' starting at row: ', num2str(i), 
                ' are all zero. No solution or infinite solutions.');
            return;     
        endif
        
        % adjust max_index to coincide with the correct row in AA
        max_index = max_index + i - 1;
        
        if(i != max_index)
            AA([i max_index],:) = AA([max_index i],:);
        endif
        
        % perform gaussian elimination
        for j=i+1 : n
            AA(j, i:n+1) = AA(j, i:n+1) - AA(j, i)/AA(i, i)*AA(i, i:n+1);
            add_count = add_count + n + 2 - i; % n + 2 - i additions (vector addition)
            % 1 division, n + 2 - i multiplications (vector scalar multiplication)
            mult_count = mult_count + n + 3 - i; 
        endfor
    endfor
    
    % perform backwards subsitution - book algorithm
    % xn = an,n+1/an,n
    % xn-1 = (an-1,n+1 - an-1,n) / an-1,n-1
    for i = n : -1 : 1
        X(i) = AA(i, n+1);
        for j = i+1 : n
            X(i) = X(i) - AA(i, j)*X(j);
            ++add_count;
            ++mult_count;
        endfor
        X(i) = X(i)/AA(i,i);
        ++mult_count;
    endfor

    %  solve complete, copy results into augumented matrix AB
    AB = AA;
endfunction