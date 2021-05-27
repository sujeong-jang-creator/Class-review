class Coffee:

    def __init__(self, name, cost):
        self.name = name
        self.cost = cost
        print('Coffee__init__')

    def getCoffeeName(self):
        print('Coffee getCoffeeName')
        return self.name