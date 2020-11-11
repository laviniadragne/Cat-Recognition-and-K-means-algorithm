function [Q, R] = Householder(A)
  % calculez dimensiunea lui A
  [n m] = size(A);
  % initializez Q si R
  Q = eye(n);
  R = eye(n);
  
  % initializez v-ul
  v = zeros(n, 1);
  
  % parcurg matricea A
  for i = 1: m
    % calculez sigma
    sigma = sign(A(i, i)) * norm(A((i:n), i));
    % egalez elementele din v cu cele din A, de pe coloana corespunzatoare
    v = A(:, i)';
    v(1, i) = A(i, i) - sigma;
    % initializez elementele pana in v(1, i)
    v(1, 1:(i - 1)) = 0;
    % transpun vectorul v
    v = v';
    % calculez reflectorul Hi
    H = eye(n) - ((2 * (v * v')) / (v' * v));
    % calculez noul A
    A = H * A;
    % initializez elementele de sub diagonala lui A cu 0
    A((i + 1):n, i) = 0;
    Q = Q * H';
    R = A;
  endfor
endfunction