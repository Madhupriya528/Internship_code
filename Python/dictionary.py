students = {
    101: "Alice",
    102: "Bob",
    103: "Charlie",
    104: "David",
    105: "Eva"
}

students[106] = "Frank"

students[102] = "Bobby"

print(students[103])

nested_students = {
    101: {"name": "Alice", "math": 85, "science": 90},
    102: {"name": "Bobby", "math": 78, "science": 88}
}

for sid, details in nested_students.items():
    print(f"Student ID: {sid}")
    for key, value in details.items():
        print(f"  {key}: {value}")

print("Keys in students dictionary:", list(students.keys()))

del students[105]
print("After deletion:", students)
