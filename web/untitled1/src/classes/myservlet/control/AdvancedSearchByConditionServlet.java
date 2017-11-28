package classes.myservlet.control;
        import classes.mybean.data.DataByPage;
        import com.sun.rowset.*;
        import java.sql.*;
        import java.io.*;
        import javax.servlet.*;
        import javax.servlet.http.*;
        import java.lang.String;
/**
 * Created by jh on 2017/5/3.
 */
public class AdvancedSearchByConditionServlet extends HttpServlet{
    CachedRowSetImpl rowSet =null;
    public void init(ServletConfig config)throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");// 加载驱动程序以连接数据库
        } catch (Exception e) {}
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        request.setCharacterEncoding("UTF-8");
        String searchradiofrom = request.getParameter("radiofrom");//flag 具体
        String fromplaceMess = request.getParameter("messfrom");//出发地
        String nameplace = request.getParameter("nameplace");
        String nameplacemess = request.getParameter("nameplacemess");
        String price = request.getParameter("price");
        String pricemax =request.getParameter("pricemax");
        String pricemin =request.getParameter("pricemin");
        String days = request.getParameter("days");
        String daysmin = request.getParameter("daysmin");
        String daysmax =request.getParameter("daysmax");
        String codition ="SELECT * FROM destinationform ";
        int flag=0;
        if(searchradiofrom.equals("0")){//始发地
        }
        else if (searchradiofrom.equals("1")){
            if(flag==0){
                codition=codition+"where fromplace LIKE '%"+fromplaceMess+"%' ";
            }
            else{
                codition=codition+"and fromplace LIKE '%"+fromplaceMess+"%' ";
            }
            System.out.println(codition);
            flag++;
        }

        if(nameplace.equals("0")){//目的地
        }
        else if (nameplace.equals("1")){
            if(flag==0){
                codition=codition+"where name like '%"+nameplacemess+"%' ";
            }
            else{
                codition=codition+"and name LIKE '%"+nameplacemess+"%' ";
            }
            System.out.println(codition);
            flag++;
        }
        if(price.equals("0")){//价格
        }
        else if (price.equals("1")){
            double max,min;
            min =Double.parseDouble(pricemin);
            max =Double.parseDouble(pricemax);
            if(flag==0){
                codition=codition+"where price >= "+min+" and price <= "+max;
            }
            else{
                codition=codition+"and price >= "+min+" and price <= "+max;
            }
            System.out.println(codition);
            flag++;
        }
        if(days.equals("0")){//天数
        }
        else if (days.equals("1")){
            double max,min;
            min =Double.parseDouble(daysmin);
            max =Double.parseDouble(daysmax);
            System.out.println(daysmin);
            if(flag==0){
                codition=codition+"where days >= "+min+" and days <= "+max;
            }
            else{
                codition=codition+"and days >= "+min+" and days <= "+max;
            }
            System.out.println(codition);
            flag++;
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
