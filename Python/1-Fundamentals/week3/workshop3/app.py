from donations_pkg.homepage import show_homepage
from donations_pkg.homepage import donate
from donations_pkg.homepage import show_donations
from donations_pkg.user import login
from donations_pkg.user import register

database = {"admin": "1"}
donations = []
authorized_user = ""
show_homepage()
if authorized_user == "":
    print("You must be logged in to donate")
else:
    print("Logged in as:", authorized_user)

while True:
    show_homepage()
    option = input("\nChoose an option: \n").lower()
    if option == '1':
        username = input("\nEnter username: ").lower()
        password = input("Enter password: ")
        authorized_user = login(database, username, password)
    elif option == '2':
        username = input("\nEnter username: ").lower()
        password = input("Enter password: ")
        authorized_user = register(database, username)
        if authorized_user != "":
            database[username] = password
    elif option == '3':
        if authorized_user == "":
            print("You are not logged in.")
        else:
            donations.append(donate(authorized_user))
    elif option == '4':
        show_donations(donations)
    elif option == '5':
        print("Goodbye")
        break
