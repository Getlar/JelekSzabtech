a = 2.8;
b = -2.68;
c = 0.87;
z = 2;

hn = zeros(1,200);
hn(1)=0;
hn(2)=1;
hn(3)=2.8;

hzn = zeros(1,200);
hzn(1)=1;

sum = zeros(1,200);
sum(1) = 0;
sum(2) = 1;
for i = 3:199
    hn(i+1) = hn(i)*a+hn(i-1)*b + hn(i-2)*c; 
    hzn(i-1) = hn(i)*z^(-1*i-3);
    sum(i) = sum(i-1) + hzn(i-1);
end
figure;
x = linspace(1,200,200);
plot(x,hn);
figure;
plot(x,sum);
H = tf([1 0 0 0],[1 -2.8 2.68 -0.87]);
figure;
bode(H);
figure;
rlocus(H);
figure;
nyquist(H);

