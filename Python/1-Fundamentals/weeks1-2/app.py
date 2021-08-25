from banking_pkg import account


def atm_menu(name):
    print("")
    print("          === Automated Teller Machine ===          ")
    print("User: " + name)
    print("------------------------------------------")
    print("| 1.    Balance     | 2.    Deposit      |")
    print("------------------------------------------")
    print("------------------------------------------")
    print("| 3.    Withdraw    | 4.    Logout       |")
    print("------------------------------------------")


print("          === Automated Teller Machine ===          ")
while True:
    user = input("Enter name to register: ")
    if len(user) > 10:
        print("The maximum name length is 10 characters.")
        continue
    elif len(user) == 0:
        print("You must enter a name")
    else:
        break

while True:
    pin = input("Enter PIN: ")
    if len(pin) == 4 and pin.isnumeric():
        break
    else:
        print("PIN must contain 4 numbers")
        continue

balance = 0.00
print(user + " has been registered with a starting balance of $0")


# Login
while True:
    print("          === Automated Teller Machine ===          ")
    print("LOGIN")
    name_to_validate = input("Enter name: ")
    pin_to_validate = input("Enter PIN: ")
    if name_to_validate == user and pin_to_validate == pin:
        print("Login successful!")
        break
    else:
        print("Invalid credentials!")

while True:
    atm_menu(user)
    option = input("Choose an option: ")
    if option == "1":
        account.show_balance(balance)
    elif option == "2":
        balance = account.deposit(balance)
        print("Current Balance: $" + str(balance))
    elif option == "3":
        balance = account.withdraw(balance)
        print("Current Balance: $" + str(balance))
    elif option == "4":
        account.logout(user)
        break
