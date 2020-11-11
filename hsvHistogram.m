function [sol] = hsvHistogram(path_to_image, count_bins)
  A = imread(path_to_image);
  R = A(:,:,1);
  G = A(:,:,2);
  B = A(:,:,3);
  [n m] = size(R);
  
  % count e lungimea unui interval
  count = 101/count_bins;
  
  sol = zeros(1, 3 * count_bins);
  sol1 = zeros(3 * count_bins, 1);
  sol2 = zeros(count_bins, 1);
  
  % pentru fiecare culoare fac acelasi algoritm
  [H S V] = rgb2hsv(R, G, B);
   h = H';
   s = S';
   v = V';
   
   % scalez matricile
   h = h * 100;
   s = s * 100;
   v = v * 100;
   
   h = (floor(h / count)) + 1;
   s = (floor(s / count)) + 1;
   v = (floor(v / count)) + 1;
   
   % sol2 va fi un vector cu histograma pozei pe rand pentru h s si v
   sol2 =  accumarray(h, 1);
   [n1 m1] = size(sol2);
   sol2((n1 + 1):count_bins, 1) = 0;
   % adaug in sol1 histograma pentru h pe pozitiile corespunzatoare
   sol1(1:count_bins, 1) = sol2;
   
   sol2 = accumarray(s, 1);
   [n1 m1] = size(sol2);
   sol2((n1 + 1):count_bins, 1) = 0;
   % adaug in sol1 histograma pentru s pe pozitiile corespunzatoare
   sol1((count_bins + 1) : (2 * count_bins), 1) = sol2;
   
   sol2 = accumarray(v, 1);
   [n1 m1] = size(sol2);
   sol2((n1 + 1):count_bins, 1) = 0;
   % adaug in sol1 histograma pentru v pe pozitiile corespunzatoare
   sol1((2 * count_bins + 1) : (3 * count_bins), 1) = sol2;
   
   % vectorul solutie va fi sol1 transpus
   sol = sol1'; 
end