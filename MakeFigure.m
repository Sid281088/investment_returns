function [H, aspectratio]=MakeFigure(n,FigureName,aspectratio)
%Makes standard figure with position of figure on screen determined
%by n, n>1, default =5;
%Figure Name=string which names the plot. defualt = 'plot'

%%Argument management
goldenratio=1.618; % The golden ratio
if (nargin < 1)
    n=5;
end
if (nargin < 2)
    FigureName='Visualization';
end
if (nargin < 3)
    aspectratio=goldenratio;
end


%%
n=n+5; %to get to a sensible screen position

disp('Visualizing data...');
Pix_SS = get(0,'screensize');
width=0.7*Pix_SS(3);

height=width/aspectratio;
clear H
H=figure('Name',FigureName);
H.Position=[(Pix_SS(3)-width)/n (Pix_SS(3)-height)/n width height];
end