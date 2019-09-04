clear;clc;
P = 12000; %initial principal
totalnumberofyears = 21;
goodhalf = 20;
badhalf = -10;
trend = 20;
modelname='somebadyears';
% modelname = ['halfhalf','somebadyears']


percentofbadyears=0.4;

s = 5; % in percent

for n = 1:1000
    
    t=0:1:totalnumberofyears;
    t=t';  
    c=ModelofAnnualReturns(modelname,t,goodhalf, badhalf, trend,percentofbadyears);
    
    Psi(1)=P;
    for i =2:length(t)
        Psi(i)= Psi(i-1)*(1+s/100);
    end
    Psi = Psi';
    
    
    Pci(1) = P;
    for i =2:length(t)
        Pci(i)= Pci(i-1)*(1+c(i)/100);
    end
    Pci = Pci';
    
    pc(n) = Pci(end);
    ps(n) = Psi(end);
    C(:,n) = c;
    
    
end
% if strcmp(modelname,'somebadyears')
%     disp(['Number of bad years = ',num2str(k)])
% end
close all;
MakeFigure;

subplot(2,1,1);
histogram(pc);
hold on;
plot(ps(1:100),[1:1:100]);
title(['EUR ',num2str(mean(pc)-3*std(pc)),' to ','EUR ',num2str(mean(pc)+3*std(pc)), ' -Possible worth at the end of ', num2str(t(end)),' years', ' with Principal=',num2str(P)] )

subplot(2,1,2);
boxplot(C');drawnow();
title(['Distribution of possible returns (%) per year with a ',modelname,' model']);

