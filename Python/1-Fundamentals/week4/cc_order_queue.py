class Queue:
    def __init__(self):
        self.items = []

    def size(self):
        return len(self.items)

    def enqueue(self, item):
        self.items.append(item)

    def dequeue(self):
        if self.size() == 0:
            return None
        return self.items.pop(0)

    def show_queue(self):
        print(self.items)


class IceCreamShop:
    def __init__(self, flavors):
        self.flavors = flavors
        self.orders = Queue()

    def take_order(self, customer, flavor, scoops):
        self.customer = customer
        self.flavor = flavor
        self.scoops = scoops

        valid_flavor = flavor in self.flavors
        valid_scoop = scoops > 0 and self.scoops <= 3

        if valid_flavor == False:
            print("Sorry, we don't have that flavor")
        elif valid_scoop == False:
            print("Choose between 1-3 scoops")
        else:
            print("Order created!")
            order = {"customer": customer,
                     "flavor": flavor, "scoops": scoops}
            self.orders.enqueue(order)

    def show_all_orders(self):
        print("\nAll Pending Ice Cream Orders:")
        for each_order in self.orders.items:
            print("Customer:", each_order["customer"], "-- Flavor:",
                  each_order["flavor"], " -- Scoops:", each_order["scoops"])

    def next_order(self):
        print("\nNext Order Up!")
        current_order = self.orders.dequeue()
        print("Customer:", current_order["customer"], "-- Flavor:",
              current_order["flavor"], "-- Scoops:", current_order["scoops"])


# Testing
shop = IceCreamShop(["rocky road", "mint chip", "pistachio"])
shop.take_order("Zachary", "pistachio", 3)
shop.take_order("Marcy", "mint chip", 1)
shop.take_order("Leopold", "vanilla", 2)
shop.take_order("Bruce", "rocky road", 0)
shop.show_all_orders()
shop.next_order()
shop.show_all_orders()
