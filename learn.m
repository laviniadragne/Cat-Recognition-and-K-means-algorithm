function [w] = learn(X, y, lr, epochs)
  [n m] = size(X);
  X_tilda = zeros(n, m+1);
  
  % adaug o coloana la finalul lui X_tilda
  X_tilda(:,m+1) = 1;
  
  % il scalez pe X_tilda
  for i = 1:m
    X_tilda(:, i) = X(:, i);
    X_tilda(:, i) = double (X_tilda(:, i) - mean(X_tilda(:, i)))./(std(X_tilda(:, i)));
  endfor
  
  % alex valori random din [-0.1;0.1]
  a = -0.1;
  b= 0.1;
  
  % w e un vector random coloana
  w = a + (b - a).*rand(m + 1, 1);
  batch_size = 64;
  
  for epoch = 1:epochs
    
    % aleg batch_size linii random din X_tilda si y(vector coloana)
    new = randperm(n);
    X_batch(1:batch_size, :) = X_tilda(new(1:batch_size), :);
    y_batch(1:batch_size, 1) = y(new(1:batch_size), 1);
    
    % calculez w
     for i = 1:(m + 1)
      suma = 0;
      for j = 1:1:batch_size
        suma = suma + (X_batch(j, :) * w - y_batch(j, 1)) * X_batch(j, i);
      endfor
      w(i, 1) = w(i, 1) - lr * double(1 / n) * suma;
      endfor 
    endfor
endfunction
