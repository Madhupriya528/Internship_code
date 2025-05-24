1

with open("file.txt", "r") as file:
    content = file.read()
    print(content)
2

text = input("Enter text to write to file: ")

with open("file.txt", "w") as file:
    file.write(text)

 3

with open("file.txt", "r") as file:
    for line in file:
        print(line.strip())
4

with open("file.txt", "r") as file:
    file.seek(0)
    print(file.read(5))
    file.seek(10)
    print(file.read(5))
5

with open("file.txt", "r") as file:
    file.seek(15)
    data = file.read(10)
    print(f"Data from index 15: {data}")
6  

import os

filename = "file.txt"

if os.access(filename, os.R_OK):
    print("File has read access")
else:
    print("File does NOT have read access")

if os.access(filename, os.W_OK):
    print("File has write access")
else:
    print("File does NOT have write access")
