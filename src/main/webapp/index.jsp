<!DOCTYPE html>
<html>
<body>
<h2>beep boop hope</h2>

<!-- Vulnerable Code: Unsanitized User Input -->
<form method="post" action="">
    <label for="userInput">Enter something:</label>
    <input type="text" id="userInput" name="userInput">
    <input type="submit" value="Submit">
</form>

<div>
    <h3>Output:</h3>
    <p id="output"></p>
</div>

<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        event.preventDefault();
        var userInput = document.getElementById('userInput').value;
        // Vulnerable: Directly inserting user input without sanitization
        document.getElementById('output').innerHTML = userInput;
    });
</script>

</body>
</html>
