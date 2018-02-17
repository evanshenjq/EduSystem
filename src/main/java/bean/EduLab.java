package bean;

public class EduLab {
    private Long lId;

    private String lName;

    private String lNum;

    private String lStime;

    private String lEtime;

    private String lPlace;

    private String lPeople;

    private String lDes;

    public Long getlId() {
        return lId;
    }

    public void setlId(Long lId) {
        this.lId = lId;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName == null ? null : lName.trim();
    }

    public String getlNum() {
        return lNum;
    }

    public void setlNum(String lNum) {
        this.lNum = lNum == null ? null : lNum.trim();
    }

    public String getlStime() {
        return lStime;
    }

    public void setlStime(String lStime) {
        this.lStime = lStime == null ? null : lStime.trim();
    }

    public String getlEtime() {
        return lEtime;
    }

    public void setlEtime(String lEtime) {
        this.lEtime = lEtime == null ? null : lEtime.trim();
    }

    public String getlPlace() {
        return lPlace;
    }

    public void setlPlace(String lPlace) {
        this.lPlace = lPlace == null ? null : lPlace.trim();
    }

    public String getlPeople() {
        return lPeople;
    }

    public void setlPeople(String lPeople) {
        this.lPeople = lPeople == null ? null : lPeople.trim();
    }

    public String getlDes() {
        return lDes;
    }

    public void setlDes(String lDes) {
        this.lDes = lDes == null ? null : lDes.trim();
    }
}