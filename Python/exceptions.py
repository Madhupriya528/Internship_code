print(10 / 0)

2
try:
    print(10 / 0)
except ZeroDivisionError:
    print("Cant divide by zero!")

3

def risky():
    raise ValueError("Something went wrong")

risky()

4
try:
    x = int("abc")
except ValueError:
    print("ValueError caught")
except TypeError:
    print("TypeError caught")


5

raise Exception(" error")

6
class MyError(Exception):
    pass

raise MyError("This is my custom exception")

7

try:
    print(10 / 0)
except ZeroDivisionError:
    print("Caught error")
finally:
    print("Finally block executed")

8

print(1 / 0)


9

open("file.txt")

10
import myclass
print("hi")

11
open("/")

12

class Test:
    pass

t = Test()
print(t.some_field)

