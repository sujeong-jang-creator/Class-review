class Customer:

    def __init__(self, name, grade) : 
        self.cust_name = name
        self.cust_grade = grade
        print('Customer__init__')

    def getCustName(self):
        return self. cust_name