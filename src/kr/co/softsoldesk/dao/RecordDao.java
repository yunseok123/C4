package kr.co.softsoldesk.dao;


import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.RecordBean;
import kr.co.softsoldesk.mapper.RecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class RecordDao {

    @Autowired
    private RecordMapper recordMapper;

    public List<RecordBean> getAllPlayerRecords() {
        List<RecordBean> recordList=recordMapper.getAllPlayerRecords();

    	
    	
        return recordList;
    }
    
    public RecordBean selectRecordsByPlayerId(int playerId) {
        return recordMapper.selectRecordsByPlayerId(playerId);       
        
    }
    
    public void updateRecord(RecordBean record) {
      recordMapper.updateRecord(record);
    }
    public void insertRecord(int playerId) {
        recordMapper.insertRecord(playerId);
    }
}
    


     
 