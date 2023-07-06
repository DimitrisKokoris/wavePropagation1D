function [time,acceleration]=seismodat(t,a)
fid=fopen('seis.dat','at');
for i=1:length(t)
    fprintf(fid,'%.5f %.5f',t(i),a(i));
    fprintf(fid,'\n');
end
fclose(fid);