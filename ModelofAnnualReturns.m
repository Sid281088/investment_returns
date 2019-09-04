function c = ModelofAnnualReturns(modelname,t,goodhalf, badhalf, trend,percentofbadyears)
% modelname = ['halfhalf','somebadyears']

%percentofbadyears between 0 -1. Percentage of time in total time duration where you had a  bad return;

%c is in percentage

switch modelname
    case 'halfhalf'
        c=  vertcat(goodhalf + trend.*rand(length(t)/2,1),badhalf + trend.*rand(length(t)/2,1)); % randomising the t(end) years return
    case 'somebadyears'
        c= goodhalf + trend.*rand(length(t),1);
        k=1;
        while k<round(percentofbadyears*length(t))
            c(randi(length(t)))= badhalf;
            k=k+1;
        end
    case 'slowandsteady'   % fixed 4%
        c= 4*ones(length(t),1);
        
    otherwise
             c=  vertcat(goodhalf + trend.*rand(length(t)/2,1),badhalf + trend.*rand(length(t)/2,1)); % randomising the t(end) years return             
end

end