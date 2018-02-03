
clear; clc;
time = [0 2 4 6 8 10]; % Time values
latitude = [39.132844 39.132662 39.132353 39.132076 39.132001 39.131964]; % Latitude values
longitude = [-84.516888 -84.516955 -84.516878 -84.516945 -84.517047 -84.517095]; %Longitude Values

% Initialize vectors for distance and position
distance_values = zeros(1,length(time)); position_values = zeros(1,length(time)); 
% Calculate Distance Values
for n = 2:length(time)
    distance_values(n) = 222240*asind(sqrt((sind((latitude(n)-latitude(n-1))/2)^2) + cosd(latitude(n-1))*cosd(latitude(n))*(sind((longitude(n)-longitude(n-1))/2)^2)));
    % Calculate Position Values
    position_values(n) = sum(distance_values);
end

delta_t = time(2)-time(1); %Initialize delta for time values
f_prime_f = zeros(1,length(time)); %Initialize vector for first derivative
% Calculate First Derivate (Velocity) 
for n = 2:length(time);
    f_prime_f(n) = (position_values(n)-position_values(n-1))/delta_t; 
end

f_prime_f_three_point = zeros(1,length(time)); % Initialize vector for 3-pt derivative
% Calculate 3-pt derivative
for n = 2:length(time)-1;
    f_prime_f_three_point(n) = (position_values(n+1)-position_values(n-1))/(2*delta_t); 
end

f_double_prime_f = zeros(1,length(time)); % Initialize vector for second derivative (acceleration)
% Calculate second derivative (acceleration)
for n = 2:length(time)-1;
    f_double_prime_f(n) = (position_values(n+1)-2*position_values(n)+position_values(n-1))/(delta_t^2);
end

%%
% , Lab 2, Problem B
clear; clc;

load GPS_Data1;
% load GPS_Data2;

time = zeros(1,7); % Initialize usable time vector

% Converting time values into seconds
% Forget the hours, since the hour is always 9, therfore no change
for n = 1:length(minute)
    time(n) = (((minute(n)*60)+(second(n))) - 840);
end

distance_values = zeros(1,length(time));
position_values = zeros(1,length(time));

% Calculate distance vectors
for n = 2:length(time)
    distance_values(n) = 222240*asind(sqrt((sind((latitude(n)-latitude(n-1))/2)^2) + cosd(latitude(n-1))*cosd(latitude(n))*(sind((longitude(n)-longitude(n-1))/2)^2)));
    % Calculate Position Values
    position_values(n) = sum(distance_values);
end

% Calculate delta_T for selected data set
delta_t = time(2)-time(1);

% Vector of time already exists previously in code, copied again below:
% % Converting time values into seconds
% % Forget the hours, since the hour is always 9, therfore no change
% % for n = 1:length(minute)
% %     time(n) = (((minute(n)*60)+(second(n))) - 840);
% % end

f_prime_f = zeros(1,length(time)); % Initialize vector for first derivative (velocity)
% Calculate First Derivate (Velocity) 
for n = 2:length(time);
    f_prime_f(n) = (position_values(n)-position_values(n-1))/delta_t; 
end

% Initialize vector for absolute error (calculated/actual velocity)
abs_error_velocity = zeros(1,length(time));
% Calculate absolute error for calculated velocity vs. actual velocity
for n = 1:length(time)
    abs_error_velocity(n) = abs(f_prime_f(n)-actual_velocity(n));
end

f_prime_f_three_point = zeros(1,length(time)); % Initialize vector for 3-pt derivative
% Calculate 3-pt derivative
for n = 2:length(time)-1;
    f_prime_f_three_point(n) = (position_values(n+1)-position_values(n-1))/(2*delta_t); 
end

% Initialize vector for absolute error (calculated/actual 3-pt velocity)
abs_error_3pt_velocity = zeros(1,length(time));
% Calculate absolute error for calculated 3-pt velocity vs. actual velocity
for n = 1:length(time)
    abs_error_3pt_velocity(n) = abs(f_prime_f_three_point(n)-actual_velocity(n));
end

% Plotting Velocity Graphs

figure;
subplot(2,1,1);
plot(time,f_prime_f,'r*'); hold on;
plot(time,actual_velocity,'k-'); hold on;
plot(time,f_prime_f_three_point,'b-');
title('Estimated Velocity'); xlabel('time (sec)'); ylabel('Velocity (m/s)');
legend('Estimated Velocity','Actual Velocity','Estimated 3pt Velocity');

subplot(2,1,2);
plot(time,abs_error_velocity,'r*'); hold on;
plot(time,abs_error_3pt_velocity,'b*');
title('Velocity Error'); xlabel('time (sec)'); ylabel('Absolute Error (m/s)');
legend('Estimated Velocity Error','3pt Velocity Error');

% Initialize vector for second derivate
f_doubleprime_f = zeros(1,length(time));
% Calculate second derivative (acceleration)
for n = 2:length(time)-1;
    f_doubleprime_f(n) = (position_values(n+1)-2*position_values(n)+position_values(n-1))/(delta_t^2);
end

% Initialize vector for absolute error (doubleprime/actual acceleration)
abs_error_acceleration = zeros(1,length(time)-1);
% Calculate absolute error of second derivative
for n = 1:length(time)-1;
    abs_error_acceleration(n) = abs(f_doubleprime_f(n)-actual_acceleration(n));
end

% Initialize special time vector for actual_acceleration
time_acceleration = time;
% Fixing time vector for actual_acceleration
for n = 1:length(time)
    if n == length(time)
        time_acceleration(n) = [];
        f_doubleprime_f(n) = [];
    end
end

% Plotting Acceleration Graphs

figure;
subplot(2,1,1);
plot(time_acceleration,f_doubleprime_f,'k-'); hold on;
plot(time_acceleration,actual_acceleration,'r*') 
title('Estimated Acceleration'); xlabel('time (sec)'); ylabel('Acceleration (m/s^2)');
legend('Actual Acceleration','Estimated Acceleration');

subplot(2,1,2);
plot(time_acceleration,abs_error_acceleration,'r*');
title('Estimated Acceleration Error'); xlabel('time(sec)'); ylabel('Absolute Error (m/s)');

