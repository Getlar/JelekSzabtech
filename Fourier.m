M = 10;
xk = 1;
x = linspace(0,9,1000);
for i = 0:9
  valos = cos((2*pi/M)*i*x);
  imag = sin((2*pi/M)*i*x);
  figure;
  plot (x,valos,x,imag);
  hold on;
  for j = 0:9
      minta = (2*pi/M)*i*j;
      plot(j,cos(minta),"*b",j,sin(minta),"*r");
  end 
  axis equal;
  axis([0 9 -1.2 1.2]);
  hold off;
end
for i = 0:9
  valos = cos((2*pi/M)*i*x);
  imag = sin((2*pi/M)*i*x); 
  ampl = sqrt(valos.^2 + imag.^2);
  fazis = atan2(imag, valos);
  figure;
  plot(x,ampl,x,fazis);
  hold on;
  for j = 0:9
    minta = (2*pi/M)*i*j;
    amplminta = sqrt(cos(minta).^2 + sin(minta).^2);
    fazisminta = atan2(sin(minta), cos(minta));
    plot(j, amplminta, '*b',j, fazisminta, '*r');
  end
  axis equal;
  axis([0 9 -3.2 3.2]);
  hold off;
  figure;
  for l = 0:9
    valosp = cos((2*pi/M)*i*l);
    imagp = sin((2*pi/M)*i*l);
    plot(valosp, imagp, "*r");
    axis equal;
    hold on;
  end
  hold off;
end


      