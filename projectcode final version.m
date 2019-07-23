[x,fs]= audioread ('Ambiance-16-44p1-mono-12secs.wav'); 
y=fft(x);
z=fftshift(y); 
magz= abs(z);
f=(-length(x)/2:(length(x)/2-1))*fs/length(x); 
%plot(f,magz);
%magy=abs(y);
%angley=angle(y) 
%plot(x);title('time-domain') %plot the time domain figure
%plot(f,magy); title('amplitude-frequency');grid %plot the af figure
%plot(f,angely); title('phase-frequency');grid %plot the pf figure

syms df kf  %define peak frequency deviation df 
df = 75000;
kf= df/(max (x))
B = 4.41*10^4;
BT=2*(df+B) % problem 1 till here and we can get kf and BT here.
v= abs(z).^2;
E=sum(v);
N =(length(z)/2)+1;
syms Nw i;
i = 0; 
while sum(v (N-i:N+i)) <0.95*E
i=i+1;
end
Nw = N+i;
fm = f(Nw)%this value is what we need and problem 2 till here 
wm = 2*pi*fm;
syms a k0 kvco amp kt;
kvco = 2*pi*kf;% make the signal demodulation easily
k0 = 10e04; % set k0 first and make ko big
a = k0/2;
amp = k0/kvco;%combine the amplifier part together to amp value
N0= 10;




