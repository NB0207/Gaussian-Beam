clear all
%name of image to analyse
IMG = imread('z3_new.jpg');
r = IMG(:,:,1);
g = IMG(:,:,2);
b = IMG(:,:,3);
Intensity = r ;
Intensity = double(Intensity);
n1 = (size(IMG,1));
n2 = (size(IMG,2));
x = linspace(0,n2/236,n2);
y = linspace(0,n1/236,n1);
[X ,Y]= meshgrid(1:size(IMG,2),1:size(IMG,1));

grid on
mesh(x,y,Intensity,'Facecolor','interp','Edgecolor','none');
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)
zlabel('Intensity','FontSize',14)
contour(x,y,Intensity)
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)