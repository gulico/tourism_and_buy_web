package classes.myservlet.control;
import classes.mybean.data.Login;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 * Created by Administrator on 2017/4/28.
 */
public class HandleBuyGoods extends HttpServlet{
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e){}
    }
    public  void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        request.setCharacterEncoding("utf-8");
        String buyGoodsMess=request.getParameter("buy");
        String buyGoodsPic=request.getParameter("pic");
        if(buyGoodsMess==null || buyGoodsMess.length()==0)
        {
            fail(request,response,"购物车没有物品，无法生成订单");
            return;
        }
        String price = request.getParameter("price");
        if(price==null||price.length()==0){
            fail(request,response,"无法生成订单");
            return;
        }
        float sum=Float.parseFloat(price);
        Login login=null;
        HttpSession session=request.getSession(true);
        try{
            login=(Login)session.getAttribute("login");
            boolean ok=login.getSuccess();
            if(!ok)
                response.sendRedirect("login.jsp");
        }
        catch (Exception exp){
            response.sendRedirect("login.jsp");
        }
        String uri="jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        Connection con;
        PreparedStatement sql;
        try {
            //con=DriverManager.getConnection(uri,username,SQLpassword);
            con=DriverManager.getConnection(uri,username,SQLpassword);
            String insertCondition="INSERT INTO orderform VALUES(?,?,?,?,?)";
            sql=con.prepareStatement(insertCondition);
            sql.setInt(1,0);
            sql.setString(2,login.getLogname());
            sql.setString(3,buyGoodsPic);
            sql.setFloat(4,sum);
            sql.setString(5,buyGoodsMess);
            sql.executeUpdate();
            LinkedList car=login.getCar();
            car.clear();
            success(request,response,"生成订单成功");
        }
        catch (SQLException exp){
            fail(request,response,"生成订单失败"+exp);
        }
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        doPost(request,response);
    }
    public void success(HttpServletRequest request,HttpServletResponse response,String backNews){
        response.setContentType("text/html;charset=utf-8");
        try{
            PrintWriter out=response.getWriter();
            out.println("<html><body>");
            out.println("<h2>"+backNews+"</h2>");
            out.println("返回主页");
            out.println("<a href = index.jsp>主页</a>");
            out.println("<br>查看订单");
            out.println("<a href = lookOrderForm.jsp>查看订单</a>");
            out.println("</body></html>");
           response.sendRedirect("/lookOrderForm.jsp");

        }
        catch (IOException exp){}
    }
    public void fail(HttpServletRequest request,HttpServletResponse response,String backNews)
    {
        response.setContentType("text/html;charset=utf-8");
        try{
            PrintWriter out=response.getWriter();
            out.println("<html><body>");
            out.println("<h2>"+backNews+"</h2>");
            out.println("返回主页:");
            out.println("<a href = index.jsp>主页</a>");
            out.println("</body></html>");
           response.sendRedirect("/index.jsp");


        }
        catch (IOException exp){}
    }
}
