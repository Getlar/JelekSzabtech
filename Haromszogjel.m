x = 0:0.01:2*pi;
frekv = 5;
y = 0;
for n = 1:2:1100
    y = y + ((-1).^((n-1)/2)/(n.^2)) * sin(n*frekv*x);
    akt = ((-1).^((n-1)/2)/(n.^2)) * sin(n*frekv*x);
end
figure;
plot(x,y);
axis equal;