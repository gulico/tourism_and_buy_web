/**
 * Created by Administrator on 2017/4/17.
 */
package classes.myservlet.control;
import classes.mybean.data.*;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class HandleLogin extends HttpServlet
{   public void init(ServletConfig config) throws ServletException
{ super.init(config);
    try {  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    }
    catch(Exception e){}
}
    public String handleString(String s)
    {   try{ byte bb[]=s.getBytes("UTF-8");
        s=new String(bb);
    }
    catch(Exception ee){}
        return s;
    }
    public  void  doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException
    {   Connection con;
        PreparedStatement sql;
        Login loginBean=null;
        String backNews="";
        HttpSession session=request.getSession(true);

        try{  loginBean=(Login)session.getAttribute("login");
            if(loginBean==null)
            { loginBean=new Login();
                session.setAttribute("login",loginBean);
            }
        }
        catch(Exception ee)
        {  loginBean=new Login();
            session.setAttribute("login",loginBean);
        }
        String logname=request.getParameter("logname").trim(),
                password=request.getParameter("password").trim();
        boolean ok=loginBean.getSuccess();
        logname=handleString(logname);
        password=handleString(password);
        if(ok==true&&logname.equals(loginBean.getLogname()))
        {  backNews=logname+"已经登录了";
            loginBean.setBackNews(backNews);
        }
        else
        {
            String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
            String username = "root";
            String SQLpassword = "123123";
            boolean boo=(logname.length()>0)&&(password.length()>0);
            try{ con=DriverManager.getConnection(url,username,SQLpassword);
                String condition="select * from member where logname =? and password =?";
                sql=con.prepareStatement(condition);
                if(boo)
                { sql.setString(1,logname);
                    sql.setString(2,password);
                    ResultSet rs=sql.executeQuery();
                    boolean m=rs.next();
                    if(m==true)
                    {  backNews="登录成功";
                        loginBean.setBackNews(backNews);
                        loginBean.setSuccess(true);
                        loginBean.setLogname(logname);
                        sql.executeUpdate("UPDATE member SET loginNum=loginNum+1 WHERE logname='"+logname+"'");
                    }
                    else
                    {  backNews="您输入的用户名不存在，或密码不般配";
                        loginBean.setBackNews(backNews);
                        loginBean.setSuccess(false);
                        loginBean.setLogname(logname);
                        loginBean.setPassword(password);
                    }
                }
                else
                { backNews="您输入的用户名不存在，或密码不般配";
                    loginBean.setBackNews(backNews);
                    loginBean.setSuccess(false);
                    loginBean.setLogname(logname);
                    loginBean.setPassword(password);
                }
                con.close();
            }
            catch(SQLException exp)
            {  backNews=""+exp;
                loginBean.setBackNews(backNews);
                loginBean.setSuccess(false);
            }
        }
        RequestDispatcher dispatcher=request.getRequestDispatcher("showLoginMess.jsp");
        dispatcher.forward(request, response);
    }
    public  void  doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {   doPost(request,response);
    }
}
