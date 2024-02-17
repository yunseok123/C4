package kr.co.softsoldesk.beans;

import java.util.ArrayList;
import java.util.List;

public class RecordBeanListWrapper {
    private List<RecordBean> records;

    // 기본 생성자
    public RecordBeanListWrapper() {
        this.records = new ArrayList<>();
    }

    // getter와 setter
    public List<RecordBean> getRecords() {
        return records;
    }

    public void setRecords(List<RecordBean> records) {
        this.records = records;
    }
}
