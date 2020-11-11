function [sol] = rgbHistogram(path_to_image, count_bins)
  A = imread(path_to_image);
  % extrag cele 3 matrici corespunzatoare fiecarei culori
  R = A(:,:,1);
  G = A(:,:,2);
  B = A(:,:,3);
  [n m] = size(R);
  
  % count e lungimea unui interval
  count = 256 / count_bins;
  sol = zeros(1, 3 * count_bins);
  sol1 = zeros(3 * count_bins, 1);
  sol2 = zeros(count_bins, 1);
  
  % pentru fiecare culoare fac acelasi algoritm
   R = (floor((double(R)) / count)) + 1;
   G = (floor((double(G)) / count)) + 1;
   B = (floor((double(B)) / count)) + 1;
   
   % redimensionez matricile pentru a lucra cu vectori-linie
   R1 = reshape(R,[n * m, 1]);
   G1 = reshape(G,[n * m, 1]);
   B1 = reshape(B,[n * m, 1]);
   
   % sol2 va fi un vector cu histograma pozei pe rand pentru culorile
   % rosu, galben, albastru
   sol2 =  accumarray(R1, 1);
   [n1 m1] = size(sol2);
   sol2((n1 + 1):count_bins, 1) = 0;
   % adaug in sol1 histograma pentru rosu pe pozitiile corespunzatoare
   sol1(1:count_bins, 1) = sol2;
   
   sol2 = accumarray(G1, 1);
   [n1 m1] = size(sol2);
   sol2((n1 + 1):count_bins, 1) = 0;
   % adaug in sol1 histograma pentru galben pe pozitiile corespunzatoare
   sol1((count_bins + 1) : (2 * count_bins), 1) = sol2;
   
   sol2 = accumarray(B1, 1);
   [n1 m1] = size(sol2);
   sol2((n1 + 1) : count_bins, 1) = 0;
   % adaug in sol1 histograma pentru albastru pe pozitiile corespunzatoare
   sol1((2 * count_bins + 1) : (3 * count_bins), 1) = sol2;
   
   % vectorul solutie va fi sol1 transpus
   sol = sol1';
end