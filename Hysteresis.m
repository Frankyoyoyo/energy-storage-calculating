function Hysteresis(M1,x1,d1,M2,x2,d2,M3,x3,d3,M4,x4,d4,M5,x5,d5,M6,x6,d6,M7,x7,d7,M8,x8,d8)     %电滞回线，输入的参数为未经处理的矩阵\x\厚度

M(:,:,1)=M1;
M(:,:,2)=M2;
M(:,:,3)=M3;
M(:,:,4)=M4;
M(:,:,5)=M5;
M(:,:,6)=M6;
M(:,:,7)=M7;
M(:,:,8)=M8;%电压、极化强度放入一个三维矩阵
d(1)=d1;
d(2)=d2;
d(3)=d3;
d(4)=d4;
d(5)=d5;
d(6)=d6;
d(7)=d7;
d(8)=d8;%样品厚度

% [U,P]=extract(M);

X=[x1,x2,x3,x4,x5,x6,x7,x8];
for i=1:8
    if X(i)~=0
        Y(i)=i;
    else break
    end
end

for i=Y
    l1=find(M(:,1,i)==0);
    l2=length(M(:,:,i));
    U(:,:,i)=M(l1:l2,2,i)-M(l1:l2,3,i);
    P(:,:,i)=M(l1:l2,[5,7,9],i);
    
%     MaxW1(i)=max(max(abs(5.*P(:,:,i).*[U(:,:,i),U(:,:,i),U(:,:,i)]./d(i))));
%     [a,b]=find((abs(5.*P(:,:,i).*[U(:,:,i),U(:,:,i),U(:,:,i)]./d(i)))==MaxW1(i));    %三角形面积法
%     u(i)=U(a,1,i);
%     p(i)=P(a,b,i);
    
   A(i)=area(U(:,:,i),P(:,:,i),i);                                                     %积分面积法
   MaxW2(i)=A(i)*10/d(i);
    
    
    figure(i);
    plot(U(:,:,i)./d(i),P(:,1,i),'r');
    hold on
    plot(U(:,:,i)./d(i),P(:,2,i),'g');
    plot(U(:,:,i)./d(i),-1.*P(:,3,i),'b');   %作电滞回线图
    title(X(i));
    xlabel('Field(V/cm)');
    ylabel('Polarization(μC/cm^2)')
    
end
figure(i+1)
plot(X(1:i),MaxW2,'*r');
hold on
axis auto;
xlabel('x(%)');
ylabel('Energy density((μJ/cm^3)')
