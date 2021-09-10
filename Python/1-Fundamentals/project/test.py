true_door = 0

door = [False, False, True]
for i in range(1, 3):
    if door[i]:
        true_door = i + 1
        break
print(true_door)
