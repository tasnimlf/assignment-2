<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <meta charset="UTF-8">
    <style>
        body {font-family: Arial; background: linear-gradient(135deg,#ffe4f2,#ffd1e0); margin:0;}
        .container {max-width:900px; margin:40px auto; background:#fff; padding:20px; border-radius:10px;}
        .header {display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;}
        h2 {color:#d81b60; margin:0;}
        input[type=text] {padding:6px; border:1px solid #ccc; border-radius:6px;}
        input[type=submit] {
            padding:6px 12px; background:#fff; border:2px solid #000;
            border-radius:6px; cursor:pointer; font-weight:bold;
        }
        input[type=submit]:hover {background:#f0f0f0;}
        table {width:100%; border-collapse:collapse; margin-top:10px;}
        th,td {padding:8px; border-bottom:1px solid #ddd; text-align:left;}
        th {background:#f8bbd0; color:#5d4037;}
        tr:nth-child(even){background:#fce4ec;}
        .action-buttons {display:flex; gap:6px;}
        .btn {padding:6px 12px; border-radius:6px; text-decoration:none; font-weight:bold; color:#fff;}
        .btn-edit {background:#4caf50;} .btn-edit:hover {background:#43a047;}
        .btn-delete {background:#f44336;} .btn-delete:hover {background:#e53935;}
        .btn-back {background:#ffeb3b; color:#5d4037;} .btn-back:hover {background:#fdd835;}
        .btn-view {background:#81d4fa; color:#0d47a1;} .btn-view:hover {background:#4fc3f7;}
        .back-button {display:block; text-align:center; margin-top:15px;}
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>All Student Profiles</h2>
        <form method="get" action="viewProfiles.jsp">
            <input type="text" name="query" placeholder="Search by Name or Student ID">
            <input type="submit" value="Search">
        </form>
    </div>

    <table>
        <tr>
            <th>Name</th><th>Student ID</th><th>Program</th><th>Email</th><th>Hobbies</th><th>Intro</th><th>Action</th>
        </tr>
        <%
            String search = request.getParameter("query");
            try {
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studentDB","root","root");
                PreparedStatement ps;
                if (search != null && !search.trim().isEmpty()) {
                    ps = con.prepareStatement("SELECT * FROM profile WHERE LOWER(first_name) LIKE ? OR LOWER(student_id) LIKE ?");
                    ps.setString(1, "%" + search.toLowerCase() + "%");
                    ps.setString(2, "%" + search.toLowerCase() + "%");
                } else {
                    ps = con.prepareStatement("SELECT * FROM profile");
                }
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("first_name") %></td>
            <td><%= rs.getString("student_id") %></td>
            <td><%= rs.getString("programme") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("hobby") %></td>
            <td><%= rs.getString("introduction") %></td>
            <td>
                <div class="action-buttons">
                    <a href="editProfile.jsp?id=<%= rs.getInt("id") %>" class="btn btn-edit">Edit</a>
                    <a href="DeleteStudentServlet?id=<%= rs.getInt("id") %>" class="btn btn-delete"
                       onclick="return confirm('Delete this profile?');">Delete</a>
                    <!-- New View button -->
                    <a href="profile.jsp?id=<%= rs.getInt("id") %>" class="btn btn-view">View</a>
                </div>
            </td>
        </tr>
        <%
                }
                rs.close(); ps.close(); con.close();
            } catch(Exception e) { out.println("Error: "+e.getMessage()); }
        %>
    </table>

    <% if (search != null && !search.trim().isEmpty()) { %>
        <a href="viewProfiles.jsp" class="btn btn-back back-button">Back to All Profiles</a>
    <% } %>
    <a href="home.html" class="btn btn-back back-button">Back to Home</a>
</div>
</body>
</html>