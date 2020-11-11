function [H S V] = rgb2hsv(R, G, B)
  [n m] = size(R);
  % matrice de indecsi
  r1 = double(R) / 255;
  g1 = double(G) / 255;
  b1 = double(B) / 255;
  
  % le fac coloane
  R = (r1(:));
  G = (g1(:));
  B = (b1(:));
  % le fac linii
  R1 = R';
  G1 = G';
  B1 = B';
  
  % maximul de pe fiecare coloana
  Cmax = max([R1; G1; B1]);
  Cmin = min([R1; G1; B1]);
  D = Cmax - Cmin;
  H(D == 0) = 0;
  H(Cmax == R1 & D != 0) = 60*(mod(double((G1(Cmax == R1 & D != 0) - B1(Cmax == R1 & D != 0)))./D(Cmax == R1 & D != 0),6));
  H(Cmax == G1 & D != 0) = 60*(double((B1(Cmax == G1 & D != 0) - R1(Cmax == G1 & D != 0)))./D(Cmax == G1 & D != 0) + 2);
  H(Cmax == B1 & D != 0) = 60*(double((R1(Cmax == B1 & D != 0) - G1(Cmax == B1 & D != 0)))./D(Cmax == B1 & D != 0) + 4);
  H = (double)(H / 360);
  S(Cmax == 0)  = 0;
  S(Cmax != 0) = (double)(D(Cmax != 0)./Cmax(Cmax != 0));
  V = Cmax;
endfunction

  
