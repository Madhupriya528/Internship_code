class A:
    def __init__(self):
        self.name = "A"

    def method1(self):
        print("A method1")

    def method2(self):
        print("A method2")

    def common_method(self):
        print("A common_method")

class B(A):
    def __init__(self):
        super().__init__()
        self.name = "B"

    def method1(self):
        print("B method1")

    def method2(self):
        print("B method2")

    def common_method(self):
        print("B common_method")

class C(B):
    def __init__(self):
        super().__init__()
        self.name = "C"

    def method1(self):
        print("C method1")

    def method2(self):
        print("C method2")

    def common_method(self):
        print("C common_method")

if __name__ == "__main__":
    a = A()
    b = B()
    c = C()

    for obj in (a, b, c):
        obj.method1()
        obj.method2()
        obj.common_method()

    print("\nUsing superclass reference:")
    ref = B()
    ref.common_method()
    ref = C()
    ref.common_method()

    print("\nData members:")
    for obj in (a, b, c):
        print(obj.name)