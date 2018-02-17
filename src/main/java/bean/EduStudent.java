package bean;

import javax.validation.constraints.Pattern;

public class EduStudent {
    private Long sId;
    
    @Pattern(regexp="[a-zA-Z][a-zA-Z0-9]{3,11}"
    		,message="4-12λӢ��������ϣ�������ĸΪӢ��")
    private String sUsername;
    
    @Pattern(regexp="^[a-z0-9]{6,16}$",message="����Ϊ6-16ΪСдӢ����ĸ�������")
    private String sPassword;

    @Pattern(regexp="(^[a-zA-Z_-]{3,16})|(^[\u2E80-\u9FFF]{2,5})",message="�û�������Ϊ2��5λ���Ļ�3��16λӢ��")
    private String sName;

    public Long getsId() {
        return sId;
    }

    public void setsId(Long sId) {
        this.sId = sId;
    }

    public String getsUsername() {
        return sUsername;
    }

    public void setsUsername(String sUsername) {
        this.sUsername = sUsername == null ? null : sUsername.trim();
    }

    public String getsPassword() {
        return sPassword;
    }

    public void setsPassword(String sPassword) {
        this.sPassword = sPassword == null ? null : sPassword.trim();
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }
}