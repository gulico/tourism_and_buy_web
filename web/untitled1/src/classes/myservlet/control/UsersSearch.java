package classes.myservlet.control;
import classes.mybean.data.DataByPage;
import com.sun.rowset.CachedRowSetImpl;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.String;

/**
 * Created by jh on 2017/5/21.
 */
public class UsersSearch  extends HttpServlet {
    CachedRowSetImpl rowSet =null;
    public void init(ServletConfig config)throws ServletException {//severlet第一次请求加载，服务器创建一个severlet，init初始化，
        super.init(config);//sevletconfig对象负责传递服务设置信息
        try {
            Class.forName("com.mysql.jdbc.Driver");// 加载驱动程序以连接数据库
        } catch (Exception e) {}
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        request.setCharacterEncoding("UTF-8");//字符编码，输入流
        String keyword = request.getParameter("keyword");//关键字
        if(keyword==null||keyword.length()==0){
            System.out.println("没有查询信息，无法查看");
            rowSet=null;
            return ;
        }
        String codition ="";
        codition="SELECT * FROM member WHERE logname LIKE '%"+keyword+"%' OR email LIKE '%"+keyword+"%' OR password LIKE '%"+keyword+"%' OR sex ='"+keyword+"'";
        System.out.println("condition:"+codition);
        HttpSession session= request.getSession(true);
        Connection con =null;
        DataByPage usersdataBean=null;
        try{
            usersdataBean = (DataByPage)session.getAttribute("usersdataBean");
            if(usersdataBean==null){
                usersdataBean = new DataByPage();
                session.setAttribute("usersdataBean",usersdataBean);
            }
        }
        catch(Exception e){
            usersdataBean = new DataByPage();
            session.setAttribute("usersdataBean",usersdataBean);
        }

        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
        String username = "root";
        String SQLpassword = "123123";
        try{
            con = DriverManager.getConnection( url ,username, SQLpassword);
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=sql.executeQuery(codition);
            //System.out.println(rs);
            rowSet = new CachedRowSetImpl();//创建可执行对象
            rowSet.populate(rs);
            usersdataBean.setRowSet(rowSet);
            con.close();
        }
        catch(SQLException e){}
        response.sendRedirect("findUsers.jsp");//重定向
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        doPost(request, response);
    }
}
