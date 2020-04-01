figure;
H = tf([0 0 25],[1 0.7 25]);
subplot(2,2,1);
bode(H);
X = tf([0 0 25],[1 0 25]);
subplot(2,2,2);
bode(X);
Z = tf([0 0 25],[1 -0.7 25]);
subplot(2,2,3);
bode(Z);
hold off;
figure;
subplot(2,2,1);
nyquist(H);
subplot(2,2,2);
nyquist(X);
subplot(2,2,3);
nyquist(Z);
hold off;
figure;
rlocus(X);
subplot(2,1,1);
rlocus(H);
subplot(2,1,2);