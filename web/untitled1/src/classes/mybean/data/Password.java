package classes.mybean.data;

/**
 * Created by Administrator on 2017/4/29.
 */
public class Password {
    String oldPassword,newPassword,backNews="";
    public void setNewPassword(String pw){
        newPassword=pw;
    }
    public  String getNewPassword(){
        return newPassword;
    }
    public void setOldPassword(String pw){
        oldPassword=pw;
    }
    public String getOldPassword(){
        return oldPassword;
    }
    public String getBackNews(){
        return backNews;
    }
    public void setBackNews(String s){
        backNews = s;
    }
}
