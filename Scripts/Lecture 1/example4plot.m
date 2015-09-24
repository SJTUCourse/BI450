%   Example 1, 100 points
x = linspace(-2*pi,2*pi);

y = cos(x);
figure(1);
plot(x,y);

%   Example 2, change index
figure(2);
plot(y);

%   Example 3, multiple lines
figure(3);
plot(x,y,x,sin(x),x,cos(x)-sin(x));

%   Example 4, marker
figure(4);
plot(x,sin(x),'o',x,y,'x',x,sin(x)+cos(x),'*');