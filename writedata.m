function [acceleration]=smcwrite(acc);
p=1;
i=1;
flid=fopen('ricker.smc','at+');
    while i<=length(acc);
        if acc(i)>0.0
        fprintf(flid,'%.4E',acc(i));
        else
        fprintf(flid,'%.4E',acc(i)); 
        end
        p=p+1;
        i=i+1;
        if p>8
            fprintf(flid,'\n');
            p=1;
        end
    end
fclose(flid);


end

