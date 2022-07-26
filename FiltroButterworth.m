clc;
clear;
%%%%%%%%%%%%%%%%%%%%%   BUTTHERWORTH BAJO %%%%%%%%%%%%%%%%%%%%%%
fs = 100000;
Wp = (40000*2)/fs;
Ws = (41000*2)/fs;
Rp = 3;
As = 60;

orden = 1;

[numerador, denominador] = butter(orden, 40000/(fs/2), 'low');
% freqz( numerador, denominador, 512, 8000);

[Hertz, Fase] = freqz( numerador, denominador, 512);
phi = 180*unwrap(angle(Hertz))/pi;
subplot(2,1,1);
plot( (Fase*fs/2)/(pi), abs(Hertz));
grid;
xlabel('Frequency (Hz)');
ylabel('Magnitude Response');

subplot(2,1,2);
plot( (Fase*fs/2)/(pi), phi);
grid;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');

tf(numerador, denominador, fs,'Variable' ,'z^-1');

for i = 1:(orden+1)
    B(i, 1) = numerador(i);
    A(i, 1) = denominador(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%   BUTTHERWORTH ALTO %%%%%%%%%%%%%%%%%%%%%%
% fs = 8000;
% Wp = (2000*2)/fs;
% Ws = (1500*2)/fs;
% Rp = 3;
% As = 60;
% 
% [orden, Fcorte] = buttord( Wp, Ws, Rp, As);
% [numerador, denominador] = butter(orden, Fcorte, 'high');
% % freqz( numerador, denominador, 512, 8000);
% 
% [Hertz, Fase] = freqz( numerador, denominador, 512);
% phi = 180*unwrap(angle(Hertz))/pi;
% subplot(2,1,1);
% plot( (Fase*8000/2)/(pi), abs(Hertz));
% grid;
% xlabel('Frequency (Hz)');
% ylabel('Magnitude Response');
% 
% subplot(2,1,2);
% plot( (Fase*8000/2)/(pi), phi);
% grid;
% xlabel('Frequency (Hz)');
% ylabel('Phase (degrees)');
% 
% tf(numerador, denominador, 8000,'Variable' ,'z^-1');
% 
% for i = 1:(orden+1)
%     B(i, 1) = numerador(i);
%     A(i, 1) = denominador(i);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%    BUTTERWORTH RECHAZO  %%%%%%%%%%%%%%%%%%%%%%%
% fs = 8000;
% Wp = ([1200 2400]*2)/fs;
% Ws = ([1600 2000]*2)/fs;
% Rp = 3;   
% As = 50;
% 
% [orden, Fcorte] = buttord( Wp, Ws, Rp, As);
% [numerador, denominador] = butter(orden, Fcorte, 'stop');
% 
% freqz( numerador, denominador, 512, 8000);
% [Hertz, Fase] = freqz( numerador, denominador, 512);
% phi = 180*unwrap(angle(Hertz))/pi;
% subplot(2,1,1);
% plot( (Fase*8000/2)/(pi), abs(Hertz));
% grid;
% xlabel('Frequency (Hz)');
% ylabel('Magnitude Response');
% 
% subplot(2,1,2);
% plot( (Fase*8000/2)/(pi), phi);
% grid;
% xlabel('Frequency (Hz)');
% ylabel('Phase (degrees)');

% tf(numerador, denominador, 8000,'Variable' ,'z^-1');
% 
% for i = 1:((orden*2)+1)
%     B(i, 1) = numerador(i);
%     A(i, 1) = denominador(i);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%   BUTTERWORTH BILINEAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [numeradorA, denominadorA] = lp2bs(1, [1, 3.2361, 5.2361, 5.2361, 3.2361, 1], 13637.99425, 13869.70354);
% [numerador, denominador] = bilinear(numeradorA, denominadorA, 8000);
% 
% % freqz( numerador, denominador, 512, 8000);
% [Hertz, Fase] = freqz( numerador, denominador, 512);
% phi = 180*unwrap(angle(Hertz))/pi;
% subplot(2,1,1);
% plot( (Fase*8000/2)/(pi), abs(Hertz));
% grid;
% xlabel('Frequency (Hz)');
% ylabel('Magnitude Response');
% 
% subplot(2,1,2);
% plot( (Fase*8000/2)/(pi), phi);
% grid;
% xlabel('Frequency (Hz)');
% ylabel('Phase (degrees)');
% 
% for i = 1:((5*2)+1)
%     B(i, 1) = numerador(i);
%     A(i, 1) = denominador(i);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%