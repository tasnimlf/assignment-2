import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    private static final String URL = "jdbc:derby://localhost:1527/studentDB";
    private static final String USER = "root";
    private static final String PASS = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String studentID = request.getParameter("studentID");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String selfIntro = request.getParameter("selfIntro");

        try (Connection con = DriverManager.getConnection(URL, USER, PASS)) {
            String sql = "UPDATE profile SET first_name=?, student_id=?, programme=?, email=?, hobby=?, introduction=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, studentID);
            ps.setString(3, program);
            ps.setString(4, email);
            ps.setString(5, hobbies);
            ps.setString(6, selfIntro);
            ps.setInt(7, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        response.sendRedirect("viewProfiles.jsp");
    }
}