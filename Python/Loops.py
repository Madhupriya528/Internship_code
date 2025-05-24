1

for i in range(10):
    print("bright it career")
2
i=1
while(i<=20):
     print(i)
     i+=1	

3 

a = 10
b=10
if a==b:
    print("both are equal")
else:
    print("both are not equal")
    
4

num = int(input("enter a number:"))
if num % 2 == 0:
    print("number is even")
else:
    print("number is odd")
5 

num1 = int(input("enter a number:"))
num2 = int(input("enter a number:"))
num3 = int(input("enter a number:"))
if num1>num2 and num1>num3:
    print("number1 is greater")
elif num2>num1 and num2>num3:
    print("number2 is greater")
else:
    print("number3 is greater")
6
num = 10
while num <=20 :
    if num % 2 == 0:
        print(num)
    num+=1    

7

num = int(input("Enter a number: "))
n = num
count = 0
while n > 0:
    count += 1
    n = n // 10
n = num
sum = 0
while n > 0:
    digit = n % 10
    p = 1
    for i in range(count):
        p *= digit
    sum += p
    n = n // 10
if sum == num:
    print("Armstrong number")
else:
    print("Not an Armstrong number")

8
num = int(input("Enter a number: "))
if num <= 1:
    print("Not a prime number")
else:
    p = 0
    for i in range(2, num):
        if num % i == 0:
            p = 1
            break
    if p == 0:
        print("Prime number")
    else:
        print("Not a prime number")

9

num = int(input("Enter a number: "))
original = num
reverse = 0
while num > 0:
    digit = num % 10
    reverse = reverse * 10 + digit
    num = num // 10
if reverse == original:
    print("Palindrome")
else:
    print("Not a palindrome")
