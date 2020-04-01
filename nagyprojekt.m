M = 50;
x_k = 1;
DC1 = 0;
A1 = 1;
n1 = 1;
DC2 = 0;
A2 = 1/3;
n2 = 3;
DC3 = 0;
A3 = 1/5;
n3 = 5;
frekv = 0.01;
x = linspace(0,100);
y1 = zeros(1,length(x));
y2 = zeros(1,length(x));
y3 = zeros(1,length(x));
y1 = DC1 + A1 * sin((2*pi*frekv * n1)*x + 0);
y2 = DC2 + A2 * sin((2*pi*frekv * n2)*x + 0);
y3 = DC3 + A3 * sin((2*pi*frekv * n3)*x + 0);
yegesz = y1 + y2 + y3;
figure;
subplot(3,2,3);
plot(x,yegesz);
axis([0 100 -1 1])
hold on;
subplot(3,2,2);
plot(x,y1);
axis([0 100 -1 1])
hold on;
subplot(3,2,4);
plot(x,y2);
axis([0 100 -1 1])
hold on;
subplot(3,2,6);
plot(x,y3);
axis([0 100 -1 1])


%%50 pontban mintavetelezes
%%mert ertekek kiszamolasa
yegesz(1) = (DC1 + A1 * sin((2*pi*frekv * n1)*0 + 0))+ (DC2 + A2 * sin((2*pi*frekv * n2)*0 + 0)) + (DC3 + A3 * sin((2*pi*frekv * n3)*0 + 0));
figure;
for i = 2:2:101
    plot(i-2,yegesz(i-1), "r*",x,yegesz);
    hold on;
end

z = zeros(50,1);
p = 2;
z(1,1) = yegesz(1);
for i = 2:2:99
    z(p,1) = yegesz(i);
    p = p + 1;
end

%%DFT matrix feltoltese
DFT = zeros(50,50);
for i = 1:50
    for k = 1:50
        DFT(i,k) = exp((-1i*2*pi*(i-1)*(k-1))/50);
    end
end
%%transzformalas
transz = DFT * z;
%%valos resz es imag resz
valos = zeros(1,length(transz));
valos(1) = 0;
imaginarius = zeros(1,length(transz));
imaginarius(1) = 0;
for i = 2:length(transz)
    valos(i) = real(transz(i));
    imaginarius(i) = imag(transz(i));
end
%%kirajz
figure;
for i = 1:length(transz)
    plot(i,valos(i),'-o');
    hold on;
end
figure;
for i = 1:length(transz)
    plot(i,imaginarius(i),'-o');
    hold on;
end
%%niquist
figure;
for i = 1:length(transz)
    plot(valos(i),imaginarius(i),'-o');
    hold on;
end
%%arg es fazis
figure;
for i = 1:length(transz)
    valos1 = valos(i);
    imag1 = imaginarius(i);
    norma = sqrt(valos1.^2 + imag1.^2);
    plot(i,norma,"*");
    hold on;
end
figure;
for i = 1:length(transz)
    valos1 = valos(i);
    imag1 = imaginarius(i);
    fazis = atan2(imag1, valos1);
    plot(i,fazis,"*");
    hold on;
end
cut = 3;
for i = cut:length(transz)
    transz(i) = 0;
end
figure;
inverzDFT = inv(DFT)*transz;
for i = 1:50
    plot(i,inverzDFT(i),"*");
    hold on;
end

