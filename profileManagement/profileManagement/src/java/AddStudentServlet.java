import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentID = request.getParameter("studentID");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String selfIntro = request.getParameter("selfIntro");

        int newId = -1;

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/studentDB", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO profile (first_name, student_id, programme, email, hobby, introduction) VALUES (?,?,?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setString(2, studentID);
            ps.setString(3, program);
            ps.setString(4, email);
            ps.setString(5, hobbies);
            ps.setString(6, selfIntro);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                newId = rs.getInt(1);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (newId != -1) {
            response.sendRedirect("profile.jsp?id=" + newId);
        } else {
            response.sendRedirect("viewProfiles.jsp"); 
        }
    }
}