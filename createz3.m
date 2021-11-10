function [fitresult, gof] = createFit2(x, y, Intensity)
%CREATEFIT2(X,Y,INTENSITY)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Input : y
%      Z Output: Intensity
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 27-Sep-2021 18:36:01


%% Fit: 'untitled fit 1'.
[xData, yData, zData] = prepareSurfaceData( x, y, Intensity );

% Set up fittype and options.
ft = fittype( '130.02 + amplitude*exp(-0.5*(((x-x_0)^2) + ((y-y_0)^2))/(sigma^2))', 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.254282178971531 0.814284826068816 0.243524968724989 0.929263623187228];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult );
legend( h, 'untitled fit 1', 'Intensity vs. x, y', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
zlabel( 'Intensity', 'Interpreter', 'none' );
grid on


