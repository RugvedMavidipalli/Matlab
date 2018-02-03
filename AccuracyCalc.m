%% Part A

n = 0;
number(n+1) = 2.5;
accuracy(n+1) = abs((number(n+1)^5)-80.5);

for n = 1:3
   number(n+1) = number(n)-(number(n)^5-80.5)/(5*number(n)^4);
   accuracy(n+1) = abs((number(n+1)^5)-80.5);
end

%% Part B
clear; clc;

% Declare value to be calculated
number = input('Number: ');
% Declare value for initial guess
initial_guess = input('Initial Guess: ');

% Calculate Accuracy
accuracy = abs((initial_guess^5)-number);

% Calculate New Values
count = 0; n = 0;

estimate = zeros(1,100);
estimate(1) = initial_guess;
while accuracy > 0.0001
    n = n+1;
    estimate(n+1) = estimate(n)-((estimate(n)^5)-number)/(5*estimate(n)^4);
    accuracy = abs((estimate(n+1)^5)-number);
    
    if n > 100
        break;
    end
end
fprintf('Number of iterations performed: %i\n',n);
if n < 100
   fprintf('Final estimate: %0.5f\n',estimate(n)); 
else
   disp('Iterations exceed 100.');
end

plot(0:n-1,estimate(1:n));
title('Iteration vs. Estimate');
xlabel('Iterations');
ylabel('Estimate');

%% Part C
clear; clc;

% Declare value to be calculated
% number = input('Number: ');
% Declare value for initial guess
initial_guess = input('Initial Guess: ');

% Calculate Accuracy
accuracy = abs(1000-2*(initial_guess)+3*(initial_guess^(2/3)));

% Calculate New Values
count = 0; n = 1;

estimate = zeros(1,100);
estimate(1) = initial_guess;
while accuracy > 0.0001
    
    estimate(n+1) = estimate(n)-(1000-2*(estimate(n))+3*(estimate(n)^(2/3)))/(-2+2*(estimate(n)^(-1/3)));
    accuracy = abs(1000-2*(estimate(n))+3*(estimate(n)^(2/3)));
    
    n = n+1;
end
fprintf('Number of iterations performed: %i\n',n);

   fprintf('Final estimate: %0.5f\n',estimate(n)); 

  
