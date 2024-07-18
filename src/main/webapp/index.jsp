<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vulnerable Page</title>
</head>
<body>
    <h2>beep boop hope</h2>

    <!-- Vulnerable Code: Unsanitized User Input (XSS) -->
    <form method="post" action="">
        <label for="userInput">Enter something:</label>
        <input type="text" id="userInput" name="userInput">
        <input type="submit" value="Submit">
    </form>

    <div>
        <h3>Output:</h3>
        <p id="output"><%= request.getParameter("userInput") %></p>
    </div>

    <!-- Vulnerable Code: SQL Injection -->
    <%
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Connection conn = null;
        Statement stmt = null;
        
        try {
            // Assume dataSource is already configured
            conn = dataSource.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM Users WHERE username = '" + user + "' AND password = '" + pass + "'";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                out.println("User: " + rs.getString("username") + "<br>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    %>
</body>
</html>
