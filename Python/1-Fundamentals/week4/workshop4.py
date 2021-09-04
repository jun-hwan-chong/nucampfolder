class User:
    def __init__(self, name, pin, password):
        self.name = name
        self.pin = pin
        self.password = password

    def change_name(self, newName):
        if len(newName) in range(2, 11):
            self.name = newName
        else:
            print("New username must be between 2 to 10 characters")

    def change_pin(self, newPin):
        if len(newPin) == 4 and newPin.isnumeric() and newPin != self.pin:
            self.pin = newPin
        else:
            print("New PIN must be 4 numbers only and not the current PIN")

    def change_password(self, newPassword):
        if len(newPassword) >= 5 and ' ' not in newPassword and newPassword != self.password:
            self.password = newPassword
            print("Password has been changed")
        else:
            print(
                "New password must be greater than 5 characters, contain no space, and must not be previous")

# This function was found on https://stackoverflow.com/questions/21208376/converting-float-to-dollars-and-cents


def currency_convert(amount):
    return '${:,.2f}'.format(amount)


class BankUser(User):
    def __init__(self, name, pin, password):
        super().__init__(name, pin, password)
        self.balance = 0
        self.on_hold = False

    def flip_on_hold(self):
        self.on_hold = not self.on_hold

    def show_balance(self):
        print(self.name, "has an account balance of:",
              currency_convert(self.balance))

    def withdraw(self, amount):
        if self.on_hold == False:
            if amount > 0 and (amount <= self.balance):
                self.balance -= amount
            else:
                print(
                    "Invalid withdraw. Please use amount over $0.00 and lower than your current balance")
        else:
            print("Account is frozen")

    def deposit(self, amount):
        if self.on_hold == False:
            if amount > 0:
                self.balance += amount
            else:
                print("Invalid deposit. Please use amount over $0.00")
        else:
            print("Account is frozen")

    def transfer_money(self, receiving_user, amount):
        if self.on_hold == False:
            if amount > 0 and (self.balance >= amount):
                print("\nYou are transferring", currency_convert(
                    amount), "to", receiving_user.name)
                print("Authentication required")
                pin_input = int(input("Enter your PIN: "))
                if pin_input == self.pin:
                    print("Transfer authorized")
                    self.balance -= amount
                    receiving_user.balance += amount

                else:
                    print("Invald PIN. Transaction canceled.")
            else:
                print("Invalid transfer request. Please transfer amount over $0")
        else:
            print("Account is frozen")

    def request_money(self, requested_from_user, amount):
        if self.on_hold == False:
            if amount > 0 and (requested_from_user.balance >= amount):
                print("\nYou are requesting $", currency_convert(amount),
                      "from", requested_from_user.name)
                print("User authentication is required...")
                pin_input = int(
                    input("Enter " + str(requested_from_user.name) + "'s pin: "))
                if pin_input == requested_from_user.pin:
                    password_input = input("Enter your password: ")
                    if password_input == self.password:
                        print("Request authorized")
                        requested_from_user.balance -= amount
                        print(requested_from_user.name,
                              "sent", currency_convert(amount))
                        self.balance += amount
                    else:
                        print("Invalid password. Transaction canceled.")
                else:
                    print("Invalid PIN. Transaction canceled.")
            else:
                print("Invalid request. Please use request amount over $0")
        else:
            print("Account is frozen")


""" Driver Code for Task 1
Jun = User("Jun", 1234, "password")
print(Jun.name, Jun.pin, Jun.password)
"""

""" Driver Code for Task 2
print("\nTask 2")
Jun = User("Jun", 1234, "password")
print(Jun.name, Jun.pin, Jun.password)
Jun.change_name("Junny")
Jun.change_pin(4321)
Jun.change_password("newpassword")
print(Jun.name, Jun.pin, Jun.password)
"""

""" Driver Code for Task 3
print("\nTask3")
Jun = BankUser("Jun", 1234, "password")
print(Jun.name, Jun.pin, Jun.password)
"""

""" Driver Code for Task 4
print("\nTask 4")
Jun = BankUser("Jun", 1234, "password")
Jun.show_balance()
Jun.deposit(1000)
Jun.show_balance()
Jun.withdraw(500)
Jun.show_balance()
"""

""" Driver Code for Task 5
print("\nTask 5")
Jun = BankUser("Jun", 1234, "password")
Chong = BankUser("Chong", 1111, "pass")
Chong.deposit(5000)
Chong.show_balance()
Jun.show_balance()
Chong.transfer_money(Jun, 500)
Chong.show_balance()
Jun.show_balance()
Chong.request_money(Jun, 250)
Chong.show_balance()
Jun.show_balance()
"""

""" Driver Code for Bonus Tasks
Jun = BankUser("Jun", 1234, "password")
Jun.deposit(1000)
Jun.show_balance()
Chong = BankUser("Chong", 4321, "pass")
Jun.transfer_money(Chong, 100.55)
Chong.show_balance()
Chong.request_money(Jun, 100.35)
Chong.show_balance()
Jun.show_balance()
Jun.withdraw(100)
Jun.show_balance()
Jun.flip_on_hold()
Jun.show_balance()
"""
