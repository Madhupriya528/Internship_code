class Test:
    def show(self, a=None, b=None):
        if b is None:
            print(f"One parameter: {a}")
        else:
            print(f"Two parameters: {a}, {b}")

t = Test()
t.show(10)
t.show(10, 20)

2
class Test:
    def display(self, a, b=None):
        if b is None:
            print(f" {a}")
        else:
            print(f" {a}, {b}")

t = Test()
t.display(5)
t.display( "Hello")
 
3
class Test:
    def add(self, a, b):
        print(f"Addition: {a + b}")

    def multiply(self, a, b):
        print(f"Multiplication: {a * b}")

t = Test()
t.add(2, 3)
t.multiply(2, 3)
