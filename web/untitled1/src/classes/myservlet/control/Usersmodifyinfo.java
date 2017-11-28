package classes.myservlet.control;
import classes.mybean.data.DataByPage;
import classes.mybean.data.Register;
import com.sun.rowset.CachedRowSetImpl;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;

/**
 * Created by jh on 2017/5/20.
 */
public class Usersmodifyinfo  extends HttpServlet {
    public void init(ServletConfig config)throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");// 加载驱动程序以连接数据库
        } catch (Exception e) {}
    }
    public String handleString(String s){
        try{
            byte bb[ ] =s.getBytes("UTF-8");
            s = new String(bb);
        }
        catch(Exception e){}
        return s;
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        request.setCharacterEncoding("UTF-8");
        //Register reg = new Register();
        //request.setAttribute("register", reg);//添加属性名和属性值

        String logname = request.getParameter("logname").trim();//getParameter获取字段名为logname的值，trim去掉空格

        String password  = request.getParameter("password").trim();
        String sex  = request.getParameter("sex").trim();
        String email  = request.getParameter("email").trim();
        System.out.println(logname+password+sex+email);
        HttpSession session= request.getSession(true);
        Connection con =null;
        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{
            logname = handleString(logname);
            password = handleString(password);
            email = handleString(email);
            sex = handleString(sex);
            con = DriverManager.getConnection( url ,username, SQLpassword);

            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            sql.executeUpdate("UPDATE member SET email='"+email+"' , password='"+password+"' , sex='"+sex+"' where logname='"+logname+"'");
            //ResultSet rs=sql.executeQuery("DELETE  FROM member where logname="+Name);
            con.close();
        }
        catch(SQLException e){
            System.out.print(e);
        }
        response.sendRedirect("userinfo.jsp");//重定向
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
