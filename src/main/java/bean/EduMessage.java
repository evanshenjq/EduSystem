package bean;

import java.util.Date;

public class EduMessage {
    private Long mId;

    private String mName;

    private String mContent;

    private Date mCreated;

    private String mTName;

    public Long getmId() {
        return mId;
    }

    public void setmId(Long mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName == null ? null : mName.trim();
    }

    public String getmContent() {
        return mContent;
    }

    public void setmContent(String mContent) {
        this.mContent = mContent == null ? null : mContent.trim();
    }

    public Date getmCreated() {
        return mCreated;
    }

    public void setmCreated(Date mCreated) {
        this.mCreated = mCreated;
    }

    public String getmTName() {
        return mTName;
    }

    public void setmTName(String mTName) {
        this.mTName = mTName == null ? null : mTName.trim();
    }
}