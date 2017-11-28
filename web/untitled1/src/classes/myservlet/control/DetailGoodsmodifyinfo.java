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
 * Created by Administrator on 2017/5/28.
 */
public class DetailGoodsmodifyinfo extends HttpServlet {
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


        String d1_s  = request.getParameter("d1_s").trim();

        String d1_d  = request.getParameter("d1_d").trim();

        String d1_h  = request.getParameter("d1_h").trim();

        String d2_s  = request.getParameter("d2_s").trim();

        String d2_d  = request.getParameter("d2_d").trim();

        String d2_h  = request.getParameter("d2_h").trim();

        String d3_s  = request.getParameter("d3_s").trim();

        String d3_d  = request.getParameter("d3_d").trim();

        String d3_h  = request.getParameter("d3_h").trim();

        System.out.println(num+"nihao"+d1_h);
        HttpSession session= request.getSession(true);
        Connection con =null;
        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{
            //num = handleString(num);
            //fromplace = handleString(fromplace);
            //price = handleString(price);
            //mess = handleString(mess);
            con = DriverManager.getConnection( url ,username, SQLpassword);

            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            sql.executeUpdate("UPDATE detial_scheduling SET  d1_scheduling='"+d1_s+"' , d1_diner='"+d1_d+"', d1_hotel='"+d1_h+"', d2_scheduling='"+d2_s+"', d2_diner='"+d2_d+"', d2_hotel='"+d2_h+"', d3_scheduling='"+d3_s+"', d3_diner='"+d3_d+"', d3_hotel='"+d3_h+"' where num='"+num+"'");
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
