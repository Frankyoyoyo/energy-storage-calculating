function [A]=area(U,P,i)
m=max(U);
[c,d]=find(U==m);

P=(mean(abs(P')))';
A=trapz(U(1:c),P(1:c));