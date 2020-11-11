function [centroids] = clustering_pc(points, NC)
  % calculez dimensiunile matricei points
  [n d] = size(points);
  clusters = zeros(NC, d);
  % vector ce retine pe pozitia i cate puncte are cluster-ul i
  number_clusters = zeros(1, NC);
  centroids = zeros(NC, d);
  for i = 1:n
    % aflu indicele cluster-ului pentru punctul i
    indice = mod(i, NC);
    if(indice == 0) 
      indice = NC;
    endif
    % cresc numarul de puncte din cluster-ul indice 
    number_clusters(indice)++;
    % adaug punctul i in cluster-ul indice, acesta va retine suma
    % coordonatelor fiecarui punct din acel cluster, nu fiecare punct 
    clusters(indice, :) = clusters(indice, :) + points(i, :);
  endfor
  % calculez centroizii
  for i = 1:NC
    centroids(i, :) = clusters(i, :) / number_clusters(i);
  endfor
  ok = 1;
  while(ok == 1)
  % new_centroids este o matrice goala de NC centroizi cu d coordonate 
    new_centroids = zeros(NC, d);
    clusters = zeros(NC, d);
    number_clusters = zeros(1, NC);
    % pentru fiecare punct caut centroidul cel mai apropiat
    for i = 1:n
      min = norm(points(i, :)-centroids(1, :));
      indice = 1;
      % fac normele dintre punctul i si fiecare centroid
      for j = 2:NC
        norm_new = norm(points(i, :)-centroids(j, :));
        % aflu norma minima si indicele centroidului
        if(min > norm_new) 
          min = norm_new;
          indice = j;
        endif
      endfor
      number_clusters(indice)++;
      clusters(indice, :) = clusters(indice, :) + points(i, :);
    endfor
    % calculez noii centroizi
    for i = 1:NC
        new_centroids(i, :) = clusters(i, :) / number_clusters(i);
    endfor
    % verific daca s-au modificat pozitiile centroizilor
    if (new_centroids == centroids) ok = 0;
        else
          centroids = new_centroids;
    endif
 endwhile
endfunction
