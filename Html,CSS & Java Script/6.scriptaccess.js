

<!DOCTYPE html>
<head>
  <title>JavaScript Access and Properties</title>
  <style>
    button { margin: 5px; padding: 10px; }
  </style>
</head>
<body>

  <h2>1</h2>
  <button onclick="this.style.display='none'">Click to Disappear</button>

  <h2>2</h2>
  <div id="callApplyOutput"></div>
  <script>
    const person = {
      fullName: function(city, country) {
        return this.firstName + " " + this.lastName + " from " + city + ", " + country;
      }
    };
    const person1 = {firstName: "John", lastName: "Doe"};
    const output = 
      "Using call(): " + person.fullName.call(person1, "New York", "USA") + "<br>" +
      "Using apply(): " + person.fullName.apply(person1, ["Los Angeles", "USA"]);

    document.getElementById("callApplyOutput").innerHTML = output;
  </script>

  <h2>3</h2>
  <button onclick="incrementCounter()">Count</button>
  <p>Counter: <span id="counterVal">0</span></p>
  <script>
    let count = 0;
    function incrementCounter() {
      count++;
      document.getElementById("counterVal").textContent = count;
    }
  </script>

  <h2>4</h2>
  <button onclick="counterObj.inc = 1">Increment using setter</button>
  <p>Getter Value: <span id="getVal"></span></p>
  <script>
    const counterObj = {
      _count: 0,
      set inc(val) { this._count += val; updateGetter(); },
      get value() { return this._count; }
    };

    function updateGetter() {
      document.getElementById("getVal").textContent = counterObj.value;
    }
    updateGetter();
  </script>

  <h2>5</h2>
  <p id="protoResult"></p>
  <script>
    function Person(name) {
      this.name = name;
    }

    Person.prototype.greet = function() {
      return "Hello, " + this.name;
    };

    const user = new Person("Alice");
    document.getElementById("protoResult").innerText = user.greet();
  </script>

</body>
</html>

