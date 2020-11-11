function [A, b] = generate_probabilities_system(rows)
  % calculez numarul de linii al matricei A
  n = (rows*(rows+1))/2;
  A = zeros(n);
  b = zeros(n,1);
  % parcurg fiecare linie a lui A, adica fiecare numar din labirint
  for k = 1:n
    % i va indica pe ce linie din labirint se afla numarul k
    i = fix((-1 + sqrt(1 + 8 * k)) / 2) + 1;
    % daca k era exact pe ultima pozitie de pe o linie din labirint
    if ((i * (i - 1) / 2) == k)
      i = i - 1;
    endif
    % ok indica cati vecini lipsa are un element k
    ok = 0;
    % daca elementul se afla pe prima pozitie de pe linia i
    % si nu este pe ultima linie sau prima, inseamna ca avea vecini 
    % doar dreapta sus, dreapta, jos-stanga, jos-dreapta
    % vecinii lui k vor fi in matrice -1
    if ((i * (i - 1) / 2 + 1) == k && i != 1 && i != rows)
      ok++;
      A(k, k - i + 1) = -1;
      A(k, k + 1) = -1;
      if (i != n)
        A(k, k + i) = -1;
        A(k, k + i + 1) = -1;
      endif
    endif
    % daca elementul se afla pe ultima pozitie de pe linia i
    % si nu este pe ultima linie sau prima, inseamna ca avea vecini 
    % doar stanga sus, stanga, jos-stanga, jos-dreapta
    % vecinii lui k vor fi in matrice -1
    if ((i * (i + 1) / 2) == k && i != 1 && i != rows) 
      ok++;
      A(k, k - i) = -1;
      A(k, k - 1) = -1;
      if (i != n)
        A(k, k + i) = -1;
        A(k, k + i + 1) = -1;
      endif
    endif
    % daca elementul se afla pe ultima linie, b(k) va fi 1
    if (i == rows && i != 1)
      ok++;
      b(k,1) = 1;
      % daca k nu e pe prima pozitie, de pe ultima linie din labirint
      % are vecini sus-stanga si stanga
      if (k != (i*(i-1)/2+1))
        A(k, k - i) = -1;
        A(k, k - 1) = -1;
      elseif ok++;
      endif
      % daca k nu e pe ultima pozitie, de pe ultima linie din labirint
      % are vecini sus-dreapta si dreapta
    if(k != n)
      A(k, k - i + 1) = -1;
      A(k, k + 1) = -1;
    elseif ok++;
      endif
    endif 
    % daca k e pe prima linie 
  if (i == 1)
      ok = 2;
      A(k, k + i) = -1;
      A(k, k + i + 1) = -1;
    endif
    % pe pozitia A(k, k) va fi nr de vecini ai lui k
  A(k, k) = 6 - ok;
  % daca nu-i lipseste niciun vecin lui k
  % ii incrementez pe toti 6 cu -1
  if (ok == 0)
      A(k, k - i) = -1;
      A(k, k - i + 1) = -1;
      A(k, k - 1) = -1;
      A(k, k + 1) = -1;
      A(k, k + i) = -1;
      A(k, k + i + 1) = -1;
    endif
  endfor
endfunction