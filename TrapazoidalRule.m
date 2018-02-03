%Lab 4
%% Problem 2
clear; clc;

load Lab4;

% Add in Data.Current
Data.Power = 120*Data.Current;

% Add in DeltaT

Min = Data.Min;
Sec = Data.Second;
DeltaT = zeros(337678,1);

for n = 2:length(Data.Min)
    DeltaT(n) = (Min(n) * 60 + Sec(n)) - (Min(n-1) * 60 + Sec(n-1));
end

Data.DeltaT = DeltaT;

% Find negative delta_t values
negative_delta_t = find(Data.DeltaT < 0);

% Fix negative delta_t values
Data.DeltaT(negative_delta_t) = Data.DeltaT(negative_delta_t) + 3600;

% Calculate min/max
max_deltaT = max(Data.DeltaT);

% Calculate DeltaT Average
total_deltaT = sum(Data.DeltaT);
average_DeltaT = total_deltaT / 337678;

% Add in Trapezoidal Estimate
estimate = zeros(337678,1);
power = Data.Power;
for n = 2:length(Data.DeltaT)
    estimate(n) = ((power(n) + power(n-1))/2) * Data.DeltaT(n);
    estimate(n) = estimate(n) / 1000 / 3600;
end

Data.Energy = estimate;

Total_Energy = sum(Data.Energy);

% Calculate Percent Error
percent_error = ((Total_Energy - 320)/320)*100;

% 
% % September 15th, 2013
% sep_15 = find(Data.Month == 9 & Data.Day == 15);
% sep_15_sum = sum(Data.Energy(sep_15));
% 
% % Calculate Hourly Usage of September 15th
% sep_15_hourly = zeros(1,24);
% for n = 1:24
%     sep_15_hourly(n) = sum(Data.Energy(find(Data.Hour == n-1)));
% end
%     
%     
% % Plot Hourly Usage of September 15th    
% figure;
% plot(1:24,sep_15_hourly,'r-');
% title('September 15th Hourly Usage');
% xlabel('Time (hours)'); ylabel('Energy Usage (kWh)');

% September 13th through October 13th
% Calculate Daily Usage

sep_daily_usage = zeros(1,30);
hourly_usage = zeros(1,24);
for n = 13:30
    for k = 1:24
        hourly_usage(k) = sum(Data.Energy(find(Data.Month == 9 & Data.Hour == k-1 & Data.Day == n)));
        sep_daily_usage(n) = sep_daily_usage(n) + sum(hourly_usage(k));
    end
    
end

oct_daily_usage = zeros(1,13);
hourly_usage = zeros(1,24);
for n = 1:13
    for k = 1:24 
        hourly_usage(k) = sum(Data.Energy(find(Data.Month == 10 & Data.Hour == k-1 & Data.Day == n)));
        oct_daily_usage(n) = oct_daily_usage(n) + sum(hourly_usage(k));
    end
    
end

% Plot September and October Daily Usage

figure;
plot(1:30,sep_daily_usage, 'b-'); hold on;
plot(1:13,oct_daily_usage, 'r-');
xlabel('Day'); ylabel('Energy Usage(kWh)'); title('Daily Energy Usage of Sep. vs. Oct.');
legend('September','October');
