function [cost] = compute_cost_pc(points, centroids)
  cost = 0; 
  %aflu numarul de clustere si numarul de puncte
  [NC d] = size(centroids);
  [n d] = size(points);
  % parcurg lista de puncte 
  for i = 1:n
    % aleg distanta ca fiind minima a punctului i fata de primul centroid
    min_dist = norm(points(i, :) - centroids(1, :)); ;
    % pentru fiecare centroid fac distanta fata de punct
    for j = 2:NC 
      dist = norm(points(i, :) - centroids(j, :)); 
      % actualizez minimul daca e nevoie
      if (dist < min_dist)
        min_dist = dist;
      endif
    endfor
    % actualizez costul 
    cost = cost + min_dist;
  endfor
endfunction

