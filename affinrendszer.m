a = -0.8;
b = -2;
z = b/(1-a);
y0 = z - 0.1;
k = 1:60;
y = zeros(1, length(k));
y(1) = y0;
for i = 2:60
    y(i) = a * y(i-1) + b;
end
plot(k,y,"-o");
    
