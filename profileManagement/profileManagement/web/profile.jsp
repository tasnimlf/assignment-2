<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name="", studentID="", program="", email="", hobbies="", intro="";

    try {
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studentDB","root","root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM profile WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("first_name");
            studentID = rs.getString("student_id");
            program = rs.getString("programme");
            email = rs.getString("email");
            hobbies = rs.getString("hobby");
            intro = rs.getString("introduction");
        }
        rs.close(); ps.close(); con.close();
    } catch(Exception e) { out.println("Error: "+e.getMessage()); }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Details</title>
    <meta charset="UTF-8">
    <style>
        body {font-family: Arial; background: linear-gradient(135deg,#ffe4f2,#ffd1e0); margin:0;}
        .container {max-width:500px; margin:50px auto; background:#fff; padding:25px; border-radius:12px;}
        h2 {text-align:center; color:#d81b60; margin-bottom:20px;}
        .detail-group {margin-bottom:12px;}
        .label {font-weight:bold; color:#ad1457; margin-bottom:4px; display:block;}
        .value {padding:8px 10px; border:1px solid #f8bbd0; border-radius:6px; background:#fdfdfd;}
        .btn {display:block; text-align:center; padding:10px; border-radius:6px; font-weight:bold; text-decoration:none; margin-top:15px;}
        .btn-back {background:#ffeb3b; color:#5d4037;} .btn-back:hover {background:#fdd835;}
        .btn-edit {background:#4caf50; color:#fff;} .btn-edit:hover {background:#43a047;}
        .btn-home {background:#e1bee7; color:#4a148c;} .btn-home:hover {background:#ce93d8;}
    </style>
</head>
<body>
<div class="container">
    <h2>Student Profile</h2>

    <div class="detail-group"><span class="label">Name</span><div class="value"><%= name %></div></div>
    <div class="detail-group"><span class="label">Student ID</span><div class="value"><%= studentID %></div></div>
    <div class="detail-group"><span class="label">Program</span><div class="value"><%= program %></div></div>
    <div class="detail-group"><span class="label">Email</span><div class="value"><%= email %></div></div>
    <div class="detail-group"><span class="label">Hobbies</span><div class="value"><%= hobbies %></div></div>
    <div class="detail-group"><span class="label">Introduction</span><div class="value"><%= intro %></div></div>

    <a href="editProfile.jsp?id=<%= id %>" class="btn btn-edit">Edit Profile</a>
    <a href="viewProfiles.jsp" class="btn btn-back">Back to All Profiles</a>
    <a href="home.html" class="btn btn-home">Back to Home</a>
</div>
</body>
</html>