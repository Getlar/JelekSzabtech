x = linspace(-5,5,50);
k = 1;
y = 1;
figure;
for i= 1:7
  k = k*i;
  y = y +(x.^i)/k;
  hold on;
  plot(x,y,"*");
end
hold on;
plot(x,exp(x), "r")%,x,y,"b*");
legend("Exponencialis fuggveny","T-sor");