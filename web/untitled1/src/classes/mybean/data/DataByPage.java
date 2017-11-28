/**
 * Created by wxy on 2017/4/20.
 */
package classes.mybean.data;
import com.sun.rowset.*;
public class DataByPage {
    CachedRowSetImpl rowSet=null;//储存表中全部记录的行集对象
    int pageSize = 5;//每页显示的记录数5
    int totalPage =1;//分页后的总页数
    int currentPage = 1;//当前显示页数
    public void setRowSet(CachedRowSetImpl set){
        rowSet =set;
    }
    public CachedRowSetImpl getRowSet(){
        return rowSet;
    }
    public void setPageSize(int size){
        pageSize = size;
    }
    public int getPageSize(){
        return pageSize;
    }
    public void setTotalPage(int n){
        totalPage=n;
    }
    public int getTotalPage(){
        return totalPage;
    }
    public void setCurrentPage(int n){
        currentPage =n;
    }
    public int getCurrentPage(){
        return currentPage;
    }

}
