
function o=FLabyrinth(x)
global N Qd
Fb=0.6;Ts=0.3;g=9.81;
P=x(1);Tw=x(2);
Ht=5.79;
B=x(3);
alpha2=x(4);A=x(5);
% N=14;
N=round(x(7));
Ht1=x(6);
Cd=compCd1(Ht,P,alpha2);
Ls=B/(cosd(alpha2));
Lc=2*(Ls+A);
L=N*Lc;
w=2*(((Ls)*(sind(alpha2)))+(A));
Wc=N*w;
Qd=15570;
Q=((2/3)*(Cd)*(L)*(sqrt(2*g))*(Ht^(3/2)));
Vw=N*Lc*P*Tw;
Ve=2*(P+Ht+Fb)*(B+Ht)*Tw;
Vs=(B+(2*Ht))*Wc*Ts;
Vt=Vw+Ve+Vs;
g1=((Ht/P)*(1/0.9))-1;
g2=1-((Ht/P)*(1/0.05));
g3=((w/P)*(1/4))-1;
g4=1-((w/P)*(1/2));
g5=((A/w)*(1/0.08))-1;
g6=((Lc/w)*(1/9.5))-1;
g7=1-((Lc/w)*(1/3));
g8=((A/Tw)*(1/2))-1;
g9=1-(A/Tw);
g10=((Ht+P)*(1/15))-1;
g11=1-((Ht+P)*(1/8));
g12=1-(Q*(1/Qd));
% g13=
% mu=[P A alpha2 B Tw Ht Q];
% Pf=ProbabilityFailure(mu);
if g1>0 || g2>0 || g3>0 || g4>0 || g5>0 || g6>0 || g7>0 || g8>0 || g9>0 || g10>0 || g11>0 || g12>0
       Landa=1e20;
   else
       Landa=0;
end
%% 
% mu=[P A alpha2 B Tw Ht Q];
% Pf=ProbabilityFailure(mu);
% if Pf>0.1
% Landa=1e20;
% else 
%     Landa=0;
% end
o=Vt+Landa;

end
