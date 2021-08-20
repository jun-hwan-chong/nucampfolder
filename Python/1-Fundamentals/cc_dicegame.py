import random


def dice_game():
    high_score = 0
    while True:
        print("Current High Score: ", high_score)
        print("1) Roll Dice\n2) Leave Game")
        choice = input("Enter your choice: ")
        if choice == "1":
            roll1 = random.randint(1, 6)
            roll2 = random.randint(1, 6)
            print("You roll a... ", roll1)
            print("You roll a... ", roll2, "\n")
            print("You have rolled a total of: ", roll1 + roll2)
            if high_score < (roll1 + roll2):
                print("New high score!\n")
                high_score = roll1 + roll2
        elif choice == "2":
            print("Goodbye!")
            break
        else:
            print("Invalid choice")


dice_game()
