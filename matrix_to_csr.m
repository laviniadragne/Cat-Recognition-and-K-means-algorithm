function [values, colind, rowptr] = matrix_to_csr(A)
  nz = 0;
  for i = 1:size(A)
    %ok va indica cand am gasit primul element nenul de pe o linie
    ok = 0;
    for j = 1:size(A)
      if (A(i, j) != 0)
        % nz numara cate elemente nenule am
        nz++;
        % daca am gasit primul element nenul de pe o linie il memorez
        if (ok == 0)
          rowptr(1, i) = nz;
          ok = 1;
        endif
        % memorez valoare si coloana
        values(1, nz) = A(i, j);
        colind(1, nz) = j;
      endif
    endfor
  endfor
  % pe ultima pozitie a lui rowptr va fi nz+1
  rowptr(1, i + 1) = nz + 1;
endfunction