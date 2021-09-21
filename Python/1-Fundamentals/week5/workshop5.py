import random
"""
For some odd reason the nucamp's submission page for this workshop is not properly submitting my .py
So I'm pasting my workshop5.py into the text field """


def guess_random_number(tries, start, stop):
    number = random.randint(start, stop)
    past_guess = []
    while tries != 0:
        print("Number of tries left:", tries)
        while True:
            guess = int(input("Guess a number between " +
                              str(start) + " and " + str(stop) + ": "))

            if str(guess).isnumeric() == False or (guess < start or guess > stop):
                print("Please enter numbers only between", start, "and", stop)
            elif guess in past_guess:
                print("You already guessed number", guess, "Please try again")
            else:
                past_guess.append(guess)
                print(past_guess)
                break
        if guess == number:
            print("You guessed the correct answer!")
            return
        if guess < number:
            print("Guess higher!")
        else:
            print("Guess lower!")
        tries -= 1
        if tries == 0:
            print("You've used all your tries. You failed.")
            return


def guess_random_num_linear(tries, start, stop):
    number = random.randint(start, stop)
    print("The number for the program to guess is:", number)

    for i in range(start, stop + 1):
        print("Number of tries left:", tries)
        print("The program is guessing...", i)
        if i == number:
            print("The program has guessed the correct number!")
            return True
        else:
            tries -= 1
            if tries == 0:
                print("The program has failed to guess the correct number")
                return False


def guess_random_num_binary(tries, start, stop):
    number = random.randint(start, stop)
    print("Random number to find:", number)

    while start <= stop:
        pivot = (start + stop) // 2
        if pivot == number:
            print("Found it!", number)
            return
        if pivot > number:
            stop = pivot - 1
            print("Guessing lower!")
        else:
            start = pivot + 1
            print("Guessing higher!")
        tries -= 1
        if tries == 0:
            print("Your program failed to find the number.")
            return


def guess_menu():
    tries = int(input("\nEnter number of tries: "))
    start = int(input("Enter start value: "))
    stop = int(input("Enter end value: "))

    method = int(input(
        "\nPress 1 to guess manually\nPress 2 to search linearly\nPress 3 to perform binary seach"))
    if method == 1:
        guess_random_number(tries, start, stop)
    if method == 2:
        guess_random_num_linear(tries, start, stop)
    if method == 3:
        guess_random_num_binary(tries, start, stop)


def gambling_mode():
    player_money = 10
    while True:
        print("Your balance is: $", player_money)
        print("Make a bet. Will computer guess correctly or not")
        call = input(
            "Enter yes to guess computer WILL guess the correct number\nEnter no to guess computer WILL NOT guess the correct number\nGuess[yes] or [no]: ").lower()
        bet = int(input("How many dollars will you bet? Enter 1 to 10: "))
        result = guess_random_num_linear(5, 0, 10)
        if (result == True and call == 'yes') or (result == False and call == 'no'):
            player_money += bet
            print("You won! You now have $", player_money)
        else:
            player_money -= bet
            print("You lost. You now have $", player_money)

        if player_money <= 0:
            print("Game Over")
            return
        if player_money >= 50:
            print("You have over $50. You win!")
            return

# Test Driver Code 1
#guess_random_number(5, 0, 10)

# Test Task 2
# guess_random_num_linear(5, 0, 10)

# Test Task 3
# guess_random_num_binary(5, 0, 100)

# Bonus Task 2
# guess_menu()


# Bonus Task 4
gambling_mode()
