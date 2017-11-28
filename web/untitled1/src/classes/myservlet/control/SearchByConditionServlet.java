package classes.myservlet.control;
import classes.mybean.data.DataByPage;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;
/**
 * Created by jh on 2017/4/27.
 */
public class SearchByConditionServlet extends HttpServlet{
    CachedRowSetImpl rowSet =null;
    public void init(ServletConfig config)throws ServletException {//severlet第一次请求加载，服务器创建一个severlet，init初始化，
        super.init(config);//sevletconfig对象负责传递服务设置信息
        try {
            Class.forName("com.mysql.jdbc.Driver");// 加载驱动程序以连接数据库
        } catch (Exception e) {}
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        request.setCharacterEncoding("UTF-8");//字符编码，输入流
        String searchMess = request.getParameter("searchMess");//关键字
        String radioMess = request.getParameter("radio");//搜索类别
        if(searchMess==null||searchMess.length()==0){
            System.out.println("没有查询信息，无法查看");
            rowSet=null;
            return ;
        }
        String codition ="";
        if(radioMess.equals("num")){//按产品编号在数据库中查找记录
            codition="SELECT * FROM destinationform where num = '"+searchMess+"'";
        }
        else if(radioMess.equals("name")){//按目的地
            codition="SELECT * FROM destinationform where name LIKE '%"+searchMess+"%'";//模糊查找
        }
        else if(radioMess.equals("from")){//按始发地
            codition="SELECT * FROM destinationform where fromplace LIKE '%"+searchMess+"%'";//模糊查找
        }
        else if(radioMess.equals("price")){
            double max=0,min=0;
            String regex ="[^0123456789]";//正则表达式，不包括0123456789的任何字符
            String []priceMess =searchMess.split(regex);
            if(priceMess.length==1){
                max=min=Double.parseDouble(priceMess[0]);
            }
            else if(priceMess.length==2){
                min=Double.parseDouble(priceMess[0]);
                max=Double.parseDouble(priceMess[1]);
                if(max<min){
                    double t=max;
                    max=min;
                    min=t;
                }
            }
            else{
                rowSet=null;
                return ;
            }
            codition="SELECT * FROM destinationform WHERE price <= "+max+"AND price >= "+min;
        }
        HttpSession session= request.getSession(true);
        Connection con =null;
        DataByPage dataBean=null;
        try{
            dataBean = (DataByPage)session.getAttribute("dataBean");
            if(dataBean==null){
                dataBean = new DataByPage();
                session.setAttribute("dataBean",dataBean);
            }
        }
        catch(Exception e){
            dataBean = new DataByPage();
            session.setAttribute("dataBean",dataBean);
        }

        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{
            con = DriverManager.getConnection( url ,username, SQLpassword);
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=sql.executeQuery(codition);
            rowSet = new CachedRowSetImpl();//创建可执行对象
            rowSet.populate(rs);
            dataBean.setRowSet(rowSet);
            con.close();
        }
        catch(SQLException e){}
        response.sendRedirect("byPageShow.jsp");//重定向
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
