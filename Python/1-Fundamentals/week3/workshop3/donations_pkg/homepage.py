def show_homepage():
    print("    === DonateMe Homepage ===   ")
    print("-------------------------------")
    print("| 1. Login   | 2. Register      |")
    print("--------------------------------")
    print("| 3. Donate  | 4. Show Donations|")
    print("--------------------------------")
    print("|          5. Exit              |")
    print("--------------------------------")


def donate(username):
    donation_amt = float(input("Enter amount to donate: $"))
    donation = (str(username) + " donated $" + str(donation_amt))
    return donation


def show_donations(donations):
    print("\n--- All Donations ---")
    if donations == []:
        print("\nCurrently, there are no donations.\n")
    else:
        for donee in donations:
            print(donee)
