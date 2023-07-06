%TWO LAYERS OF SOIL ON ELASTIC HALFSPACE
%ΑΝΑΠΤΥΞΗ ΚΩΔΙΚΑ ΓΙΑ ΤΗΝ ΔΙΠΛΩΜΑΤΙΚΗ ΤΟΥ ΔΗΜΗΤΡΗ ΚΟΚΟΡΗ
h1=12.5; %thikness of under soil layer
h2=12.5; %thikness of down soil layer
vs1=200; %shear wave velocity of soil 1
vs2=200; %shear wave velocity of soil 2
vsb=800; %shear wave velocity of berock
ro1=2.0; %unit weight of layer 1
ro2=2.0; %unit weight of layer 2
rob=2.5484; %unit weight of bedrock
ksi1=0.05; %damping ratio of layer 1
ksi2=0.05; %damping ratio of layer 2
ksib=0.05; %damping ratio of bedrock
[acc]=textread('RICKER3HZ.ACC','%f','headerlines',3); %input the acceleration data
n=length(acc);
for i=2:n+1
    a(i)=acc(i-1);  % shift
end
a(1)=0.0;
dt=0.005; %time step 
df=1./(n*dt);                  % frequency increment
t=0.0:dt:n*dt;                 % set up time vector
f=0.0:df:n*df;                 % set up frequency vector

%fast fourier transform
afft=fft(a)/n; %fast fourier transform complex numbers
absfft=abs(afft); %amplitude of fft

for i=1:n/2+1                  % set up singl-sided FAS
    b(i)=2.*absfft(i);
    fonesided(i)=f(i);
end

%calculus
alfa1=(ro1*vs1*(1+1i*ksi1))/(ro2*vs2*(1+1i*ksi2)); %calculate complex impedance ratio of layers 1 - 2
alfa2=(ro2*vs2*(1+1i*ksi2))/(rob*vsb*(1+1i*ksib)); %calculate complex impedance ratio of layers 2 - bedrock

    %transfer function
h(1)=1.0;
for i=2:n/2+1
    kappa1= 2*pi*f(i)*h1/(vs1+ksi1*1i*vs1);  % wave number x thickness
    kappa2= 2*pi*f(i)*h2/(vs2+ksi2*1i*vs2);
    %h(i)=1./(cos(kappa1)*cos(kappa2)-alfa*sin(kappa1)*sin(kappa2));	% left half of transfer function
    a1=cos(kappa1)+alfa1*1i*sin(kappa1);
	b1=cos(kappa1)-alfa1*1i*sin(kappa1);
	kei=0.5*(1+alfa2)*exp(1i*kappa2);
	el=0.5*(1-alfa2)*exp(-1i*kappa2);
	em=0.5*(1-alfa2)*exp(1i*kappa2);
	en=0.5*(1+alfa2)*exp(-1i*kappa2);
	
	h(i)=2./(a1*(kei+em)+b1*(el+en));
	%h(i)=1./((1-alfa)*cos(kappa1-kappa2)+(1+alfa)*cos(kappa1+kappa2));
    h(n+3-i)=conj(h(i));	% right half of transfer function
end
%ploting
for i=1:n/2+1
    habs(i)=abs(h(i));         % modulus of transfer function (for plotting)
end
subplot(5,1,5)
plot(t,a)
title('BEDROCK MOTION');                      % plot input motion (time domain)
subplot(5,1,4)
plot(fonesided,b)  
 title('FOURIER AMPLITUDE OF BM(ONE SIDED)');                  % plot FAS of input motion (frequency domain)
subplot(5,1,3)
plot(fonesided,habs)   
title('TRANSFER FUNCTION BEDROCK-FREE SURFACE');               % plot modulus of transfer function (freq. domain)

for i=1:n+1
    acc(i)=afft(i)*h(i);       % compute output motion in frequency domain
end
for i=1:n/2+1
    acc1(i)=2.*abs(acc(i));    % compute FAS of output motion
end
subplot(5,1,2)
plot(fonesided,acc1);
title('FOURIER AMPLITUDE OF SURFACE MOTION(ONE SIDED)');                 % plot FAS of output motion (frequency domain)
atime=n*real(ifft(acc));
subplot(5,1,1)
plot(t,atime)     
title('SURFACE MOTION');             % plot output motion (time domain)