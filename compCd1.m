function C_d=compCd1(Ht,P,alpha2)
% alpha=rad2deg(alpha);
alpha1=[6 8 10 12 15 20 35];
% diff=abs(alpha1-ones(1,7)*alpha);
% [~,index2]=min(diff);
alpha=alpha1;
% % (index2);
for i=1:size(alpha1,2)   
switch alpha(i)                           %%Quarter-Roud Crest Shape
 case 6
  AA=0.02623;
  BB=-2.681;
  CC=0.3669;
  DD=0.1572;
     case 8
    AA=0.03612;
    BB=-2.576;
    CC=0.4104;
    DD=0.1936;
 case 10
    AA=0.06151;
    BB=-2.113;
    CC=0.4210;
    DD=0.2030;
 case 12
    AA=0.09303;
    BB=-1.711;
    CC=0.4278;
    DD=0.2047;
     case 15
    AA=0.10890;
    BB=-1.723;
    CC=0.5042;
    DD=0.2257;
  case 20
    AA=0.11130;
    BB=-1.889;
    CC=0.5982;
    DD=0.2719;
     case 35
    AA=0.03571;
    BB=-3.760;
    CC=0.7996;
    DD=0.4759;
end
    Hw=Ht/P;
Cdi(i)=AA*(Hw^(BB*(Hw^CC)))+DD;
end
if alpha2==6
    Cd_a=Cdi(1);
elseif alpha2==8
    Cd_a=Cdi(2);
elseif alpha2==10
    Cd_a=Cdi(3);
elseif alpha2==12
    Cd_a=Cdi(4);
elseif alpha2==15
    Cd_a=Cdi(5);
    elseif alpha2==20
    Cd_a=Cdi(6);
    elseif alpha2==35
    Cd_a=Cdi(7);
else
    Cd_a=0;
   alphaa=[alpha1 alpha2];
   Cdii=[Cdi Cd_a]; 
    XC=[alphaa;Cdii]';
    new=sortrows(XC);
   [row,~]=find(new==alpha2);
   x1=new(row-1,1);y1=new(row-1,2);
   x0=new(row,1);
   x2=new(row+1,1);y2=new(row+1,2);
y0=interp1([x1 x2],[y1 y2],x0,'linear');
%    y0=y1+((y2-y1)/(x2-x1))*(x0-x1)
   Cd_a=y0;
%    Cd_a=max(y0);
   C_d=Cd_a;
end
C_d=Cd_a;
end