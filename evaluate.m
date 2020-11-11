function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  percentage = 0;
  correct = 0;
  total = 0;
  
  % aflu X si y din prepocesare pe baza datelor de intare
  [X y] = preprocess(path_to_testset, histogram, count_bins);
  [n m] = size(X);
  
  % lucrez cu X_tilda, nu cu X, atasandu-i o coloana de 1 la final
  X_tilda = zeros(n, m + 1);
  X_tilda(:, count_bins * 3 + 1) = 1;
  
  % scalez X_tilda
  for i = 1:m
    X_tilda(:, i) = X(:, i);
    X_tilda(:, i) = double (X_tilda(:, i) - mean(X_tilda(:, i)))./(std(X_tilda(:, i)));
  endfor
  
  for i = 1:n
    y1 = w' * X_tilda(i, :)';
    % verific daca produsul este corespunzator cu pozitia din y a imaginii
    if(y1 >= 0 && y(i, 1) == 1) 
      correct++;
    endif
    if(y1 < 0 && y(i, 1) == -1)
      correct++;
    endif
  endfor 
  
  total = n;
  percentage = (double) (correct / total);
endfunction