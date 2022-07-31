A = linspace(-2*pi,2*pi,1000);
B = linspace(-2*pi,2*pi,1000);
[x,y] = meshgrid(A,B);
E0 = 1;
wFactor = 2;
lambda = 1;
w0 = wFactor*lambda;     
k = 2*pi/lambda;         
zR = pi*w0^2/lambda;  
myVideo = VideoWriter('myVideoFile1'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)
for z = 0.1:0.1:100
    w = w0*sqrt(1+(z/zR).^2); 
    R = z.*(1+(zR./z).^2);    
    xi = atan(z./zR);
    
    E = E0*w0./w.*exp(-(x.^2 + y.^2)./w.^2).*exp(-1i*(k*z+k*(x.^2 + y.^2)./(2*R)-xi));
    I = abs(E) .^2;
    mesh(x,y,I,'Facecolor','interp','Edgecolor','none')
    xlabel('x axis','FontSize',14) 
    ylabel('y axis','FontSize',14) 
    zlabel('2I','FontSize',14)
    axis([-7 7 -7 7 0 1]);
    maxE = max(I,[],'all');
    s = sprintf('z =%0.1f',z);
    ht = text(5,5,maxE,s);
    pause(0.01);
    
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    
end
close(myVideo)