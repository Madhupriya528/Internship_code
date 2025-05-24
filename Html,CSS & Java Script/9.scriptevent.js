

<!DOCTYPE html>
<html>
<head>
  <title>JavaScript Events</title>
</head>
<body>
  <h2>JavaScript Events Demo</h2>

  <button id="dateBtn">Show Date & Time</button>
  <p id="dateOutput"></p>

  <form onsubmit="return validateForm()">
    <input type="text" id="textBox" placeholder="Enter something...">
    <input type="submit" value="Submit">
  </form>
  <p id="validationMsg" style="color: red;"></p>

  <button onclick="setCookie('username', 'JohnDoe', 1)">Set Cookie</button>
  <button onclick="alert(getCookie('username'))">Get Cookie</button>
  <button onclick="alert(checkCookie('username'))">Check Cookie</button>

  <button onclick="showJSON()">Show JSON Object</button>
  <p id="jsonOutput"></p>

  <script>
    // Event listener for date button
    document.getElementById("dateBtn").addEventListener("click", function () {
      const now = new Date();
      document.getElementById("dateOutput").innerText = now.toString();
    });

    
    function validateForm() {
      const value = document.getElementById("textBox").value;
      if (value.trim() === "") {
        document.getElementById("validationMsg").innerText = "Text box cannot be empty!";
        return false;
      }
      document.getElementById("validationMsg").innerText = "";
      return true;
    }

    
    console.log("This message helps debug the JavaScript code.");

 
    function setCookie(name, value, days) {
      const d = new Date();
      d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
      document.cookie = ${name}=${value};expires=${d.toUTCString()};path=/;
    }

    function getCookie(name) {
      const cname = name + "=";
      const ca = document.cookie.split(';');
      for (let i = 0; i < ca.length; i++) {
        let c = ca[i].trim();
        if (c.indexOf(cname) === 0) return c.substring(cname.length, c.length);
      }
      return "";
    }

    function checkCookie(name) {
      const user = getCookie(name);
      return user ? "Cookie found: " + user : "Cookie not found!";
    }

    // JSON display
    function showJSON() {
      const person = {
        name: "Alice",
        age: 25,
        city: "Hyderabad"
      };
      document.getElementById("jsonOutput").innerText = Name: ${person.name}, Age: ${person.age}, City: ${person.city};
    }
  </script>
</body>
</html>

