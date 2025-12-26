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
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg,#ffe4f2,#ffd1e0);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        h2 {
            text-align: center;
            color: #d81b60;
        }
        label {
            font-weight: bold;
            color: #ad1457;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin: 6px 0;
            border: 1px solid #f8bbd0;
            border-radius: 6px;
        }
        textarea {
            min-height: 60px;
        }

        input[type=submit] {
            display: block;
            text-align: center;
            padding: 10px;
            background: #ffeb3b;  
            border: none;
            border-radius: 6px;
            color: #5d4037;
            font-weight: bold;
            margin-top: 10px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background: #fdd835;   
        }

        a.button {
            display: block;
            text-align: center;
            padding: 10px;
            background: #e1bee7;   
            border-radius: 6px;
            color: #4a148c;        
            font-size: 15px;
            font-weight: bold;
            text-decoration: none;
            margin-top: 15px;
        }
        a.button:hover {
            background: #ce93d8;  
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Student Profile</h2>
    <form action="UpdateStudentServlet" method="post">
        <input type="hidden" name="id" value="<%=id%>">

        <label>Name</label>
        <input type="text" name="name" value="<%=name%>" required>

        <label>Student ID</label>
        <input type="text" name="studentID" value="<%=studentID%>" required>

        <label>Program</label>
        <input type="text" name="program" value="<%=program%>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%=email%>" required>

        <label>Hobbies</label>
        <input type="text" name="hobbies" value="<%=hobbies%>" required>

        <label>Introduction</label>
        <textarea name="selfIntro" required><%=intro%></textarea>

        <input type="submit" value="Update Profile">
    </form>
    <a href="viewProfiles.jsp" class="button">Back to Profiles</a>
</div>
</body>
</html>