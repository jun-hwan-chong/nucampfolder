def login(database, username, password):
    if username in database and password == database[username]:
        print("Welcome", username)
        return username
    elif username in database and password != database[username]:
        print("\nWrong credentials\n")
    else:
        print("\nUsername does not exist\n")


def register(database, username):
    if username in database:
        print("\nUsername already registered.\n")
        return ""
    else:
        print("\n", username, "has been registered.")
        return username
