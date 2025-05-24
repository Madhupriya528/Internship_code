print("madhupriya")

2ndquestion

print("helloworld") # this is singleline comment
"""
this is multiline comment
we can use this when comments are longer than single line
"""
print("comments in python")

3rd
a = 100
print("integer:", a)

b= True
print("boolean:", b)

name = "python"
print("char:",name)

value=1.05
print("float:",value)

d=123.2567
print("double:",d)

4th 
x= 20
def func():
    x=10
    print("local variable:",x)

func()
print("global variable :",x)


5th 

def operaters(a, b):
    print("Addition:", a + b)
    print("Subtraction:", a - b)
    print("Multiplication:", a * b)

    if b != 0:
        print("Division:", a / b)
    else:
        print("cant be divided with zero")


a = float(input("Enter number a: "))
b = float(input("Enter number b: "))

operaters(a, b)

6

a = int(input("Enter the first number: "))
b = int(input("Enter the second number: "))

if a < b:
    print("a is less than b")
else:
    print("a is NOT less than b")

if a <= b:
    print("a is less than or equal to b")
else:
    print("a is greater than b")

if a > b:
    print("a is greater than b")
else:
    print("a is NOT greater than b")

if a >= b:
    print("a is greater than or equal to b")
else:
    print("a is less than b")


7 

num1 = int(input("enter a number:"))
num2 = int(input("enter a number :"))
if num1>num2:
    print("number1 is larger ")
    print("number2 is smaller")
elif num2>num1:
    print("number1 is smaller")
    print("number2 is greater")
else:
    print("both are equal")
