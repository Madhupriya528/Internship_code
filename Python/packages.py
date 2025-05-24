class ClassA:
    def __init__(self, name):
        self.name = name

    def greet(self):
        return f"Hello from ClassA, {self.name}!"

class ClassB:
    def __init__(self, number):
        self.number = number

    def double(self):
        return self.number * 2

class Package:
    ClassA = ClassA
    ClassB = ClassB

def main():
    a = Package.ClassA("Alice")
    b = Package.ClassB(10)

    print(a.greet())
    print(f"Double of {b.number} is {b.double()}")

if __name__ == "__main__":
    main()
