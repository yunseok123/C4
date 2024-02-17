package kr.co.softsoldesk.service;

import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.RecordBean;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.dao.RecordDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class RecordService {

    @Autowired
    private RecordDao recordDao;

    // ���� �޼���: �� ���غ� ���� 3�� ���� ���� (ERA�� ������ ���ؿ� ���� GAMEPLAYED ���� ����)
    private List<RecordBean> getTopPlayers(Comparator<RecordBean> comparator, boolean applyGamePlayedCondition, int gamePlayedThreshold) {
        return recordDao.getAllPlayerRecords().stream()
                .sorted(comparator)
                .collect(Collectors.toList());
    }
    
    
    public List<RecordBean> allRecordsBat() {
        List<RecordBean> records = recordDao.getAllPlayerRecords();
        
        for (RecordBean record : records) {
            // Ÿ�� ���
            if (record.getAtBats() > 0) {
                double battingAverage = (double) record.getHits() / record.getAtBats();
                record.setBattingAverage(Double.parseDouble(new DecimalFormat("0.000").format(battingAverage)));
            } else {
                record.setBattingAverage(0.0); // Ÿ���� ���� ��� Ÿ���� 0���� ����
            }
            
     
            if (record.getAtBats() > 0) {
                int realHit = record.getHits() - record.getHit2() - record.getHit3() - record.getHomerun();
                double SLG = (double) (realHit + (record.getHit2() * 2) + (record.getHit3() * 3) + (record.getHomerun() * 4)) / record.getAtBats();
                record.setSlg(Double.parseDouble(new DecimalFormat("0.000").format(SLG)));
            }
            // ����� ���
            if (record.getAtBats()+record.getBb()+record.getSf()>0) {
            	int rs=record.getHits()+record.getBb();
            	int bs=record.getAtBats()+record.getBb()+record.getSf();
                double OBP = (double)(rs)/(bs);
                record.setObp(Double.parseDouble(new DecimalFormat("0.000").format(OBP)));
            }
			
            if (record.getAtBats()+record.getBb()+record.getSf()>0) {
            	int realHit = record.getHits() - record.getHit2() - record.getHit3() - record.getHomerun();
                double SLG = (double) (realHit + (record.getHit2() * 2) + (record.getHit3() * 3) + (record.getHomerun() * 4)) / record.getAtBats();
                int rs=record.getHits()+record.getBb();
            	int bs=record.getAtBats()+record.getBb()+record.getSf();
                double OBP = (double)(rs)/(bs);
                double OPS= SLG+OBP;
                record.setOps(Double.parseDouble(new DecimalFormat("0.000").format(OPS)));

            }
			 

            
            
        }

        // ���ǿ� ���� ���͸� �� ����, �ߺ� ����
        return records.stream()
            .filter(r -> r.getBats() >=443 )// ���͸� ���� ����
            .distinct() // �ߺ� ����
            .sorted(Comparator.comparingDouble(RecordBean::getBattingAverage).reversed()) // ����
            .collect(Collectors.toList());
    }
    
    public List<RecordBean> allRecordsPit1() {
        List<RecordBean> records = recordDao.getAllPlayerRecords();
        
        for (RecordBean record : records) {
            if (record.getInnging() > 0) {
                double ERA = (double) (record.getEarnedruns()*9)/ record.getInnging();
                DecimalFormat df = new DecimalFormat("0.00"); 
                ERA = Double.parseDouble(df.format(ERA));
                record.setEra(ERA);            
            } 
            if (record.getInnging() > 0) {
                double WHIP = (double) (record.getBb()+record.getHit_against())/ record.getInnging();
                DecimalFormat df = new DecimalFormat("0.00"); 
                WHIP = Double.parseDouble(df.format(WHIP));
                record.setWhip(WHIP);           
            }
            if (record.getInnging() > 0) {
                double INNGINGK = (double) (record.getSo())/ ((record.getInnging()*9));
                DecimalFormat df = new DecimalFormat("0.00"); 
                INNGINGK = Double.parseDouble(df.format(INNGINGK));
                record.setInngingk(INNGINGK);      
            } 
            if (record.getInnging() > 0) {
            	double INNGINGBB = (double) (record.getBb())/ ((record.getInnging()*9));                DecimalFormat df = new DecimalFormat("0.00"); 
            	INNGINGBB = Double.parseDouble(df.format(INNGINGBB));
                record.setInngingbb(INNGINGBB);           
            } 
        }
        

        // ���ǿ� ���� ���͸� �� ����, �ߺ� ����
        return records.stream()
        	.filter(r -> r.getInnging() >=144 )// ���͸� ���� ����
            .distinct() // �ߺ� ����
            .sorted(Comparator.comparingDouble(RecordBean::getEra)) // ����
            .collect(Collectors.toList());
    }
    public List<RecordBean> allRecordsPit2() {
        List<RecordBean> records = recordDao.getAllPlayerRecords();
        
        for (RecordBean record : records) {
            if (record.getInnging() > 0) {
                double ERA = (double) (record.getEarnedruns()*9)/ record.getInnging();
                DecimalFormat df = new DecimalFormat("0.00"); 
                ERA = Double.parseDouble(df.format(ERA));
                record.setEra(ERA);            
            } 
            if (record.getInnging() > 0) {
                double WHIP = (double) (record.getBb()+record.getHit_against())/ record.getInnging();
                DecimalFormat df = new DecimalFormat("0.00"); 
                WHIP = Double.parseDouble(df.format(WHIP));
                record.setWhip(WHIP);           
            }
            if (record.getInnging() > 0) {
                double INNGINGK = (double) (record.getSo())/ ((record.getInnging()*9));
                DecimalFormat df = new DecimalFormat("0.00"); 
                INNGINGK = Double.parseDouble(df.format(INNGINGK));
                record.setInngingk(INNGINGK);      
            } 
            if (record.getInnging() > 0) {
            	double INNGINGBB = (double) (record.getBb())/ ((record.getInnging()*9));                DecimalFormat df = new DecimalFormat("0.00"); 
            	INNGINGBB = Double.parseDouble(df.format(INNGINGBB));
                record.setInngingbb(INNGINGBB);           
            } 
        }
        

        // ���ǿ� ���� ���͸� �� ����, �ߺ� ����
        return records.stream()
        	.filter(r -> r.getInnging() >=20	 )// ���͸� ���� ����
            .distinct() // �ߺ� ����
            .sorted(Comparator.comparingDouble(RecordBean::getEra)) // ����
            .collect(Collectors.toList());
    }
    
    public List<RecordBean> getTopPlayersByBattingAverage() {
    	  List<RecordBean> records = recordDao.getAllPlayerRecords();
          List<RecordBean> filteredRecords = new ArrayList<>();

          // Ÿ�� ��� �� ���͸� ���� ����
          for (RecordBean record : records) {
              if (record.getAtBats() > 0) {
                  double battingAverage = (double) record.getHits() / record.getAtBats();
                  DecimalFormat df = new DecimalFormat("0.000"); 
                  battingAverage = Double.parseDouble(df.format(battingAverage));
                  record.setBattingAverage(battingAverage);

                  // bats ���� Ư�� ���غ��� ū ��쿡�� ����Ʈ�� �߰�
                  if (record.getAtBats() >= 3 * 144) { // yourConditionValue�� ���� ���ذ��Դϴ�.
                      filteredRecords.add(record);
                  }
              } else {
                  record.setBattingAverage(0.0); // Ÿ���� ���� ��� Ÿ���� 0���� ����
                  // ���ؿ� �������� �ʴ� ���ڵ� ó�� ���� (�ʿ��� ���)
              }
          }

          // Ÿ���� ���� ������ ���� �� ���� 3�� ����
          return filteredRecords.stream()
                  .sorted(Comparator.comparingDouble(RecordBean::getBattingAverage).reversed())
                  .collect(Collectors.toList());
      }
   //�����
    public List<RecordBean> getTopPlayersByERA() {
    	 List<RecordBean> records = recordDao.getAllPlayerRecords();
         List<RecordBean> filteredRecords = new ArrayList<>();

         for (RecordBean record : records) {
             if (record.getInnging() > 0) {
                 double ERA = (double) (record.getEarnedruns()*9)/ record.getInnging();
                 DecimalFormat df = new DecimalFormat("0.00"); 
                 ERA = Double.parseDouble(df.format(ERA));
                 record.setEra(ERA);

                 
                 if (record.getInnging() >= 144.0) { // yourConditionValue�� ���� ���ذ��Դϴ�.
                     filteredRecords.add(record);
                 }
             } else {
                 record.setEra(0.0); // Ÿ���� ���� ��� Ÿ���� 0���� ����
                
             }
         }

         // Ÿ���� ���� ������ ���� �� ���� 3�� ����
         return filteredRecords.stream()
                 .sorted(Comparator.comparingDouble(RecordBean::getEra))
                 .collect(Collectors.toList());
     }
  //�·�  
    public List<RecordBean> getTopPlayersByWinRate() {
   	 List<RecordBean> records = recordDao.getAllPlayerRecords();
        List<RecordBean> filteredRecords = new ArrayList<>();

        // Ÿ�� ��� �� ���͸� ���� ����
        for (RecordBean record : records) {
            if (record.getInnging() > 0) {
                double WinRate = (double) (record.getWin())/ (record.getWin()+(record.getLose()));
                DecimalFormat df = new DecimalFormat("0.000"); 
                WinRate = Double.parseDouble(df.format(WinRate));
                record.setWinRate(WinRate);

                
                if (record.getInnging() >= 144.0) { 
                    filteredRecords.add(record);
                }
            } else {
                record.setWinRate(0.0); 
               
            }
        }

        
        return filteredRecords.stream()
                .sorted(Comparator.comparingDouble(RecordBean::getWinRate).reversed())
                .collect(Collectors.toList());
    }

  //��Ÿ��
    public List<RecordBean> getTopPlayersBySLG() {
  	  List<RecordBean> records = recordDao.getAllPlayerRecords();
        List<RecordBean> filteredRecords = new ArrayList<>();

        for (RecordBean record : records) {
            if (record.getAtBats() > 0) {
            	int realHit=record.getHits()-record.getHit2()-record.getHit3()-record.getHomerun();
                double SLG = (double) ((realHit)+(record.getHit2()*2)+(record.getHit3()*3)+(record.getHomerun()*4))/record.getAtBats();
                DecimalFormat df = new DecimalFormat("0.000"); 
                SLG = Double.parseDouble(df.format(SLG));
                record.setSlg(SLG);

                if (record.getAtBats() >= 446) { // yourConditionValue�� ���� ���ذ��Դϴ�.
                    filteredRecords.add(record);
                }
            }
        }

        // Ÿ���� ���� ������ ���� �� ���� 3�� ����
        return filteredRecords.stream()
                .sorted(Comparator.comparingDouble(RecordBean::getSlg).reversed())
                .collect(Collectors.toList());
    }
    
   


    // Ȩ��(HR) ���� ���� 3��
    public List<RecordBean> getTopPlayersByHomeRuns() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getHomerun).reversed(), false, 0);
    }

    // Ÿ��(RBI) ���� ���� 3��
    public List<RecordBean> getTopPlayersByRBI() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getRbi).reversed(), false, 0);
    }
    
    // ���� ���� ���� 3��
    public List<RecordBean> getTopPlayersByscore() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getScore).reversed(), false, 0);
    }
    //��Ÿ
    public List<RecordBean> getTopPlayersByhit() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getHits).reversed(), false, 0);
    }
    
    

    // �¸�(WIN) ���� ���� 3��
    public List<RecordBean> getTopPlayersByWins() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getWin).reversed(), false, 0);
    }

    // ����(SO) ���� ���� 3��
    public List<RecordBean> getTopPlayersBySO() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getSo).reversed(), false, 0);
    }
    public List<RecordBean> getTopPlayersBySave() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getSave).reversed(), false, 0);
    }
    public List<RecordBean> getTopPlayersByHold() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getHold).reversed(), false, 0);
    }
    
    
    public RecordBean selectRecordsByPlayerId(int playerId) {
        return recordDao.selectRecordsByPlayerId(playerId);
    }
    
    
    public void updateRecord(RecordBean record) {
    	recordDao.updateRecord(record);
    }

    public void insertRecord(int playerId) {
        recordDao.insertRecord(playerId); // �ʿ��� �Ķ���͸� �߰�
    }

}