/**
 * Created by Administrator on 2017/4/17.
 */
package classes.mybean.data;

import java.util.*;

public class Login
{   String  logname,
        password,
        backNews="";
    boolean success=false;
    LinkedList<String>car;
    public Login(){
        car=new LinkedList<String>();
    }
    public void setLogname(String name)
    {  logname=name;
    }
    public String getLogname()
    {return logname;
    }
    public void setPassword(String pw)
    {  password=pw;
    }
    public String getPassword()
    {return password;
    }
    public String getBackNews()
    { return backNews;
    }
    public void setBackNews(String s)
    { backNews=s;
    }
    public void setSuccess(boolean b)
    {  success=b;
    }
    public boolean getSuccess()
    {   return success;
    }
    public LinkedList<String>getCar(){
        return car;
    }
}
