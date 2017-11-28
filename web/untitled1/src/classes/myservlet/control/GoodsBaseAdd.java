package classes.myservlet.control;
import classes.mybean.data.GoodsBase;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;
import com.sun.rowset.CachedRowSetImpl;
/**
 * Created by Administrator on 2017/5/29.
 */
public class GoodsBaseAdd  extends HttpServlet{
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
        GoodsBase reg = new GoodsBase();
        request.setAttribute("GoodsBase", reg);//添加属性名和属性值

        String num = request.getParameter("num").trim();
        String name = request.getParameter("name").trim();

        String fromp  = request.getParameter("fromp").trim();

        String price  = request.getParameter("price").trim();

        String mess  = request.getParameter("mess").trim();

        String pic  = request.getParameter("pic").trim();

        String id  = request.getParameter("num").trim();

        String pic1  = request.getParameter("pic1").trim();

        String pic2  = request.getParameter("pic2").trim();

        String pic3  = request.getParameter("pic3").trim();

        String days  = request.getParameter("days").trim();
        boolean boo = num.length()>0&&name.length()>0;//名字不为空，密码不为空，名字合法
        String backNews = "";
        String backexp = "";
        System.out.println(name+"------"+pic);
        RequestDispatcher rd = request.getRequestDispatcher("newGoods.jsp");
        request.setAttribute("num",num);//存值
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
            String insertRecord = "('"+num+"','"+name+"','"+fromp+"','"+price+"','"+mess+"','"+pic+"','"+id+"','"+pic1+"','"+pic2+"','"+pic3+"','"+days+"')";
            // Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            // sql.executeUpdate("UPDATE detial_scheduling SET days='"+days+"' , d1_scheduling='"+d1_s+"' , d1_diner='"+d1_d+"', d1_hotel='"+d1_h+"', d2_scheduling='"+d2_s+"', d2_diner='"+d2_d+"', d2_hotel='"+d2_h+"', d3_scheduling='"+d3_s+"', d3_diner='"+d3_d+"', d3_hotel='"+d3_h+"' where num='"+num+"'");
            //ResultSet rs=sql.executeQuery("DELETE  FROM member where logname="+Name);
            String insertCondition = "INSERT INTO destinationform VALUES"+insertRecord;
            sql = con.createStatement();
            if(boo){
                int m =sql.executeUpdate(insertCondition);
                if(m!=0){
                    backNews = "商品添加成功";
                    reg.setbackNews(backNews);
                    reg.getbackexp();
                    reg.setNum(num);
                    reg.setName(name);
                    reg.setFromplace(fromp);
                    reg.setPrice(price);
                    reg.setMess(mess);
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
        rd.forward(request,response);//开始跳转
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
