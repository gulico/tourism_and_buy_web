package classes.mybean.data;

/**
 * Created by Administrator on 2017/5/28.
 */
public class Goods {
    int days;
    String num = "",d1_scheduling = "",d1_diner = "",d1_hotel = "",d2_scheduling = "",d2_diner = "",d2_hotel = "",d3_scheduling = "",d3_diner = "",d3_hotel = "";
    String backNews = "",backexp ="";
    public void setnum(String Num){ num = Num; }
    public String getnum(){//获取昵称
        return num;
    }
    public void setDays(int a){ days = a; }
    public int getDays(){ return  days;}
    public void setD1_scheduling(String ds){//设置密码
        d1_scheduling = ds;
    }
    public String getD1_scheduling(){
        return d1_scheduling;
    }
    public void setD1_diner(String dd){
        d1_diner = dd;
    }
    public String getD1_diner(){//获取邮箱
        return d1_diner;
    }
    public void setD1_hotel(String dh){
        d1_hotel = dh;
    }
    public String getD1_hotel(){ return d1_hotel;}


    public void setD2_scheduling(String ds){//设置密码
        d2_scheduling = ds;
    }
    public String getD2_scheduling(){
        return d2_scheduling;
    }
    public void setD2_diner(String dd){
        d2_diner = dd;
    }
    public String getD2_diner(){//获取邮箱
        return d2_diner;
    }
    public void setD2_hotel(String dh){
        d2_hotel = dh;
    }
    public String getD2_hotel(){ return d2_hotel;}


    public void setD3_scheduling(String ds){//设置密码
        d3_scheduling = ds;
    }
    public String getD3_scheduling(){
        return d3_scheduling;
    }
    public void setD3_diner(String dd){
        d3_diner = dd;
    }
    public String getD3_diner(){//获取邮箱
        return d3_diner;
    }
    public void setD3_hotel(String dh){
        d3_hotel = dh;
    }
    public String getD3_hotel(){ return d3_hotel;}




    public void setbackNews(String bk){
        backNews = bk;
    }
    public String getbackNews(){
        return backNews;
    }
    public void setbackexp(String be){
        backexp = be;
    }
    public String getbackexp(){
        return backexp;
    }

}
