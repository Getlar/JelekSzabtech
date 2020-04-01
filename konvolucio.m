%%ELSO FELADAT

fm = [0, 0, 1, 2, 1, 3, 2, 1, 1, 0, 0];
gn = [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0];
fog = zeros(1, (length(fm)-3));
x = 1:9;
y = 0:10;
for i = 0:length(fog)
    fog(i+1) = (fm(i+1)*gn(i+1))+(fm(i+2)*gn(i+2))+(fm(i+3)*gn(i+3));
    gn(i+1) = 0;
    gn(i+4) = 1;
    axis ([0, 10, 0, 8]);
    subplot(2,2,1);
    plot(i+1, fog(i+1),"*b");
    hold on;
end
plot(x,fog,"g");
for i = 0:length(fm)-1
    plot(i, fm(i+1),"*r");
    hold on;
end
gn = [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0];
plot(y,fm,y,gn);

%%MASODIK FELADAT

alpha = 0.02;
fog =[0, 1, 3, 4, 6, 6, 6, 4, 2, 1, 0]; %%Konvolucio vektor
f0 = [0, 0, 2, 3, 5, 5, 5, 3, 2, 0, 0]; %%Tetszoleges jel
fog2 = zeros(1, length(f0));
fog2(1) = 0;
a = 1;
while a < 11 %% ennyi ciklus juttatott a legjobb kozelitesig
    gn2 = [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 2:length(fog2)-1
        fog2(i) = sum(f0 .* gn2);
        if (i < length(fog2)-1) 
            x = i;
            for j = x:x+2
                gn2(j) = gn2(j-1);
            end
            gn2(i-1) = 0;
        end
    end
    f0 = f0 + (alpha*(fog - fog2)); 
    a = 1 + a;
end
h0 = zeros(1, length(f0));
gn2 = [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0];
    for i = 2:length(h0)-1
        h0(i) = sum(f0 .* gn2);
        if (i < length(h0)-1) 
            x = i;
            for j = x:x+2
                gn2(j) = gn2(j-1);
            end
            gn2(i-1) = 0;
        end
    end
subplot(2,2,2);
fxd =[0, 0, 2, 3, 5, 5, 5, 3, 2, 0, 0];
gn2 = [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0];
plot(y,f0,y,fxd,y,fm,y,fog,y,h0,y,gn2);
legend('Kozelito ertek','f0','f[m]','f*g','h0','Meres');
axis ([0, 10, 0, 12]);
hold on;

%%HARMADIK FELADAT

fm = [0 0 0 1 2 1 3 2 1 1 0 0 0];
gm = [1 1 1];
n = length(fm);
m = length(gm);
g = [gm zeros(1, n-m)];
konv = zeros(1, n);
gm = g;
for i = 2:n-1
  konv(i) = sum(fm .* gm);
  x = i;
  for j = x:x+m-1 
    gm(j) = gm(j-1);
  end
  gm(x-1) = 0;
end
h = konv;
dkonv = ifft((fft(h')./fft(g')))';
subplot(2,2,3);
x = linspace(1,n,n);
plot(x-2, fm, "r*"); hold on;
plot(x-1, g, "r");
plot(x-2, h,"g");
plot(x-2, h,"*b");
plot(x-2, [0  dkonv(1:12)], "b");
axis ([0, 10, 0, 8]);
hold off;

