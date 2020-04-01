deltaT = 10.^(-4);
x = 2:-deltaT:0;
m = 0.002;
t0 = 0;
tmax = 2;
pontok = tmax./deltaT;
c1 = -2;
c3 = -40;
c31 = -40;
c11 = -2;
y1 = zeros(1,length(x));
a1 = zeros(1,length(x));
v1 = zeros(1,length(x));
y = zeros(1,length(x));
v = zeros(1,length(x));
a = zeros(1,length(x));
y1(1) = 0.5;
v1(1) = 0;
a1(1) = (c11*y1(1) + c31 * (y1(1)).^3)./m;
y(1) = 0.004;
v(1) = 0;
a(1) = (c1*y(1) + c3 * (y(1)).^3)./m;
for i = 2:pontok
  v(i) = v(i-1) + a(i-1) * deltaT;
  a(i) = (c1 * y(i-1) + c3 * (y(i-1)).^3)./m;
  y(i) = y(i-1) + v(i-1) * deltaT + ((a(i-1)./2) * (deltaT).^2);
  v1(i) = v1(i-1) + a1(i-1) * deltaT;
  a1(i) = (c11 * y1(i-1) + c31 * (y1(i-1)).^3)./m;
  y1(i) = y1(i-1) + v1(i-1) * deltaT + ((a1(i-1)./2) * (deltaT).^2);
end
hold on;
plot(x,y,"b",x,y1,"r")
title('Szabad harmonikus rezgomozgas kozelitese');