
%% Part 2
clear; clc;

% Importing Excel files

AA_Temp = xlsread('tire_lab','A22:A222');
AA_Deflection_Values = xlsread('tire_lab','B22:B222');
AA_Temp_Values = xlsread('tire_lab','C22:C222');

% Actual number of runs

AA_Temp_Value_Locations = floor(linspace(1,200,10));

% Table 1

fprintf('\nAA Temp Value\tDeflection Value\n');
for n = 1:length(AA_Temp_Value_Locations)
   fprintf(' %0.1f\t\t\t%0.1f\n', AA_Temp(AA_Temp_Value_Locations(n)),AA_Deflection_Values(AA_Temp_Value_Locations(n)))
end

% Pulling data from Table 1

AA_Temp_Value_Actual = zeros(1,10);

for n = 1:length(AA_Temp_Value_Locations)
    AA_Temp_Value_Actual(n) = AA_Temp(AA_Temp_Value_Locations(n));
end

AA_Deflection_Value_Actual = zeros(1,10);

for n = 1:length(AA_Temp_Value_Locations)
   AA_Deflection_Value_Actual(n) = AA_Deflection_Values(AA_Temp_Value_Locations(n));
end

% Interpolation Info
interpolation_values = [(-9.7) (-6.7) .2 4.3 9.5];

linear = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'linear');
nearest_point = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'nearest_point');
spline = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'spline');

% Interpolation Percent Error

linear_PE = zeros(1,5);
nearest_point_PE = zeros(1,5);
spline_PE = zeros(1,5);
actual_deflection_values_interpolation = [136 129 13 60 241];

for n = 1:length(linear_PE)
   linear_PE(n) = (abs(linear(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end

for n = 1:length(nearest_point_PE)
    nearest_point_PE(n) = (abs(nearest_point(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end
    
for n = 1:length(spline_PE)
    spline_PE(n) = (abs(spline(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end
    
% Interpolation Absolute Value Error

linear_abs_error = zeros(1,5);
nearest_point_abs_error = zeros(1,5);
spline_abs_error = zeros(1,5);

for n = 1:length(linear)
   linear_abs_error(n) = abs(linear(n)-actual_deflection_values_interpolation(n));
end

for n = 1:length(nearest_point)
   nearest_point_abs_error(n) = abs(nearest_point(n)-actual_deflection_values_interpolation(n));
end

for n = 1:length(spline)
   spline_abs_error(n) = abs(spline(n)-actual_deflection_values_interpolation(n));
end

% Mean of Abs Value Error

linear_mean_abs_error = (sum(linear_abs_error)/length(linear_abs_error));
nearest_point_mean_abs_error = (sum(nearest_point_abs_error)/length(nearest_point_abs_error));
spline_mean_abs_error = (sum(spline_abs_error)/length(spline_abs_error));

% Mean of Errors Squared

linear_mean_squared_abs_error = (sum(linear_abs_error)/length(linear_abs_error))^2;
nearest_point_mean_squared_abs_error = (sum(nearest_point_abs_error)/length(nearest_point_abs_error))^2;
spline_mean_squared_abs_error = (sum(spline_abs_error)/length(spline_abs_error))^2;

% Grabbing the Locations of the Interpolation Values in AA_Temp

interpolation_value_locations_AA_Temp = zeros(1,5);

for n = 1:length(interpolation_values)
    interpolation_value_locations_AA_Temp(n) = find(AA_Temp == interpolation_values(n));
end


% Grabbing the Temp Values of the Interpolation Values

interpolation_values_AA_Temp_Actual = zeros(1,5);

for n = 1:length(interpolation_values)
   interpolation_values_AA_Temp_Actual(n) = AA_Temp_Values(interpolation_value_locations_AA_Temp(n));
end

% Printing Table 2
fprintf('AA Tire Temperature \tNearest Estimate(mm)\tLinear Estimate(mm) \tSpline Estimate(mm) \tActual(mm)  \tPercent Error Nearest\tPercent Error Linear\tPercent Error Spline\tAbs Value of Error Nearest(mm)  \tAbs Value of Error Linear   \tAbs Value of Error Spline\n');

for n = 1:length(interpolation_values)
   fprintf(' %0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\n',interpolation_values(n),nearest(n),linear(n),spline(n),interpolation_values_AA_Temp_Actual(n),nearest_point_PE(n),linear_PE(n),spline_PE(n),nearest_point_abs_error(n),linear_abs_error(n),spline_abs_error(n));
end

% Plotting Pretty Much Everything at Once

plot(interpolation_values,linear,'r-'); hold on;
plot(interpolation_values,nearest_point,'b-'); hold on;
plot(interpolation_values,spline,'k-'); hold on;
plot(interpolation_values,interpolation_values_AA_Temp_Actual,'ro'); hold on;
plot(interpolation_values,actual_deflection_values_interpolation,'bo'); hold on;
title('Pretty Much Everything');
xlabel('\bfInterpolation Values','FontSize',14);
legend('Linear Interpolation','Nearest Point Interpolation','Spline Interpolation','AA Temp Interpolation','Deflection Values Interpolation');
 
% No tires were harmed in the making of this Lab Assignment.

%% Part 3
clear; clc;

% Importing Excel files

AA_Temp = xlsread('tire_lab','A22:A222');
AA_Deflection_Values = xlsread('tire_lab','B22:B222');
AA_Temp_Values = xlsread('tire_lab','C22:C222');

% Actual number of runs

AA_Temp_Value_Locations = floor(linspace(1,200,20));

% Table 1

fprintf('\nAA Temp Value\tDeflection Value\n');
for n = 1:length(AA_Temp_Value_Locations)
   fprintf(' %0.1f\t\t\t%0.1f\n', AA_Temp(AA_Temp_Value_Locations(n)),AA_Deflection_Values(AA_Temp_Value_Locations(n)))
end

% Pulling data from Table 1

AA_Temp_Value_Actual = zeros(1,10);

for n = 1:length(AA_Temp_Value_Locations)
    AA_Temp_Value_Actual(n) = AA_Temp(AA_Temp_Value_Locations(n));
end

AA_Deflection_Value_Actual = zeros(1,10);

for n = 1:length(AA_Temp_Value_Locations)
   AA_Deflection_Value_Actual(n) = AA_Deflection_Values(AA_Temp_Value_Locations(n));
end

% Interpolation Info
interpolation_values = [(-9.7) (-6.7) .2 4.3 9.5];

linear = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'linear');
nearest_point = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'nearest_point');
spline = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'spline');

% Interpolation Percent Error

linear_PE = zeros(1,5);
nearest_point_PE = zeros(1,5);
spline_PE = zeros(1,5);
actual_deflection_values_interpolation = [136 129 13 60 241];

for n = 1:length(linear_PE)
   linear_PE(n) = (abs(linear(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end

for n = 1:length(nearest_point_PE)
    nearest_point_PE(n) = (abs(nearest_point(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end
    
for n = 1:length(spline_PE)
    spline_PE(n) = (abs(spline(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end
    
% Interpolation Absolute Value Error

linear_abs_error = zeros(1,5);
nearest_point_abs_error = zeros(1,5);
spline_abs_error = zeros(1,5);

for n = 1:length(linear)
   linear_abs_error(n) = abs(linear(n)-actual_deflection_values_interpolation(n));
end

for n = 1:length(nearest_point)
   nearest_point_abs_error(n) = abs(nearest_point(n)-actual_deflection_values_interpolation(n));
end

for n = 1:length(spline)
   spline_abs_error(n) = abs(spline(n)-actual_deflection_values_interpolation(n));
end

% Mean of Abs Value Error

linear_mean_abs_error = (sum(linear_abs_error)/length(linear_abs_error));
nearest_point_mean_abs_error = (sum(nearest_point_abs_error)/length(nearest_point_abs_error));
spline_mean_abs_error = (sum(spline_abs_error)/length(spline_abs_error));

% Mean of Errors Squared

linear_mean_squared_abs_error = (sum(linear_abs_error)/length(linear_abs_error))^2;
nearest_point_mean_squared_abs_error = (sum(nearest_point_abs_error)/length(nearest_point_abs_error))^2;
spline_mean_squared_abs_error = (sum(spline_abs_error)/length(spline_abs_error))^2;

% Grabbing the Locations of the Interpolation Values in AA_Temp

interpolation_value_locations_AA_Temp = zeros(1,5);

for n = 1:length(interpolation_values)
    interpolation_value_locations_AA_Temp(n) = find(AA_Temp == interpolation_values(n));
end


% Grabbing the Temp Values of the Interpolation Values

interpolation_values_AA_Temp_Actual = zeros(1,5);

for n = 1:length(interpolation_values)
   interpolation_values_AA_Temp_Actual(n) = AA_Temp_Values(interpolation_value_locations_AA_Temp(n));
end


% Printing Table 2
fprintf('AA Tire Temperature \tNearest Estimate(mm)\tLinear Estimate(mm) \tSpline Estimate(mm) \tActual(mm)  \tPercent Error Nearest\tPercent Error Linear\tPercent Error Spline\tAbs Value of Error Nearest(mm)  \tAbs Value of Error Linear   \tAbs Value of Error Spline\n');

for n = 1:length(interpolation_values)
   fprintf(' %0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\n',interpolation_values(n),nearest(n),linear(n),spline(n),interpolation_values_AA_Temp_Actual(n),nearest_point_PE(n),linear_PE(n),spline_PE(n),nearest_point_abs_error(n),linear_abs_error(n),spline_abs_error(n));
end




% Plotting Pretty Much Everything at Once

plot(interpolation_values,linear,'r-'); hold on;
plot(interpolation_values,nearest_point,'b-'); hold on;
plot(interpolation_values,spline,'k-'); hold on;
plot(interpolation_values,interpolation_values_AA_Temp_Actual,'ro'); hold on;
plot(interpolation_values,actual_deflection_values_interpolation,'bo'); hold on;
title('Pretty Much Everything');
xlabel('\bfInterpolation Values','FontSize',14);
legend('Linear Interpolation','Nearest Point Interpolation','Spline Interpolation','AA Temp Interpolation','Deflection Values Interpolation');
 
% No tires were harmed in the making of this Lab Assignment.


%% Part 4
clear; clc;

% Importing Excel files

AA_Temp = xlsread('tire_lab','A22:A222');
AA_Deflection_Values = xlsread('tire_lab','B22:B222');
AA_Temp_Values = xlsread('tire_lab','C22:C222');

% Actual number of runs

AA_Temp_Value_Locations = floor(linspace(1,200,20));

% Table 1

fprintf('\nAA Temp Value\tDeflection Value\n');
for n = 1:length(AA_Temp_Value_Locations)
   fprintf(' %0.1f\t\t\t%0.1f\n', AA_Temp(AA_Temp_Value_Locations(n)),AA_Deflection_Values(AA_Temp_Value_Locations(n)))
end

% Pulling data from Table 1

AA_Temp_Value_Actual = zeros(1,10);

for n = 1:length(AA_Temp_Value_Locations)
    AA_Temp_Value_Actual(n) = AA_Temp(AA_Temp_Value_Locations(n));
end

AA_Deflection_Value_Actual = zeros(1,10);

for n = 1:length(AA_Temp_Value_Locations)
   AA_Deflection_Value_Actual(n) = AA_Deflection_Values(AA_Temp_Value_Locations(n));
end

% Interpolation Info
interpolation_values = [(-9.7) (-6.7) .2 4.3 9.5];

linear = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'linear');
nearest_point = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'nearest_point');
spline = interp1(AA_Temp_Value_Actual,AA_Deflection_Value_Actual,interpolation_values,'spline');

% Interpolation Percent Error

linear_PE = zeros(1,5);
nearest_point_PE = zeros(1,5);
spline_PE = zeros(1,5);
actual_deflection_values_interpolation = [136 129 13 60 241];

for n = 1:length(linear_PE)
   linear_PE(n) = (abs(linear(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end

for n = 1:length(nearest_point_PE)
    nearest_point_PE(n) = (abs(nearest_point(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end
    
for n = 1:length(spline_PE)
    spline_PE(n) = (abs(spline(n)-actual_deflection_values_interpolation(n)))/actual_deflection_values_interpolation(n)*100;
end
    
% Interpolation Absolute Value Error

linear_abs_error = zeros(1,5);
nearest_point_abs_error = zeros(1,5);
spline_abs_error = zeros(1,5);

for n = 1:length(linear)
   linear_abs_error(n) = abs(linear(n)-actual_deflection_values_interpolation(n));
end

for n = 1:length(nearest_point)
   nearest_point_abs_error(n) = abs(nearest_point(n)-actual_deflection_values_interpolation(n));
end

for n = 1:length(spline)
   spline_abs_error(n) = abs(spline(n)-actual_deflection_values_interpolation(n));
end

% Mean of Abs Value Error

linear_mean_abs_error = (sum(linear_abs_error)/length(linear_abs_error));
nearest_point_mean_abs_error = (sum(nearest_point_abs_error)/length(nearest_point_abs_error));
spline_mean_abs_error = (sum(spline_abs_error)/length(spline_abs_error));

% Mean of Errors Squared

linear_mean_squared_abs_error = (sum(linear_abs_error)/length(linear_abs_error))^2;
nearest_point_mean_squared_abs_error = (sum(nearest_point_abs_error)/length(nearest_point_abs_error))^2;
spline_mean_squared_abs_error = (sum(spline_abs_error)/length(spline_abs_error))^2;

% Grabbing the Locations of the Interpolation Values in AA_Temp

interpolation_value_locations_AA_Temp = zeros(1,5);

for n = 1:length(interpolation_values)
    interpolation_value_locations_AA_Temp(n) = find(AA_Temp == interpolation_values(n));
end


% Grabbing the Temp Values of the Interpolation Values

interpolation_values_AA_Temp_Actual = zeros(1,5);

for n = 1:length(interpolation_values)
   interpolation_values_AA_Temp_Actual(n) = AA_Temp_Values(interpolation_value_locations_AA_Temp(n));
end


% Printing Table 2
fprintf('AA Tire Temperature \tNearest Estimate(mm)\tLinear Estimate(mm) \tSpline Estimate(mm) \tActual(mm)  \tPercent Error Nearest\tPercent Error Linear\tPercent Error Spline\tAbs Value of Error Nearest(mm)  \tAbs Value of Error Linear   \tAbs Value of Error Spline\n');

for n = 1:length(interpolation_values)
   fprintf(' %0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\t%0.1f\n',interpolation_values(n),nearest(n),linear(n),spline(n),interpolation_values_AA_Temp_Actual(n),nearest_point_PE(n),linear_PE(n),spline_PE(n),nearest_point_abs_error(n),linear_abs_error(n),spline_abs_error(n));
end




% Plotting Pretty Much Everything at Once

plot(interpolation_values,linear,'r-'); hold on;
plot(interpolation_values,nearest_point,'b-'); hold on;
plot(interpolation_values,spline,'k-'); hold on;
plot(interpolation_values,interpolation_values_AA_Temp_Actual,'ro'); hold on;
plot(interpolation_values,actual_deflection_values_interpolation,'bo'); hold on;
title('Pretty Much Everything');
xlabel('\bfInterpolation Values','FontSize',14);
legend('Linear Interpolation','Nearest Point Interpolation','Spline Interpolation','AA Temp Interpolation','Deflection Values Interpolation');
 



% Calculating Degrees Celcius

celcius_values_estimated = zeros(1,5);

for n = 1:length(celcius_values_estimated)
   celcius_values_estimated(n) = (210 + 4*(interpolation_values(n)-10));
end

% Pulling Actual Temperatures

celcius_values_actual = zeros(1,5);

for n = 1:length(celcius_values_actual)
    celcius_values_actual(n) = AA_Temp_Values(interpolation_value_locations_AA_Temp(n));
end


% Plotting Not Quite as Much all at Once

figure
plot(interpolation_values,celcius_values_actual,'k-'); hold on;
plot(interpolation_values,celcius_values_estimated,'r-'); hold on;
title('\bfTemperature vs. AA Tire Degrees','FontSize',14);
xlabel('\bfAA Tire Degrees','FontSize',14);
ylabel('\bfTemperature (Celcius)','FontSize',14);
legend('Actual Temperature','Estimated Temperature');

