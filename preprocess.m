function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  
    % creez calea catre director cu poze cu pisici
  	path_to_imgs1 = strcat(path_to_dataset,  'cats/');
    % memorez matricea cu informatiile despre poze
    name_img1 = getImgNames(path_to_imgs1);
    [n1 m1] = size(name_img1);
    
    % creez calea catre director cu poze fara pisici
    path_to_imgs2 = strcat( path_to_dataset,  'not_cats/');
    % memorez matricea cu informatiile despre poze
    name_img2 = getImgNames(path_to_imgs2);
    [n2 m2] = size(name_img2);
    
    X = zeros(n1 + n2, 3 * count_bins);
    y = zeros(n1 + n2, 1);
    
    % initializez vectorul Y pentru pozele cu pisici
    y(1:n1) = 1;
    
    for i = 1:n1
      % concatenez calea catre o singura poza
      path_to_one1 = strcat(path_to_imgs1, name_img1(i, :));
      
      % in functie de tipul histogramei memorez liniile in X
      if(histogram == 'RGB') 
          X(i, :) = rgbHistogram(path_to_one1, count_bins);
        else
          if (histogram == 'HSV') 
            X(i, :) = hsvHistogram(path_to_one1, count_bins);
          endif
      endif
    endfor
    
     % initializez vectorul Y pentru pozele fara pisici
    y(n1+1:n1+n2) = -1;
    
  for  i = 1 : n2
    % concatenez calea catre o singura poza
    path_to_one2 = strcat(path_to_imgs2, name_img2(i,:));
    
    % in functie de tipul histogramei memorez liniile in X
    if(histogram == "RGB") 
        X(n1 + i,:) = rgbHistogram(path_to_one2, count_bins);
      else
        if (histogram == "HSV") 
          X(n1 + i,:) = hsvHistogram(path_to_one2, count_bins);
    endif
  endif
endfor

endfunction
