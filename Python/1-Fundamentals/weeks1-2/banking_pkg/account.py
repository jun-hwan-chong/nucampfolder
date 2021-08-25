def show_balance(balance):
    print("Your balance is: $" + str(balance))


def deposit(balance):
    amount = float(input("Enter amount of deposit: "))
    return float(balance) + amount


def withdraw(balance):
    amount = float(input("Enter amount to withdraw: "))
    if (balance - amount) < 0:
        print("Where are you going to get that kind of money")
        print("Current Balance: $" + str(balance))
        return float(balance)
    else:
        return float(balance) - amount


def logout(name):
    print("Goodbye " + name)
