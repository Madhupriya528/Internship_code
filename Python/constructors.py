class MyClass:
    def __init__(self, arg1=None, arg2=None):
        if arg1 is None and arg2 is None:
            print("Default constructor called")
        elif arg2 is None:
            print(f"One-argument = {arg1}")
        else:
            print(f"Two-argument = {arg1}, arg2 = {arg2}")

def main():
    obj1 = MyClass()
    obj2 = MyClass("Hello")
    obj3 = MyClass("Hello", "World")

if __name__ == "__main__":
    main()
2

class SuperClass:
    def __init__(self, msg="Default"):
        print(f"SuperClass constructor: {msg}")

class ChildClass(SuperClass):
    def __init__(self, use_arg=False):
        if use_arg:
            super().__init__("Argument passed")
        else:
            super().__init__()

obj1 = ChildClass()
obj2 = ChildClass(True)

3

class Access:
    def __init__(self):
        print("Public constructor")

    def _protected_constructor(self):
        print("Protected constructor")

    def __private_constructor(self):
        print("Private constructor")

    def call_private(self):
        self.__private_constructor()

obj = AccessExample()
obj._protected_constructor()
obj.call_private()
 
4
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def show(self):
        print(f"Name: {self.name}, Age: {self.age}")

s1 = Student("Alice", 20)
s2 = Student("Bob", 22)

s1.show()
s2.show()
