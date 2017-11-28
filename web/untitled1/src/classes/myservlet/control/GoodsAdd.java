package classes.myservlet.control;
import classes.mybean.data.Goods;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;
/**
 * Created by Administrator on 2017/5/28.
 */
public class GoodsAdd extends HttpServlet{
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

        Statement sql;
        Goods reg = new Goods();
        request.setAttribute("goods", reg);//添加属性名和属性值
        String num = request.getParameter("num").trim();
System.out.println(num+"dsfsdgsg");


        String d1_s  = request.getParameter("d1_s").trim();

        String d1_d  = request.getParameter("d1_d").trim();

        String d1_h  = request.getParameter("d1_h").trim();

        String d2_s  = request.getParameter("d2_s").trim();

        String d2_d  = request.getParameter("d2_d").trim();

        String d2_h  = request.getParameter("d2_h").trim();

        String d3_s  = request.getParameter("d3_s").trim();

        String d3_d  = request.getParameter("d3_d").trim();

        String d3_h  = request.getParameter("d3_h").trim();
        boolean boo = num.length()>0;//名字不为空，密码不为空，名字合法
        String backNews = "";
        String backexp = "";
        System.out.println(d1_h+"------"+d1_d);

        HttpSession session= request.getSession(true);
        Connection con =null;
        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{

            con = DriverManager.getConnection( url ,username, SQLpassword);
            String insertRecord = "('"+num+"','"+d1_s+"','"+d1_d+"','"+d1_h+"','"+d2_s+"','"+d2_d+"','"+d2_h+"','"+d3_s+"','"+d3_d+"','"+d3_h+"')";

            String insertCondition = "INSERT INTO detial_scheduling VALUES"+insertRecord;
            sql = con.createStatement();
            if(boo){
                int m =sql.executeUpdate(insertCondition);
                if(m!=0){
                    backNews = "商品添加成功";
                    reg.setbackNews(backNews);
                    reg.getbackexp();
                    reg.setD1_scheduling(d1_s);
                    reg.setD1_diner(d1_d);
                    reg.setD1_hotel(d1_h);
                    reg.setD2_scheduling(d2_s);
                    reg.setD2_diner(d2_d);
                    reg.setD2_hotel(d2_h);
                    reg.setD3_scheduling(d3_s);
                    reg.setD3_diner(d3_d);
                    reg.setD3_hotel(d3_h);
                }
            }
            else{
                backNews = "信息填写不完整";
                reg.setbackNews(backNews);
            }
            con.close();

        }
        catch(SQLException exp){
            backNews = "该商品编号已被使用，请您更换编号";
            backexp = ""+exp;
            System.out.println(exp+"asda");
            reg.setbackexp(backexp);
            reg.setbackNews(backNews);
        }
        response.sendRedirect("items_information.jsp");//重定向
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
