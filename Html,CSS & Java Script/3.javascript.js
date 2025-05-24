

<!DOCTYPE html>
<head>
  <title>JavaScript Basics</title>
</head>
<body>
  <h2>JavaScript Basics</h2>

  <h3>2. Sort Fruits in Descending Order</h3>
  <button onclick="sortFruits()">Sort Fruits</button>
  <p id="result"></p>

  <script>
    // 1. Single-line comment

    /*
      Multi-line comment
      demonstrating JavaScript comments.
    */

    // 2. Create and sort fruit array on button click
    const fruits = ["Apple", "Banana", "Cherry", "Mango"];
    function sortFruits() {
      const sorted = fruits.sort().reverse();
      document.getElementById("result").innerText = sorted.join(", ");
    }

    // 3. FOR/IN loop
    const car = { make: "Toyota", model: "Corolla", year: 2020 };
    console.log("FOR/IN loop output:");
    for (let key in car) {
      console.log(key + ": " + car[key]);
    }

    // 4. Object access two ways
    const person = {
      firstname: "Alice",
      lastname: "Smith"
    };
    console.log("Dot notation:", person.firstname);
    console.log("Bracket notation:", person["lastname"]);

    // 5. Variable Hoisting
    console.log("Variable hoisting:");
    console.log(a); // undefined
    var a = 5;

    // 6. Strict mode and undeclared variable error
    console.log("Strict mode example:");
    try {
      "use strict";
      b = 10; // This will throw ReferenceError
    } catch (error) {
      console.error("Error in strict mode:", error.message);
    }
  </script>
</body>
</html>

