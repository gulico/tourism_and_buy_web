package classes.myservlet.control;
import classes.mybean.data.Register;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;
/**
 * Created by jh on 2017/5/21.
 */
public class UsersAdd  extends HttpServlet{
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
        Connection con;
        Statement sql;
        Register reg = new Register();
        request.setAttribute("user", reg);//添加属性名和属性值
        String logname = request.getParameter("logname").trim(),//getParameter获取字段名为logname的值，trim去掉空格
                password  = request.getParameter("password").trim(),
                sex  = request.getParameter("sex").trim(),
                email  = request.getParameter("email").trim();
        if(logname == null){//名字不能为空
            logname = "";
        }
        if(password == null){//密码不能为空
            password = "";
        }
        boolean isLD = true;
        for(int i=0;i<logname.length();i++){//判断账号名一定是字母和数字
            char c = logname.charAt(i);
            if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
                isLD = false;
        }
        boolean boo = logname.length()>0&&password.length()>0&&isLD;//名字不为空，密码不为空，名字合法
        String backNews = "";
        String backexp = "";
        try{
            logname = handleString(logname);
            password = handleString(password);
            email = handleString(email);
            sex = handleString(sex);
            String insertRecord = "('"+logname+"','"+password+"','"+email+"','"+sex+"',0)";
            String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
            String username = "root";
            String SQLpassword = "123123";
            con = DriverManager.getConnection( url ,username, SQLpassword); //必须抛出错误
            String insertCondition = "INSERT INTO member VALUES"+insertRecord;
            sql = con.createStatement();
            if(boo){
                int m =sql.executeUpdate(insertCondition);
                if(m!=0){
                    backNews = "用户添加成功";
                    reg.setbackNews(backNews);
                    //reg.getbackexp();
                    reg.setLogname(logname);
                    reg.setPassword(password);
                    reg.setEmail(email);
                }
            }
            else{
                backNews = "信息填写不完整或者名字中有不法字符";
                reg.setbackNews(backNews);
            }
            con.close();
        }
        catch(SQLException exp){
            System.out.println(exp);
            backNews = "该会员名已被使用，请您更换名字";
            backexp = ""+exp;
            reg.setbackexp(backexp);
            reg.setbackNews(backNews);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("newUser.jsp");//转发
        dispatcher.forward(request, response);
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
