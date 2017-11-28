package classes.myservlet.control;
import classes.mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 * Created by Administrator on 2017/4/29.
 */
public class HandlePassword extends HttpServlet{
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e){}
    }
    public  void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session = request.getSession(true);
        Login login=(Login)session.getAttribute("login");
        boolean ok=true;
        if(login==null){
            ok=false;
            response.sendRedirect("login.jsp");
        }
        if(ok==true)
            continueWork(request,response);
    }
    public void continueWork(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session = request.getSession(true);
        Login login=(Login)session.getAttribute("login");
        Connection con=null;
        String logname=login.getLogname();
        Password passwordBean=new Password();
        request.setAttribute("password",passwordBean);
        String oldPassword=request.getParameter("oldPassword");
        String newPassword=request.getParameter("newPassword");
        String uri="jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{
            con=DriverManager.getConnection(uri,username,SQLpassword);
            Statement sql=con.createStatement();
            ResultSet rs=sql.executeQuery("SELECT * FROM member where logname='"+logname+"' AND password='"+oldPassword+"'");
            if(rs.next()) {
                String updateString = "UPDATE member SET password='"+newPassword+"'where logname='"+logname+"'";
                int m = sql.executeUpdate(updateString);
                if (m == 1) {
                    passwordBean.setBackNews("密码更新成功");
                    passwordBean.setOldPassword(oldPassword);
                    passwordBean.setNewPassword(newPassword);
                } else
                    passwordBean.setBackNews("更新失败");
                System.out.println("asd dddd"+oldPassword);
            }
            else{
                passwordBean.setBackNews("更新失败");
                System.out.println("asd dddd"+oldPassword);
            }
        }
        catch (SQLException exp){
            passwordBean.setBackNews("更新失败"+exp);
            System.out.println("asd dddd"+logname);
        }
        RequestDispatcher dispatcher=
                request.getRequestDispatcher("showNewPassword.jsp");
        dispatcher.forward(request,response);
    }
    public  void  doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException
    {
        doPost(request,response);
    }
}
