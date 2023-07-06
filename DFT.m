function [acceleration,length_of_signal,time_step]=DFT(ac,N,dt)


for k=1:N
    X(k)=0;
    for n=1:N
        X(k)=X(k)+dt*(ac(k)*cos((n*2*pi/N/dt)*k*dt)-1i*ac(k)*sin((n*2*pi/N/dt)*k*dt));
    end
end
    
end