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

    // 범용 메서드: 각 기준별 상위 3명 선수 선택 (ERA를 제외한 기준에 대한 GAMEPLAYED 조건 없음)
    private List<RecordBean> getTopPlayers(Comparator<RecordBean> comparator, boolean applyGamePlayedCondition, int gamePlayedThreshold) {
        return recordDao.getAllPlayerRecords().stream()
                .sorted(comparator)
                .collect(Collectors.toList());
    }
    
    
    public List<RecordBean> allRecordsBat() {
        List<RecordBean> records = recordDao.getAllPlayerRecords();
        
        for (RecordBean record : records) {
            // 타율 계산
            if (record.getAtBats() > 0) {
                double battingAverage = (double) record.getHits() / record.getAtBats();
                record.setBattingAverage(Double.parseDouble(new DecimalFormat("0.000").format(battingAverage)));
            } else {
                record.setBattingAverage(0.0); // 타석이 없는 경우 타율을 0으로 설정
            }
            
     
            if (record.getAtBats() > 0) {
                int realHit = record.getHits() - record.getHit2() - record.getHit3() - record.getHomerun();
                double SLG = (double) (realHit + (record.getHit2() * 2) + (record.getHit3() * 3) + (record.getHomerun() * 4)) / record.getAtBats();
                record.setSlg(Double.parseDouble(new DecimalFormat("0.000").format(SLG)));
            }
            // 출루율 계산
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

        // 조건에 따른 필터링 후 정렬, 중복 제거
        return records.stream()
            .filter(r -> r.getBats() >=443 )// 필터링 조건 예시
            .distinct() // 중복 제거
            .sorted(Comparator.comparingDouble(RecordBean::getBattingAverage).reversed()) // 정렬
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
        

        // 조건에 따른 필터링 후 정렬, 중복 제거
        return records.stream()
        	.filter(r -> r.getInnging() >=144 )// 필터링 조건 예시
            .distinct() // 중복 제거
            .sorted(Comparator.comparingDouble(RecordBean::getEra)) // 정렬
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
        

        // 조건에 따른 필터링 후 정렬, 중복 제거
        return records.stream()
        	.filter(r -> r.getInnging() >=20	 )// 필터링 조건 예시
            .distinct() // 중복 제거
            .sorted(Comparator.comparingDouble(RecordBean::getEra)) // 정렬
            .collect(Collectors.toList());
    }
    
    public List<RecordBean> getTopPlayersByBattingAverage() {
    	  List<RecordBean> records = recordDao.getAllPlayerRecords();
          List<RecordBean> filteredRecords = new ArrayList<>();

          // 타율 계산 및 필터링 조건 적용
          for (RecordBean record : records) {
              if (record.getAtBats() > 0) {
                  double battingAverage = (double) record.getHits() / record.getAtBats();
                  DecimalFormat df = new DecimalFormat("0.000"); 
                  battingAverage = Double.parseDouble(df.format(battingAverage));
                  record.setBattingAverage(battingAverage);

                  // bats 값이 특정 기준보다 큰 경우에만 리스트에 추가
                  if (record.getAtBats() >= 3 * 144) { // yourConditionValue는 비교할 기준값입니다.
                      filteredRecords.add(record);
                  }
              } else {
                  record.setBattingAverage(0.0); // 타석이 없는 경우 타율을 0으로 설정
                  // 기준에 부합하지 않는 레코드 처리 로직 (필요한 경우)
              }
          }

          // 타율이 높은 순으로 정렬 및 상위 3명만 선택
          return filteredRecords.stream()
                  .sorted(Comparator.comparingDouble(RecordBean::getBattingAverage).reversed())
                  .collect(Collectors.toList());
      }
   //방어율
    public List<RecordBean> getTopPlayersByERA() {
    	 List<RecordBean> records = recordDao.getAllPlayerRecords();
         List<RecordBean> filteredRecords = new ArrayList<>();

         for (RecordBean record : records) {
             if (record.getInnging() > 0) {
                 double ERA = (double) (record.getEarnedruns()*9)/ record.getInnging();
                 DecimalFormat df = new DecimalFormat("0.00"); 
                 ERA = Double.parseDouble(df.format(ERA));
                 record.setEra(ERA);

                 
                 if (record.getInnging() >= 144.0) { // yourConditionValue는 비교할 기준값입니다.
                     filteredRecords.add(record);
                 }
             } else {
                 record.setEra(0.0); // 타석이 없는 경우 타율을 0으로 설정
                
             }
         }

         // 타율이 높은 순으로 정렬 및 상위 3명만 선택
         return filteredRecords.stream()
                 .sorted(Comparator.comparingDouble(RecordBean::getEra))
                 .collect(Collectors.toList());
     }
  //승률  
    public List<RecordBean> getTopPlayersByWinRate() {
   	 List<RecordBean> records = recordDao.getAllPlayerRecords();
        List<RecordBean> filteredRecords = new ArrayList<>();

        // 타율 계산 및 필터링 조건 적용
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

  //장타율
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

                if (record.getAtBats() >= 446) { // yourConditionValue는 비교할 기준값입니다.
                    filteredRecords.add(record);
                }
            }
        }

        // 타율이 높은 순으로 정렬 및 상위 3명만 선택
        return filteredRecords.stream()
                .sorted(Comparator.comparingDouble(RecordBean::getSlg).reversed())
                .collect(Collectors.toList());
    }
    
   


    // 홈런(HR) 기준 상위 3명
    public List<RecordBean> getTopPlayersByHomeRuns() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getHomerun).reversed(), false, 0);
    }

    // 타점(RBI) 기준 상위 3명
    public List<RecordBean> getTopPlayersByRBI() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getRbi).reversed(), false, 0);
    }
    
    // 득점 기준 상위 3명
    public List<RecordBean> getTopPlayersByscore() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getScore).reversed(), false, 0);
    }
    //안타
    public List<RecordBean> getTopPlayersByhit() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getHits).reversed(), false, 0);
    }
    
    

    // 승리(WIN) 기준 상위 3명
    public List<RecordBean> getTopPlayersByWins() {
        return getTopPlayers(Comparator.comparingInt(RecordBean::getWin).reversed(), false, 0);
    }

    // 삼진(SO) 기준 상위 3명
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
        recordDao.insertRecord(playerId); // 필요한 파라미터를 추가
    }

}