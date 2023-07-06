function [vel,disp] = Traprule(t,acc)

n=length(t);
dx=(t(n)-t(1))/n;
vel(1)=0;
%velocity
for i=2:n
vel(i)=vel(i-1)+(acc(i-1)+acc(i))*dx/2;
end
%displacement
disp(1)=0;
for i=2:n
disp(i)=disp(i-1)+(vel(i-1)+vel(i))*dx/2;
end


end
