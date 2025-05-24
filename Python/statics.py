class Class:
    count = 10

print(Class.count)

2
class Class:
    count = 4

obj = Class()
print(obj.count)

3

 class Class:
    count = 4

obj = Class()
obj.count = 5
print(obj.count)
print(Class.count)

4
class MyClass:
    count = 5

MyClass.count = 10
print(MyClass.count)

obj = MyClass()
print(obj.count)
