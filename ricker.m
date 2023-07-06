function [a,timestep]=ricker(f,k)
copyfile('225a_0.smc', 'ricker.smc','f');
tt=10; %synolikos xronos [sec]
r=2000; %synolikes epanalhpseis
t0=1.0; %second
step=tt/r;
timestep=0;
temp=1;
flid=fopen('ricker.smc','at+');
fprintf(flid,'\n');
for i=1:250;
    for j=1:8;
        a(temp)=4*pi^2*f^4*exp(-pi*f^2*(timestep - t0)^2)*(2*timestep - 2*t0)^2 - 4*pi*f^2*exp(-pi*f^2*(timestep - t0)^2) + 2*pi*f^2*exp(-pi*f^2*(timestep - t0)^2)*(2*pi*f^2*(timestep - t0)^2 - 1) - pi^2*f^4*exp(-pi*f^2*(timestep - t0)^2)*(2*timestep - 2*t0)^2*(2*pi*f^2*(timestep - t0)^2 - 1)
        %a(temp)=exp(-pi^2*f^2*(timestep-t0)^2)*(-2*pi^2*f^2*(timestep-t0))*(-6*pi^2*f^2*(timestep-t0)+2*pi^2*f^2*(timestep-t0)*2*pi^2*f^2*(timestep-t0)^2)+exp(-pi^2*f^2*(timestep-t0)^2)*(-4*pi^2*f^2-2*pi^2*(1-2*pi^2*f^2*(timestep-t0)^2)+8*pi^4*f^4*(timestep-t0)^2);
        a(temp)=a(temp)*k;
        if a(temp)>0
     	fprintf(flid,'    %.4f',a(temp));
        else
        fprintf(flid,'   %.4f',a(temp));  
        end
        timestep=timestep+step;
        temp=temp+1;
	end
	fprintf(flid,'\n');
end
fclose(flid);
end
