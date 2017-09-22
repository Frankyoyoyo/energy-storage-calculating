function [A]=area(U,P,i)
m=max(U);
[a,b]=find(U==m);
[c,d]=find(abs(U)<100);
c=c(floor(length(c)/2) );

% P=(mean(abs(P')))';
P=P(:,1);
A=-trapz(U(a:c),(P(a,b)-P(a:c)));
