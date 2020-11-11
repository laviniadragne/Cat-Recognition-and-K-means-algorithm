function [x] = SST(A, b)
  [n m] = size(A);
  
  % algoritmul se poate aplica daca numarul de linii>=numar coloane
  if (n >= m)
    x = zeros(m, 1);
    % calculez elementul de pe ultima pozitie
    x(m) = b(m) / A(m,m);
    % pentru fiecare linie(ecuatie) din A de jos in sus calculez solutia
    for i = m-1:-1:1
      x(i)=(b(i) - A(i, (i + 1):m) * x((i + 1):m)) / A(i, i);
    endfor
  endif
end
    