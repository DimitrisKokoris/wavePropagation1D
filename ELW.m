function [] = ELW(iarray,carray)
n=length(iarray);
m=length(carray);
flid=fopen('ELEMENTS.DAT','at+');
fprintf(flid,'%s','    N  NP1  NP2  NP3  NP4 TYPE      DENS        PO       GMX         G        XL LSTR  *** (6I5,5F10.0,I5) ***');
fprintf(flid,'\n');

%write elements in specific format for QUAD4M
for i=1:n
    
    %number of element
   if iarray(i,1)<10
       fprintf(flid,'    %i',iarray(i,1));
   elseif iarray(i,1)<100
       fprintf(flid,'   %i',iarray(i,1));
   elseif iarray(i,1)<1000
       fprintf(flid,'  %i',iarray(i,1));
   else
       fprintf(flid,' %i',iarray(i,1));
   end
   
   %node number 1
   if iarray(i,2)<10
       fprintf(flid,'    %i',iarray(i,2));
   elseif iarray(i,2)<100
       fprintf(flid,'   %i',iarray(i,2));
   elseif iarray(i,2)<1000
       fprintf(flid,'  %i',iarray(i,2));
   else
       fprintf(flid,' %i',iarray(i,2));
   end
   
   %node muber 2
   if iarray(i,3)<10
       fprintf(flid,'    %i',iarray(i,3));
   elseif iarray(i,3)<100
       fprintf(flid,'   %i',iarray(i,3));
   elseif iarray(i,3)<1000
       fprintf(flid,'  %i',iarray(i,3));
   else
       fprintf(flid,' %i',iarray(i,3));
   end
   
    %node muber 3
   if iarray(i,4)<10
       fprintf(flid,'    %i',iarray(i,4));
   elseif iarray(i,4)<100
       fprintf(flid,'   %i',iarray(i,4));
   elseif iarray(i,4)<1000
       fprintf(flid,'  %i',iarray(i,4));
   else
       fprintf(flid,' %i',iarray(i,4));     
   end
   
     %node muber 4
   if iarray(i,5)<10
       fprintf(flid,'    %i',iarray(i,5));
   elseif iarray(i,5)<100
       fprintf(flid,'   %i',iarray(i,5));
   elseif iarray(i,5)<1000
       fprintf(flid,'  %i',iarray(i,5));
   else
       fprintf(flid,' %i',iarray(i,5)); 
   end
   
   %type
   fprintf(flid,'    %i',iarray(i,6));
   fprintf(flid,'\n');
end

fprintf(flid,'%s','    N      XORD      YORD   BC  OUT      X2IH      X1IH       XIH      X2IV      X1IV       XIV   *** (I5,2F10.0,2I5,6F10.0) ***');
fprintf(flid,'\n');

for i=1:m
    %node number
    if carray(i,1)<10
        fprintf(flid,'    %i',carray(i,1));
    elseif carray(i,1)<100
       fprintf(flid,'   %i',carray(i,1));
    elseif carray(i,1)<1000
       fprintf(flid,'  %i',carray(i,1));
    else
       fprintf(flid,' %i',carray(i,1));
    end
    
    %x-coordinate
    if carray(i,2)<10
        if mod(carray(i,2),1)==0
        fprintf(flid,'         %i',carray(i,2));
        else
        fprintf(flid,'       %.1f',carray(i,2));
        end
    elseif carray(i,2)<100
        if mod(carray(i,2),1)==0
        fprintf(flid,'        %i',carray(i,2));
        else
        fprintf(flid,'      %.1f',carray(i,2));
        end
    elseif carray(i,2)<1000
        if mod(carray(i,2),1)==0
        fprintf(flid,'       %i',carray(i,2));
        else
        fprintf(flid,'     %.1f',carray(i,2));
        end
    end
    
    %x-coordinate
    if carray(i,3)<10
        if mod(carray(i,3),1)==0
        fprintf(flid,'         %i',carray(i,3));
        else
        fprintf(flid,'       %.1f',carray(i,3));
        end
    elseif carray(i,3)<100
        if mod(carray(i,3),1)==0
        fprintf(flid,'        %i',carray(i,3));
        else
        fprintf(flid,'      %.1f',carray(i,3));
        end
    elseif carray(i,3)<1000
        if mod(carray(i,3),1)==0
        fprintf(flid,'       %i',carray(i,3));
        else
        fprintf(flid,'     %.1f',carray(i,3));
        end
    end
    
    %boundary conditions
    if carray(i,4)== null
    fprintf(flid,'\n');
    else
    fprintf(flid,'    %i',carray(i,4));
    end
    fprintf(flid,'\n');
    
end

%clode file
fclose(flid);

end

