import random

total_rounds = 0
total_stayed = 0
total_switched = 0
total_win_stayed = 0
total_lost_stayed = 0
total_win_switched = 0
total_lost_switched = 0

door = [False, False, True]


def stayOrSwitchInput():
    while True:
        secondPick = input(
            "Do you stay or switch? Please enter 'stay' or 'switch': ").lower()
        if secondPick != "stay" and secondPick != "switch":
            print("Invalid option, please enter 'stay' or 'switch'")
            continue
        else:
            return secondPick


def stayOrSwitch(pick, door):
    global total_rounds
    global total_stayed
    global total_win_stayed
    global total_lost_stayed
    global total_switched
    global total_win_switched
    global total_lost_switched

    print("\nYou have selected door", pick)
    print("Probability wise, you have 1/3 chance in finding the treasure chest behind this door.")
    print("We are now going to change things up a bit, I will now remove one of the other 2 doors")
    print("The door that I remove is definitely a door that is empty.")

    doorlist = [1, 2, 3]


# branch when chosen door is winner
    if door[pick-1] == True:
        del doorlist[pick-1]
        removed_door = doorlist.pop(random.randrange(len(doorlist))-1)
        other_door = doorlist[0]
        print("We will now remove door ", removed_door)
        print("You now see your originally picked door",
              pick, "and door", other_door)
        secondPick = stayOrSwitchInput()
        if secondPick == "stay":
            print("You have chosen to stay with door", pick)
            print("\nCONGRATULATIONS YOU HAVE WON THE TREASURE CHEST!")
            total_rounds += 1
            total_stayed += 1
            total_win_stayed += 1
        else:
            print("\nYou have opened the other door and found a penny... Play again!")
            total_rounds += 1
            total_switched += 1
            total_lost_switched += 1

# branch when chosen door is a loser
    else:
        true_door = 0
        for i in range(0, 3):
            if door[i] == True:
                true_door = i+1
                break

        if true_door == 1 and pick == 2:
            removed_door = 3
        if true_door == 1 and pick == 3:
            removed_door = 2
        if true_door == 2 and pick == 1:
            removed_door = 3
        if true_door == 2 and pick == 3:
            removed_door = 1
        if true_door == 3 and pick == 1:
            removed_door = 2
        if true_door == 3 and pick == 2:
            removed_door = 1
        print("We will now remove door ", removed_door)
        print("You now see your originally picked door",
              pick, "and door", true_door)
        secondPick = stayOrSwitchInput()
        if secondPick == "stay":
            print(
                "\nYou choose to stay with the original door and found a penny... Too bad so sad!")
            total_rounds += 1
            total_stayed += 1
            total_lost_stayed += 1
        else:
            print(
                "\nYOU HAVE CHANGED DOORS AND CONGRATULATIONS YOU HAVE WON THE TREASURE CHEST!")
            total_rounds += 1
            total_switched += 1
            total_win_switched += 1


while True:
    random.shuffle(door)

    print("\nIn front of you stands 3 identical doors. Behind 1 of these doors lies a chest full of gold bars. Behind the other 2 doors, a single penny.")
    print("In this game, you will pick a door and win whatever is behind it")
    print("\n----| 1 |----| 2 |----| 3 |----\n")
    pick = int(input("Choose a door [1, 2, 3, or 4 to quit]: "))
    if pick not in range(1, 5):
        print("Invalid selection. Please enter 1, 2, 3, or 4")
        continue
    if pick == 4:
        print("\nThank you for playing.")
        print("Total rounds played:", total_rounds)

        print("Total times you stayed on your picked door:", total_stayed)
        print("Total times you won by staying:", total_win_stayed)
        print("Total times you've lost by staying:", total_lost_stayed)
        # print("Total percent of winning by staying is",
        #      total_win_stayed/total_stayed)

        print("Total times you changed doors:", total_switched)
        print("Total times you've won by changing:", total_win_switched)
        print("Total times you've lost by changing:", total_lost_switched)
        # print("Total percent of winning by changing is",
        #      total_win_switched/total_win_switched)
        break
    stayOrSwitch(pick, door)
