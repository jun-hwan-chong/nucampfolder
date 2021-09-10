def binary_search(the_list, target):
    lower_bound = 0
    upper_bound = len(the_list - 1)

    while lower_bound <= upper_bound:
        pivot = (lower_bound + upper_bound) // 2
        pivot_value = the_list[pivot]

        if pivot_value == target:
            return pivot
        if pivot_value > target:
            upper_bound = pivot - 1
        else:
            lower_bound = pivot + 1
    return -1


the_list = [12, 3]
print(the_list.index(3))
