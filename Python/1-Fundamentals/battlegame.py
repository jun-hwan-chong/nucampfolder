# Task 1

wizard = "Wizard"
elf = "Elf"
human = "Human"
jun = " Jun"

wizard_hp = 70
elf_hp = 100
human_hp = 150
jun_hp = 9999

wizard_damage = 150
elf_damage = 100
human_damage = 20
jun_damage = 9999

dragon_hp = 300
dragon_damage = 50

# Task 2 and 3
while True:
    print("1)    Wizard")
    print("2)    Elf")
    print("3)    Human")
    print("4)    Jun")
    character = input("Choose your character: ")
    if character == "1":
        character = wizard
        my_hp = wizard_hp
        my_damage = wizard_damage
        break
    elif character == "2":
        character = elf
        my_hp = elf_hp
        my_damage = elf_damage
        break
    elif character == "3":
        character = human
        my_hp = human_hp
        my_damage = human_damage
        break
    elif character == "4":
        character = jun
        my_hp = jun_hp
        my_damage = jun_damage
        break
    else:
        print("Unknown character")

print("You have chose the character: ", character)
print("Health: ", my_hp)
print("Damage: ", my_damage)

# Task 4
while True:
    dragon_hp = dragon_hp - my_damage
    print("The ", character, " damaged the Dragon!")
    print("The Dragon's hitpoints are now: ", dragon_hp, "\n")
    if (dragon_hp <= 0):
        print("The Dragon has lost the battle", "\n")
        break
    my_hp = my_hp - dragon_damage
    print("The Dragon strikes back at ", character)
    print("The ", character, " hitpoints are now: ", my_hp, "\n")
    if (my_hp <= 0):
        print("The ", character, " has lost the battle", "\n")
        break
