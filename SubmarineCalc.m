%, Lab 5
%% Problem C
clear; clc;

load Submarine_Hatch.mat;

% % Plotting Initial Data
% plot(x_left, y_hatch, x_right, y_hatch);
% axis([-1 1 -2 0]);

% Prompt user for current depth
altitude = input('What is the current depth? ');

% Determine Force on the Outside of Hatch

water_density = 1027;
atmospheric_pressure = 101353;
g = 9.81;


for i = 2:length(x_left)
    y = altitude-(0-y_hatch(i-1));
    outside_force(i) = (atmospheric_pressure + water_density*g*y)*(((x_right(i-1)-x_left(i-1))+(x_right(i)-x_left(i)))/2)*abs((y_hatch(i)-y_hatch(i-1)));
end
total_outside_force = sum(outside_force);
fprintf('Total Outside Force: %0.3f\n',total_outside_force);

% Determine force on the inside of hatch


for i = 2:length(x_left)
    y = altitude-(0-y_hatch(i-1));
    inside_force(i) = (atmospheric_pressure)*(((x_right(i-1)-x_left(i-1))+(x_right(i)-x_left(i)))/2)*abs((y_hatch(i)-y_hatch(i-1)));
end
total_inside_force = sum(inside_force);
fprintf('Total Inside Force: %0.3f\n',total_inside_force);

% Calculate Net Force
net_force = total_outside_force - total_inside_force;
fprintf('Net Force on Hatch: %0.3f\n',net_force);

% Calculate Safe Depth
if((net_force - 5000000) > 0)
    disp('Depth is not safe.');
else
    disp('Depth is safe.');
end

%% Problem D
clear; clc;

load Airplane_Hatch.mat;

% Prompt user for current altitude
altitude = input('What is the current altitude? ');

% Determine Force on the Outside of Hatch

atmospheric_pressure = 101353;
h = altitude;
P = atmospheric_pressure*(1-2.25577*10^-5*h)^5.25588;

for i = 2:length(x_left)
    y = altitude-(0-y_hatch(i-1));
    outside_force(i) = (P)*(((x_right(i-1)-x_left(i-1))+(x_right(i)-x_left(i)))/2)*abs((y_hatch(i)-y_hatch(i-1)));
end
total_outside_force = sum(outside_force);
fprintf('Exterior Pressure: %0.3f\n',P);
fprintf('Total Outside Force: %0.3f\n',total_outside_force);

% Determine force on the inside of hatch


for i = 2:length(x_left)
    y = altitude-(0-y_hatch(i-1));
    inside_force(i) = (atmospheric_pressure)*(((x_right(i-1)-x_left(i-1))+(x_right(i)-x_left(i)))/2)*abs((y_hatch(i)-y_hatch(i-1)));
end
total_inside_force = sum(inside_force);
fprintf('Total Inside Force: %0.3f\n',total_inside_force);

% Calculate Net Force
net_force = total_inside_force - total_outside_force;
fprintf('Net Force on Hatch: %0.3f\n',net_force);

% Calculate Safe Altitude
if((net_force - 350000) > 0)
    disp('Altitude is not safe.');
else
    disp('Altitude is safe.');
end
