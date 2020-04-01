x = 0:0.01:2*pi;
frekv = 5;
y = 0;
for i = 1:2:11
    y = y + ((1/i).*(sin(i*frekv*x)));
    akt = (1/i).*sin(i*frekv*x);
    figure;
    plot(x,y);
    axis equal;
    figure;
    plot(x,akt);
    axis equal;
end
figure;
plot(x,y);
axis equal;