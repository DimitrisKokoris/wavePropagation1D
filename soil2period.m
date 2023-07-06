function [height1,velocity1,height2,velocity2 ] = soil2period(h1,v1,h2,v2)
%SOIL2PERIOD Summary of this function goes here
%   Calculates the 1st fundamental period of layered soil with two layers
%   h1/h2<=1.0 as T, the equation (1) provided by A.H. Hadjian in the article
%   "Fundamental period and mode shape of layered soil profiles"

T1=4*h1/v1;
T2=4*h2/v2;
b=1-0.2*(h1/h2)^2;
n=4-1.8*(h1/h2);

if (h1/h2)<=1.0
    T=T1*(1+b*(T2/T1)^n*(1+h1/h2)^n)^(1/n);
else
    T=T1*sqrt((pi^2/8)*(0.75+(T2/T1)^2*(1+2*(h1/h2))));
end
    

fprintf('%.5f',T);
end

