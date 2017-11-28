package classes.mybean.data;
import java.util.*;
/**
 * Created by Administrator on 2017/5/29.
 */
public class GoodsBase {
    String num = "",name = "",fromplace = "",price = "",mess = "";
    String backNews = "",backexp ="";
    public void setNum(String nm){
        num = nm;
    }
    public String getNum(){//获取昵称
        return num;
    }
    public void setName(String na){//设置密码
        name = na;
    }
    public String getName(){//获取密码
        return name;
    }
    public void setFromplace(String em){//设置邮箱
        fromplace = em;
    }
    public String getFromplace(){//获取邮箱
        return fromplace;
    }
    public void setPrice(String p){//设置邮箱
        price = p;
    }
    public String getPrice(){//获取邮箱
        return price;
    }
    public void setMess(String sx){
        mess = sx;
    }
    public String getMess(){ return mess;}
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
