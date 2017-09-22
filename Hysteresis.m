function Hysteresis(M1,x1,d1,M2,x2,d2,M3,x3,d3,M4,x4,d4,M5,x5,d5,M6,x6,d6,M7,x7,d7,M8,x8,d8)     %���ͻ��ߣ�����Ĳ���Ϊδ������ľ���\x\���

M(:,:,1)=M1;
M(:,:,2)=M2;
M(:,:,3)=M3;
M(:,:,4)=M4;
M(:,:,5)=M5;
M(:,:,6)=M6;
M(:,:,7)=M7;
M(:,:,8)=M8;%��ѹ������ǿ�ȷ���һ����ά����
d(1)=d1;
d(2)=d2;
d(3)=d3;
d(4)=d4;
d(5)=d5;
d(6)=d6;
d(7)=d7;
d(8)=d8;%��Ʒ���

% [U,P]=extract(M);

X=[x1,x2,x3,x4,x5,x6,x7,x8];
for i=1:8
    if X(i)~=0
        Y(i)=i;
    else break
    end
end

for i=Y
    U(:,:,i)=M(40:440,2,i)-M(40:440,3,i);
    P(:,:,i)=M(40:440,[5,7,9],i);
    
%     MaxW1(i)=max(max(abs(5.*P(:,:,i).*[U(:,:,i),U(:,:,i),U(:,:,i)]./d(i))));
%     [a,b]=find((abs(5.*P(:,:,i).*[U(:,:,i),U(:,:,i),U(:,:,i)]./d(i)))==MaxW1(i));    %�����������
%     u(i)=U(a,1,i);
%     p(i)=P(a,b,i);
    
   A(i)=area(U(:,:,i),P(:,:,i),i);                                                     %���������
   MaxW2(i)=A(i)*10/d(i);
    
    
    figure(i);
    plot(U(:,:,i)./d(i),P(:,1,i),'r');
    hold on
    plot(U(:,:,i)./d(i),P(:,2,i),'g');
    plot(U(:,:,i)./d(i),-1.*P(:,3,i),'b');   %�����ͻ���ͼ
    title(X(i));
    xlabel('Field(V/cm)');
    ylabel('Polarization(��C/cm^2)')
    
end
figure(i+1)
plot(X(1:i),MaxW2,'*r');
hold on
axis auto;
xlabel('x(%)');
ylabel('Energy density((��J/cm^3)')


