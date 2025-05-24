
a = [35, 18, 30, 6]
def add(a):
    total = 0
    for i in a:
        total += i
    return total
print("Sum:", add(a))

2
a = [10, 56, 12, 23]

def average():
    total = 0
    count = 0
    for i in a:
        total += i
        count += 1
    return total // count

print("Average:", average())

3
a = [54, 65, 25, 35]

def index(value):
    index = 0
    for i in a:
        if i == value:
            return index
        index += 1
    return -1

print("Index of 25:", index(25))

4
a = [2, 4, 6, 8]

def value(value):
    for i in a:
        if i == value:
            return True
    return False

print("Contains 6:", value(6))

5
a = [5, 2, 7, 2, 6]

def remove(value):
    result = []
    for i in a:
        if i != value:
            result += [i]
    return result

print("After removing ", remove(2))

6
a = [9, 5, 7]

def array():
    copied = []
    for i in a:
        copied += [i]
    return copied

print("Copied Array:", array())

7
a = [31, 22, 41, 25]

def insert(value, position):
    result = []
    for i in range(position):
        result += [a[i]]
    result += [value]
    for i in range(position, len(a)):
        result += [a[i]]
    return result

print("After inserting:", insert(3, 2))

8

a = [10, 32, 33, 64, 25]

def min():
    minn = a[0]
    max = a[0]
    for i in a:
        if i < minn:
            minn = i
        if i > max:
            max = i
    return minn, max

minn, max = min()
print("Min:", minn)
print("Max:", max)

9
a = [41,12, 53, 64, 53]

def reverse():
    result = []
    for i in range(len(a)-1, -1, -1):
        result += [a[i]]
    return result

print("Reversed Array:", reverse())

10
a = [10, 22, 23, 22, 43, 35, 23]

def find():
    duplicates = []
    for i in range(len(a)):
        for j in range(i+1, len(a)):
            if a[i] == a[j]:
                found = False
                for k in duplicates:
                    if k == a[i]:
                        found = True
                        break
                if not found:
                    duplicates += [a[i]]
    return duplicates

print("Duplicates:", find())
11
a = [21, 12, 3, 4, 5]
b = [3, 42, 5, 6, 7]

def values():
    common = []
    for i in a:
        for j in b:
            if i == j:
                found = False
                for k in common:
                    if k == i:
                        found = True
                        break
                if not found:
                    common += [i]
    return common

print("Common values:", values())

12

a = [1, 2, 2, 3, 4, 4, 5]

def remove():
    result = []
    for i in a:
        found = False
        for j in result:
            if i == j:
                found = True
                break
        if not found:
            result += [i]
    return result

print("Without duplicates:", remove())

13
a = [10, 23, 20, 33, 45, 40]

def largest():
    max = a[0]
    for i in a:
        if i > max:
            max = i
    second_max = None
    for i in a:
        if i != max:
            if second_max is None or i > second_max:
                second_max = i
    return second_max

print("Second largest:", largest())


14
a = [10, 22, 5, 30, 40, 5]

def smallest():
    min_val = a[0]
    for i in a:
        if i < min_val:
            min_val = i
    second_min = None
    for i in a:
        if i != min_val:
            if second_min is None or i < second_min:
                second_min = i
    return second_min

print("Second smallest:", smallest())

15
a = [1, 2, 3, 4, 5, 6]

def count():
    even = 0
    odd = 0
    for i in a:
        if i % 2 == 0:
            even += 1
        else:
            odd += 1
    return even, odd

even, odd = count()
print("Even count:", even)
print("Odd count:", odd)

16
a = [10, 20, 5, 30, 40]

def diff():
    max_val = a[0]
    min_val = a[0]
    for i in a:
        if i > max_val:
            max_val = i
        if i < min_val:
            min_val = i
    return max_val - min_val

print("Difference:", diff())

17
a = [10, 12, 15, 23, 30]

def array():
    found_12 = False
    found_23 = False
    for i in a:
        if i == 12:
            found_12 = True
        if i == 23:
            found_23 = True
    return found_12 and found_23

print( array())

18
a = [1, 2, 2, 3, 4, 4, 5]

def remove():
    result = []
    for i in a:
        found = False
        for j in result:
            if i == j:
                found = True
                break
        if not found:
            result += [i]
    return result

print("Without duplicates:", remove())