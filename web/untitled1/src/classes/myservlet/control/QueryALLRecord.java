package classes.myservlet.control;
import classes.mybean.data.DataByPage;
import com.sun.rowset.CachedRowSetImpl;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;

/**
 * Created by jh on 2017/4/20.
 */
//把destinForm表中查询到的记录存到dataBean中，然后重定向到byPageShow.jps页面
public class QueryALLRecord extends HttpServlet{
    CachedRowSetImpl rowSet =null;
    public void init(ServletConfig config)throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");// 加载驱动程序以连接数据库
        } catch (Exception e) {}
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        request.setCharacterEncoding("UTF-8");
        String idNumber =request.getParameter("fenleiNumber");
        if(idNumber == null) {
            idNumber = "0";
        }
        int id =Integer.parseInt(idNumber);
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
            ResultSet rs=sql.executeQuery("SELECT * FROM destinationform where id="+id);
            rowSet = new CachedRowSetImpl();//创建可执行对象
            rowSet.populate(rs);
            dataBean.setRowSet(rowSet);
            con.close();
        }
        catch(SQLException e){
            System.out.print(e);
        }
            response.sendRedirect("byPageShow.jsp");//重定向
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
