f=@(x) 0.5*(x(1)^2+4*x(2)^2-9)^2+0.5*(-14*x(1)^2+18*x(2)+45)^2;
f_x1=@(x) 2*x(1)*(x(1)^2+4*x(2)^2-9)-28*x(1)*(-14*x(1)^2+18*x(2)+45);
f_x2=@(x) 8*x(2)*(x(1)^2+4*x(2)^2-9)+18*(-14*x(1)^2+18*x(2)+45);

nablaF=zeros(2,1);
x=[0 ;2];
epsilon=10^-3;
i=1;

while 1
    nablaF(1)=f_x1(x);
    nablaF(2)=f_x2(x);
    det_nablaF=(sqrt(nablaF(1)^2+nablaF(2)^2));
    fprintf('iteration=%d\t',i);
    fprintf('gradient=%f\t',det_nablaF);
    fprintf('x1=%f\t',x(1));
    fprintf('x2=%f\t',x(2));
    fprintf('f(x1,x2)=%f\n',f(x));
    
    if (det_nablaF<epsilon)
        break;
    end
%claculate minimum eta
phi=@(eta)0.5*((x(1)-eta*nablaF(1))^2+4*(x(2)-eta*nablaF(2))^2-9)^2+0.5*(-14*(x(1)-eta*nablaF(1))^2+18*(x(2)-eta*nablaF(2))+45)^2;
options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
[etaMin,phiVal]=fminunc(phi,0.005,options);
%%%%%%%%%%%%%%%%%%%%%%%
    x=x-etaMin*nablaF;
    i=i+1;
  
end