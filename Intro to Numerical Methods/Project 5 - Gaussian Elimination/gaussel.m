%
%  Gaussian Elimination with Backward Substition
%
%  INPUT
%   n = number of equations
%  AA = augumented matrix (n,n+1) 
%        1 <= i <= n
%        1 <= j <= n+1
%
%  OUTPUT
%  X =  n vector of solutions
%  AB = solution or message that no unique solution exists
%  add_count = number of additions and subtractions used, not including loop increments
%  mult_count = number of multiplications and divisions used
%
function [ AB, X, add_count, mult_count ] = gaussel ( AA, n )

    % initialize return values to zero
    X = zeros(1,n);
    add_count = 0;
    mult_count = 0;

    %  your code goes here
    if(rows(AA) != n || columns(AA) != n+1)
        AB = "Matrix dimensions must be n x n+1";
        return;
    endif   

    % perform Gaussian Elimination
    % provided aii != 0, Ej = Ej - (aji/aii)Ei, j = i+1, ... n
    for i=1 : n
        % check for aii equal 0
        if(AA(i,i) == 0)
            % swap row i with a subsequent row that has a nonzero value in column i
            swapped = false;
            j = i + 1;                
            
            % search subsequent rows until nonzero value found in column i
            while j <= n && !swapped
                % row j has a nonzero value in column i so swap rows i and j
                if(AA(j,i) != 0)
                    AA([j i],:) = AA([i j],:);
                    swapped = true;    
                endif
                
                ++j;
            endwhile

            if(!swapped) % all subsequent rows have zero in column i
                AB = strcat(mat2str(AA), "\nAll rows after row: ", num2str(i), 
                    ' have zeros in column: ', num2str(i), 
                    '. No solution or infinite solutions.');
                return;
            endif
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

