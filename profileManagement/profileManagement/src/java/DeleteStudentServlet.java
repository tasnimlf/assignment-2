import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    private static final String URL = "jdbc:derby://localhost:1527/studentDB";
    private static final String USER = "root";
    private static final String PASS = "root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try (Connection con = DriverManager.getConnection(URL, USER, PASS)) {
            String sql = "DELETE FROM profile WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        response.sendRedirect("viewProfiles.jsp");
    }
}