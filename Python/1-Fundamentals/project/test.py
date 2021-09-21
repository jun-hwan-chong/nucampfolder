true_door = 0

door = [False, False, True]
for i in door:
    print(i)
    if door[i] == True:
        true_door = i + 1
        break
print(true_door)
