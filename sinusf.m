function [frequency,phase]=sinusf(f,ph)
copyfile('225a_0.smc', 'sinuso.smc','f'); 
pi=atan(1.0)*4.0;
wmega=2*f*pi;
tt=10;%total time for harmonic load
r=2000;%arithmos epanalipsewn
vhma=tt/r;
phase=ph*pi/180;

%eggrafh se arxeio .smc

timestep=0;
flid=fopen('sinuso.smc','at+');
fprintf(flid,'\n');
for i=1:250
	for j=1:8
        r=sin(wmega*(timestep)+phase);
        if r>0.0
		fprintf(flid,'    %.4f',r);
        else
        fprintf(flid,'   %.4f',r);
        end
        
		timestep=timestep+vhma;
	end
	fprintf(flid,'\n');
end
fclose(flid);
