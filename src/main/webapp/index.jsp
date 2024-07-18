<!DOCTYPE html>
<html>
<body>
<h2>beep boop hope</h2>

<!-- Vulnerable Code: SQL Injection -->
<form method="post" action="">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username">
    <br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password">
    <br><br>
    <input type="submit" value="Login">
</form>

<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        event.preventDefault();
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;

        // Vulnerable: Constructing SQL query directly with user input
        var query = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";

        // Simulate sending the query to the server (this is just for demonstration and won't actually work)
        console.log("Executing query: " + query);
    });
</script>

</body>
</html>
