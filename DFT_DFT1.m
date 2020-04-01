DC1 = 0;
A1 = 1;
n1 = 1;
DC2 = 0;
A2 = 1/3; %%1/3
n2 = 3;
DC3 = 0;
A3 = 1/5; %%1/5
n3 = 5;
%%--------------------------------------------------
%%Minta vetele
%%--------------------------------------------------
mintavetel = 99;
lepeskoz = 100/mintavetel;
frekv = 0.01*lepeskoz;
x = linspace(0,mintavetel,mintavetel+1);
y1 = DC1 + A1 * sin((2*pi*frekv * n1)*x + 0);
y2 = DC2 + A2 * sin((2*pi*frekv * n2)*x + 0);
y3 = DC3 + A3 * sin((2*pi*frekv * n3)*x + 0);
yegesz = y1 + y2 + y3;
%%--------------------------------------------------
%%Alaphullam kirajzoltatasa
%%--------------------------------------------------
frekv2 = 0.01;
xx = linspace(0,99,100);
y11 = DC1 + A1 * sin((2*pi*frekv2 * n1)*xx + 0);
y22 = DC2 + A2 * sin((2*pi*frekv2 * n2)*xx + 0);
y33 = DC3 + A3 * sin((2*pi*frekv2 * n3)*xx + 0);
yegesz2 = y11 + y22 + y33;
figure(1);
subplot(3,2,3);
plot(xx,yegesz2,"r");
title('A 3 hullámból összeadott hullám');
axis([0 99 -1 1])
hold on;
subplot(3,2,2);
plot(xx,y11,"b");
title('y1 = DC1 + A1 * sin((2*pi*frekv * n1)*x + 0)');
axis([0 99 -1 1])
hold on;
subplot(3,2,4);
plot(xx,y22,"g");
title('y2 = DC2 + A2 * sin((2*pi*frekv * n2)*x + 0)');
axis([0 99 -1 1])
hold on;
subplot(3,2,6);
plot(xx,y33,"m");
title('y3 = DC3 + A3 * sin((2*pi*frekv * n3)*x + 0)');
axis([0 99 -1 1])
hold off
%%--------------------------------------------------
%%Minta kirajzoltatasa
%%--------------------------------------------------
figure(2);
for i=1:mintavetel+1
    subplot(3,3,4);
    plot(i-1,yegesz(i), "ro", x,yegesz,"b");
    axis([0 mintavetel -1 1])
    title('Minták');
    hold on;
end
%%--------------------------------------------------
%%DFT matrix feltoltese
%%--------------------------------------------------
mintavetel = mintavetel + 1;
DFT = zeros(mintavetel,mintavetel);
for i = 1:mintavetel
    for k = 1:mintavetel
        DFT(i,k) = exp((-1i*2*pi*(i-1)*(k-1))/mintavetel+1);
    end
end
%%--------------------------------------------------
%%Transzformalt kiszamitasa
%%--------------------------------------------------
transz = DFT * yegesz';
%%--------------------------------------------------
%%Valos es imaginarius resz kirajzoltatasa
%%--------------------------------------------------
subplot(3,3,2);
plot(x,real(transz),"b");
title('Valós rész');
xlim([1 mintavetel-1]);
subplot(3,3,3);
plot(x,imag(transz),"b");
title('Imaginárius rész');
xlim([1 mintavetel-1]);
%%--------------------------------------------------
%%Niquist-plot
%%--------------------------------------------------
for i = 1:mintavetel
    subplot(3,3,8);
    plot(real(transz(i)),imag(transz(i)),'ro');
    ax = gca;
    ax.XAxisLocation = 'origin';
	ax.YAxisLocation = 'origin';
    title('Niquist-plot');
    hold on;
end
%%--------------------------------------------------
%%Norma kirajzoltatasa
%%--------------------------------------------------
normacska = zeros(1,length(x));
for i = 1:mintavetel
    norma = sqrt(real(transz(i)).^2 + imag(transz(i)).^2);
    normacska(i)=sqrt(real(transz(i)).^2 + imag(transz(i)).^2);
    subplot(3,3,5);
    plot(i-1,norma,"ro");
    title('Amplitúdók');
    hold on;
end
subplot(3,3,5);
plot(x,normacska,"b");
xlim([1 mintavetel-1]);
%%--------------------------------------------------
%%Fazis kirajzoltatasa
%%--------------------------------------------------
faziska = zeros(1,length(x));
for i = 1:mintavetel
    fazis = atan2(imag(transz(i)), real(transz(i)));
    faziska(i) = atan2(imag(transz(i)), real(transz(i)));
    subplot(3,3,6);
    plot(i-1,fazis*180/pi,"ro");
    title('Fázisok');
    hold on;
end
subplot(3,3,6);
plot(x,faziska*180/pi,"b");
xlim([1 mintavetel-1]);
%%--------------------------------------------------
%%3 fajta szures, high-pass, low-pass, band-pass
%%--------------------------------------------------
%%LOW-PASS
%%--------------------------------------------------
%%cut = 5;
%%for i = cut+1:mintavetel-cut+1
    %%transz(i) = 0;
%%end
%%--------------------------------------------------
%%HIGH-PASS
%%--------------------------------------------------
%%cuth = 1;
%%for i = 1:cuth+1
    %%transz(i) = 0;
%%end
%%for i = mintavetel-cuth+1:mintavetel
    %%transz(i) = 0;
%%end
%%--------------------------------------------------
%%BAND-PASS
%%--------------------------------------------------
%%cuthelyen = 1;
%%cuthelyen2 = mintavetel-cuthelyen+1;
%%elso = transz(cuthelyen + 1);
%%masodik = transz(cuthelyen2);
%%for i = 1:mintavetel
    %%transz(i) = 0;
%%end
%%transz(cuthelyen + 1) = elso;
%%transz(cuthelyen2) = masodik;
%%--------------------------------------------------
%%BAND-STOP
%%--------------------------------------------------
%%cuthely = 3;
%%transz(cuthely + 1) = 0;
%%transz(cuthely) = 0;
%%--------------------------------------------------
%%Inverz DFT szamolas
%%--------------------------------------------------
inverzDFT = DFT\transz;
for i = 1:mintavetel
    subplot(3,3,9);
    plot(i-1,real(inverzDFT(i)),"ro");
    title('DFT^-1 a visszakapott szürt jel');
    hold on;
end
subplot(3,3,9);
plot(x,real(inverzDFT),"b");
axis([0 mintavetel-1 -1 1])
hold off;
%%--------------------------------------------------
%%Program vege
%%--------------------------------------------------