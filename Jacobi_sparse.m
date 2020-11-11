function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  % calculez numarul de linii al matricei G
  n = length(G_rowptr) - 1;
  % solutia initiala e 0
  prev_x = zeros(n, 1);
  while 1
    x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x) + c;
    err = norm(x - prev_x);
    % daca depasesc toleranta opresc while-ul
    if(err < tol) return;
  endif
  prev_x = x;
  endwhile
endfunction