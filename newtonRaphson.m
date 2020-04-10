
f=@(x) 0.5*(x(1)^2+4*x(2)^2-9)^2+0.5*(-14*x(1)^2+18*x(2)+45)^2;
%gradient
f_x1=@(x) 2*x(1)*(x(1)^2+4*x(2)^2-9)-28*x(1)*(-14*x(1)^2+18*x(2)+45);
f_x2=@(x) 8*x(2)*(x(1)^2+4*x(2)^2-9)+18*(-14*x(1)^2+18*x(2)+45);
nablaF=zeros(2,1);
%hessian
f2_x1_2=@(x) 2*(x(1)^2+4*x(2)^2-9)-28*(-14*x(1)^2+18*x(2)+45)+788*x(1)^2;
f2_x2_2=@(x) 8*(x(1)^2+4*x(2)^2-9)+324+64*x(2)^2;
f2_x1_x2=@(x) 16*x(1)*x(2)-504*x(1);
hessianF=zeros(2,2);

x=[2;2];
epsilon=10^-6;
i=1;
while 1
    nablaF(1,1)=f_x1(x);
    nablaF(2,1)=f_x2(x);
    det_nablaF=sqrt(nablaF(1,1)^2+nablaF(2,1)^2);
    fprintf('iteration=%d\t',i);
    fprintf('gradient=%f\t',det_nablaF);
    fprintf('x1=%f\t',x(1));
    fprintf('x2=%f\t',x(2));
    fprintf('f(x1,x2)=%f\n',f(x));
    if (det_nablaF<epsilon)
        break;
    end
    hessianF(1,1)=f2_x1_2(x);
    hessianF(2,2)=f2_x2_2(x);
    hessianF(1,2)=f2_x1_x2(x);
    hessianF(2,1)=hessianF(1,2);
    x=x-(hessianF\nablaF);
    i=i+1;
  
end