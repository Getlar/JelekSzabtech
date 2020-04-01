x = 0:0.01:2*pi;
frekv = 5;
y = 0;
for i = 1:500000
    y = y + ((1/i).*(sin(i*frekv*x)));
    akt = (1/i).*sin(i*frekv*x);
end
figure;
plot(x,y);
axis equal;

