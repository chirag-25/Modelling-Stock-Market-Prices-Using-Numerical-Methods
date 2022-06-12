
mu=0.006; % drift
sigma=0.000012; % diffusion
n=100; % number of stocks
k=1.1; % the final value of stock is k times the initial value
f_x = @(x)exp(mu*x-
(sigma*sigma*x/2)+(sigma*(4*sin(100*x)+3*cos(150*x)+5*sin(170*x)+8*cos(190*x)+0.9)))/50
-k;
x_0=1000; % initial guess 1
x_1=2000; % initial guess 2
x_2=3000; % initial guess 3
accuracy=0.00001; % to converge the method
inverse_quadratic_method(x_0,x_1,x_2,f_x,accuracy);
function[Root]=inverse_quadratic_method(x_0,x_1,x_2,f_x,accuracy)
while true
 count=count+1;
 if count>1000 % number of iterations becomes large
 fprintf('The method doesnt converge')
 break
 elseif f_x(x_1)==0 % x_1 is already the root
 Root=x_1;
 fprintf('Number of iterations are %f\n',count)
 fprintf('Root is %f\n',Root)
 break
 elseif f_x(x_2)==0 % x_2 is already the root
 Root=x_2;
 fprintf('Number of iterations are %f\n',count)
 fprintf('Root is %f\n',Root)
 break 
 elseif f_x(x_0)==0 % x_0 is already the root
 Root=x_0;
 fprintf('Number of iterations are %f\n',count)
 fprintf('Root is %f\n',Root)
 break 
 elseif f_x(x_1)==f_x(x_2) % denominator in lagrange interpolation becomes zero
 fprintf('The denominator becomes zero. Try other initial guesses')
 break
 elseif f_x(x_0)==f_x(x_2) % denominator in lagrange interpolation becomes zero
 fprintf('The denominator becomes zero. Try other initial guesses')
 break
 elseif f_x(x_0)==f_x(x_1) % denominator in lagrange interpolation becomes zero
 fprintf('The denominator becomes zero. Try other initial guesses')
 break 
 
 else
 if abs(f_x(x_2))<accuracy % condition for convergence of root
 Root=x_2;
 fprintf('Number of iterations are %f\n',count)
 fprintf('Root is %f\n',Root)
 break
 elseif abs(f_x(x_1))<accuracy % condition for convergence of root
 Root=x_1;
 fprintf('Number of iterations are %f\n',count)
 fprintf('Root is %f\n',Root)
 break
 elseif abs(f_x(x_0))<accuracy % condition for convergence of root
 Root=x_0;
 fprintf('Number of iterations are %f\n',count)
 fprintf('Root is %f\n',Root)
 break 
 else
 % hardcoding the inverse lagrange interpolating polynomial
 t=x_2;
 x_2=(f_x(x_2)*f_x(x_1)*x_0)/((f_x(x_0)-f_x(x_1))*(f_x(x_0)-
f_x(x_2)))+(f_x(x_2)*f_x(x_0)*x_1)/((f_x(x_1)-f_x(x_2))*(f_x(x_1)-
f_x(x_0)))+(f_x(x_0)*f_x(x_1)*x_2)/((f_x(x_2)-f_x(x_1))*(f_x(x_2)-f_x(x_0)));
 x_0=x_1;
 x_1=t;
 end
 end 
end
end