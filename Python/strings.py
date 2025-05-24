a = "hello"
b = 'world'
c = str("python")
d = """multiline"""
print(a)
print(b)
print(c)
print(d)

2
a = "hello"
b = "world"
c = a + b
print(c)

3
a = "hello"
count = 0
for _ in a:
    count += 1
print(count)

4
text = "Hello World"
sub = text[0:5] 
print(sub)      

5
text = "Hello World"
position = text.index("World")
print(position)  

6

import re
m = re.search(r"(\d+)", "Age: 25")
if m:
    print(m.group(1)) 


7
a = "hello"
b = "hello"
print(a == b)

8
name = "python"
print(name.startswith("py"))
print(name.endswith("on"))
print(name == "python")
print(name < "Python")

9
messy = "  hello world  "
clean = messy.strip()
print(clean)

10

original = "python"
modified = original.replace('p', 'b')
print(modified)
11

fruits = "apple,banana,cherry"
fruit_list = fruits.split(",")
print(fruit_list)

12
number = 21
str_num = str(number)
print(str_num)

13
mixed = "HeLLo"
print(mixed.lower())
print(mixed.upper())
