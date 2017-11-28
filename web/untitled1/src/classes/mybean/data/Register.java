/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author wxy
 */
package classes.mybean.data;
public class Register {//用户注册
    String logname = "",password = "",email = "",sex = "",email2 = "";
    String backNews = "",backexp ="";
    public void setLogname(String name){//设置昵称
        logname = name;
    }
    public String getLogname(){//获取昵称
        return logname;
    }
    public void setPassword(String pw){//设置密码
        password = pw;
    }
    public String getPassword(){//获取密码
        return password;
    }
    public void setEmail(String em){//设置邮箱
        email = em;
    }
    public String getEmail(){//获取邮箱
        return email;
    }
    public void setSex(String sx){
        sex = sx;
    }
    public String getSex(){ return sex;}
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
    public void setEmail2(String em2){//设置邮箱
        email2 = em2;
    }
    public String getEmail2(){//获取邮箱
        return email2;
    }
}
