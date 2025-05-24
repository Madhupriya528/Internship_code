from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

    def des(self):
        print("This is a shape.")

class Square(Shape):
    def __init__(self, side):
        self.side = side

    def area(self):
        return self.side * self.side

if __name__ == "__main__":
    s = Square(4)
    s.des()
    print("Area of square:", s.area())

2

from abc import ABC, abstractmethod

class Vehicle(ABC):
    def show_type(self):
        print("This is a vehicle.")

    @abstractmethod
    def start_engine(self):
        pass

class Car(Vehicle):
    def start_engine(self):
        print("Car engine started.")

if __name__ == "__main__":
    my_car = Car()
    my_car.show_type()
    my_car.start_engine()
3  

from abc import ABC, abstractmethod

class Animal(ABC):
    @abstractmethod
    def sound(self):
        pass

class Dog(Animal):
    def sound(self):
        print("Dog barks.")

    def call_abstract_method(self):
        obj = Dog()
        obj.sound()

if __name__ == "__main__":
    d = Dog()
    d.call_abstract_method()

4

from abc import ABC, abstractmethod

class Device(ABC):
    def device_info(self):
        print("General device info")

    @abstractmethod
    def power_on(self):
        pass

class Laptop(Device):
    def power_on(self):
        print("Laptop powered on")

    def call_info(self):
        self.device_info()

l = Laptop()
l.call_info()
