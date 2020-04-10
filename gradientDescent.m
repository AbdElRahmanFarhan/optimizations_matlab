F=@(x) 0.5*(x(1)^2+4*x(2)^2-9)^2+0.5*(-14*x(1)^2+18*x(2)+45)^2;
napla1=@(x) 2*x(1)*(x(1)^2+4*x(2)^2-9)-28*x(1)*(-14*x(1)^2+18*x(2)+45);
napla2=@(x) 8*x(2)*(x(1)^2+4*x(2)^2-9)+18*(-14*x(1)^2+18*x(2)+45);

naplaF=zeros(2,1);
x=[-1 ;1];
eta=0.0005;
epsilon=10^-3;
i=1;

while 1
    naplaF(1)=napla1(x);
    naplaF(2)=napla2(x);
    det_nablaF=(sqrt(naplaF(1)^2+naplaF(2)^2));
    fprintf('iteration=%d\t',i);
    fprintf('gradient=%f\t',det_nablaF);
    fprintf('x1=%f\t',x(1));
    fprintf('x2=%f\t',x(2));
    fprintf('f(x1,x2)=%f\n',F(x));
    if (det_nablaF<epsilon)
        break;
    end
    x=x-(eta*naplaF);
    i=i+1;
  
end