<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #ffe4f2, #ffd1e0); 
                margin: 0;
                padding: 0;
            }
            .container {
                width: 450px;
                margin: 40px auto;
                background: #ffffff;
                padding: 20px 30px;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.12);
                border-top: 6px solid #f06292; 
            }
            h2 {
                text-align: center;
                color: #d81b60; 
                margin-bottom: 15px;
            }
            .label {
                font-weight: bold;
                color: #ad1457; 
            }
            p {
                margin: 6px 0;
            }
            .intro-box {
                margin-top: 10px;
                padding: 10px;
                border-radius: 8px;
                background: #fff9c4; 
                min-height: 60px;
                border: 1px solid #fdd835;
            }
            .back-link {
                display: block;
                text-align: center;
                margin-top: 18px;
            }
            .back-link a {
                text-decoration: none;
                color: #5d4037;
                background: #ffeb3b;        
                padding: 8px 18px;
                border-radius: 6px;
                font-size: 14px;
                font-weight: bold;
                box-shadow: 0 2px 6px rgba(0,0,0,0.15);
            }
            .back-link a:hover {
                background: #fdd835;       
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Student Profile</h2>

            <p><span class="label">Name:</span> ${name}</p>
            <p><span class="label">Student ID:</span> ${studentID}</p>
            <p><span class="label">Program:</span> ${program}</p>
            <p><span class="label">Email:</span> ${email}</p>
            <p><span class="label">Hobbies:</span> ${hobbies}</p>

            <p class="label">Self Introduction:</p>
            <div class="intro-box">
                ${selfIntro}
            </div>

            <div class="back-link">
                <a href="index.html">Back to Form</a>
            </div>
        </div>
    </body>
</html>


