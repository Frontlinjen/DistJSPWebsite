
package Database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StatisticsRepository {
    
    private final String GET_TAGSSTATS = "select Tags.name, COUNT(*) as TagCount from TaskTags join Tags on TaskTags.TagID = Tags.ID GROUP BY TaskTags.TagID;";
    
    public StatisticsRepository() throws DALException{
		DatabaseConnector.RegisterStatement("GET_TAGSSTATS", GET_TAGSSTATS);
		
}
    public List<StatsDTO> GetStats() throws SQLException{
    PreparedStatement statement = DatabaseConnector.getPreparedStatement("GET_TAGSSTATS");
    ResultSet result = statement.executeQuery();
    List<StatsDTO> stats = new ArrayList<StatsDTO>(); 
    while(result.next()){
        StatsDTO dto = new StatsDTO();
        dto.setCount(result.getInt(2));
        dto.setTagID(result.getString(1));
        stats.add(dto);
    }
    return stats;
    }
}


//select Tags.name, COUNT(*) as TagCount from TaskTags join Tags on TaskTags.TagID = Tags.ID GROUP BY TaskTags.TagID;