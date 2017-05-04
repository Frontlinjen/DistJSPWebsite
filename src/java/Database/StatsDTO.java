package Database;

import java.io.Serializable;
import java.util.List;

public class StatsDTO implements Serializable{
    
    String TagID;
    int count;
    
    public StatsDTO(){
        
    }
    
    public String getTagID(){
        return this.TagID;
    }
    
    public int getCount(){
        return this.count;
    }
    
    public void setTagID(String tag){
        this.TagID = tag;
    }
    
    public void setCount(int count){
        this.count = count;
    }
}
