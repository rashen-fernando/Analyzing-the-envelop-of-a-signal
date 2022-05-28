[song,Fs]=audioread("D:\The Largest Multitrack Music Collection Ever! (2013) PACK 11\Katrina & The Waves\41 Katrina & The Waves - Walking On Sunshine\song.ogg");
t = (1:size(song,1));
x = song(:,1);
[up,lo] = envelope(x,44100/4,'peak');
%plot(t,x);title('song')
%plot(t,x);hold on;plot(t,up,t,lo,'linewidth',1.5);title('envelop of the song');

xe = up - mean(up);
%plot(t,xe);title('centered envelop');
%pspectrum(xe);
L = size(song,1);
Y=fft(xe/L);


% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);

p1 = abs(Y);
p1 = p1(1:(L/2)+1);

f = Fs*(0:(L/2))/L;
plot(f(1:500),p1(1:500)) ;title('Fourier of the envelope');xlabel('frequency Hz');ylabel('||envelop||');