clear;clc;close all;
rng('shuffle');
load Dice;

disp('Weclome to Craps!');
play = menu('Ready to play?','Yes','No');
money = input('How much money do you have? $');

while play == 1 && money > 0
    bet = input('Place your bet. $');
    if money == bet
        disp('You are all in, GOOD LUCK');
    end
    disp('Hit enter when the shooter is ready');
    pause
    
    %Rolls dice  and determines output (win/lose/need to roll again)
    roll = randi([1 6],[1 2]);
    imshow([Dice{roll}]);
    total_1 = roll(1)+roll(2);
    fprintf('You rolled a %i.\n',total_1);
    if total_1 == 7 || total_1 == 11
        fprintf('You rolled a %i. You are a natural, you won!\n',total_1);
        money = money + bet;
        fprintf('Current money is $%i.\n',money);
    elseif total_1 == 2 || total_1 == 3 || total_1 == 12
        fprintf('You rolled a %i. You crapped out, you lose.\n',total_1);
        money = money - bet;
        fprintf('Current money is $%i.\n',money)
        %sets to keep rolling until the win or lose condition is met
    else
        total_2 = 0;
        play_2 = 1;
        while play_2 == 1
            play_2 = menu('Roll again?','Yes');
            roll2 = randi([1 6],[1 2]);
            imshow([Dice{roll2}]);
            total_2 = roll2(1)+roll2(2);
            fprintf('You rolled a %i.\n',total_2);
            if total_2 == total_1
                fprintf('Your roll of %i is the same as your first roll of %i. You won!\n',total_2,total_1);
                money = money + bet;
                fprintf('Current money is $%i.\n',money)
                play_2 = 2;
            elseif total_2 == 7
                fprintf('You rolled a %i. You lose.\n',total_2);
                money = money - bet;
                fprintf('Current money is $%i.\n',money)
                play_2 = 2;
            end
        end
    end
    play = menu('Play again?','Yes','No');
    if play == 2
        break
    end
    if play == 2
        break
    end
end

