package bean;

import java.util.Date;

public class EduFile {
    private Long fId;

    private String fName;

    private String fTName;

    private String fUrl;

    private Date fCreated;

    public Long getfId() {
        return fId;
    }

    public void setfId(Long fId) {
        this.fId = fId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName == null ? null : fName.trim();
    }

    public String getfTName() {
        return fTName;
    }

    public void setfTName(String fTName) {
        this.fTName = fTName == null ? null : fTName.trim();
    }

    public String getfUrl() {
        return fUrl;
    }

    public void setfUrl(String fUrl) {
        this.fUrl = fUrl == null ? null : fUrl.trim();
    }

    public Date getfCreated() {
        return fCreated;
    }

    public void setfCreated(Date fCreated) {
        this.fCreated = fCreated;
    }
}