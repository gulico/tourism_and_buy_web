package classes.myservlet.control;
import classes.mybean.data.Login;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleDelete extends HttpServlet{
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        request.setCharacterEncoding("utf-8");
        String delete =request.getParameter("delete");
        Login login=null;
        HttpSession session=request.getSession(true);
        try{
            login=(Login)session.getAttribute("login");
            boolean ok=login.getSuccess();
            if(!ok)
                response.sendRedirect("login.jsp");
            LinkedList<String> car=login.getCar();
            car.remove(delete);
        }
        catch(Exception exp){
            response.sendRedirect("login.jsp");
        }
        RequestDispatcher dispatcher=
                request.getRequestDispatcher("lookShoppingCar.jsp");
        dispatcher.forward(request,response);
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        doPost(request,response);
    }
}
