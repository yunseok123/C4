package kr.co.softsoldesk.beans;

import java.util.ArrayList;
import java.util.List;

public class RecordBeanListWrapper {
    private List<RecordBean> records;

    // �⺻ ������
    public RecordBeanListWrapper() {
        this.records = new ArrayList<>();
    }

    // getter�� setter
    public List<RecordBean> getRecords() {
        return records;
    }

    public void setRecords(List<RecordBean> records) {
        this.records = records;
    }
}
