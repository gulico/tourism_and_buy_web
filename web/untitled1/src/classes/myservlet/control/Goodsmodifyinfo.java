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
 * Created by Administrator on 2017/5/26.
 */
public class Goodsmodifyinfo  extends HttpServlet{
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

        //getParameter获取字段名为logname的值，trim去掉空格


        String num = request.getParameter("num").trim();
        String name = request.getParameter("name").trim();
        System.out.println(num+"asdasdasda123");
        String fromplace  = request.getParameter("fplace").trim();
        System.out.println(fromplace+"asdasdasda123");
        String price  = request.getParameter("price").trim();
        System.out.println(price+"asdasdasda123");
        String mess  = request.getParameter("mess").trim();

        //System.out.println(num+price+mess+fromplace);
        HttpSession session= request.getSession(true);
        Connection con =null; System.out.println(mess+"asdasdasda123");
        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{
            //num = handleString(num);
            //fromplace = handleString(fromplace);
            //price = handleString(price);
            //mess = handleString(mess);
            con = DriverManager.getConnection( url ,username, SQLpassword);
            System.out.println(mess+"asdasdasda123");
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            sql.executeUpdate("UPDATE destinationform SET name='"+name+"' , fromplace='"+fromplace+"' , price='"+price+"', mess='"+mess+"' where num='"+num+"'");
            //ResultSet rs=sql.executeQuery("DELETE  FROM member where logname="+Name);
            con.close();
        }
        catch(SQLException e){
            System.out.print(e);
        }
        response.sendRedirect("items_information.jsp");//重定向
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
