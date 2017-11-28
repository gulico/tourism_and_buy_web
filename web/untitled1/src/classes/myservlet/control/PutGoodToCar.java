
/**
 * Created by jh on 2017/4/20.
 */
package classes.myservlet.control;
import classes.mybean.data.Login;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class PutGoodToCar extends HttpServlet{
    public void init(ServletConfig config)throws ServletException {
        super.init(config);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        request.setCharacterEncoding("UTF-8");
        String goods=request.getParameter("java");
        //System.out.println(goods);
        Login login = null;
        HttpSession session = request.getSession(true);
        try{
            login =(Login)session.getAttribute("login");
            boolean b = login.getSuccess();
            if(!b)
                response.sendRedirect("login.jsp");
            LinkedList<String> car = login.getCar();
            car.add(goods);
            speakSomeMess(request,response,goods);
        }
        catch(Exception exp) {
            response.sendRedirect("login.jsp");
        }


        String goodsnum = request.getParameter("goodsnum").trim();
        Connection con =null;
        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{
            con = DriverManager.getConnection( url ,username, SQLpassword);
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            sql.executeUpdate("UPDATE commodityAnalysis SET buytime=buytime+1 WHERE num='"+goodsnum+"'");
            con.close();
        }
        catch(SQLException e){
            System.out.print(e);
        }
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
    public void speakSomeMess(HttpServletRequest request,HttpServletResponse response,String goods){
        response.setContentType("text/html;UTF-8");
        try{
            response.sendRedirect("putCarSuccess.jsp");
        }
        catch(IOException exp){}
    }
}
