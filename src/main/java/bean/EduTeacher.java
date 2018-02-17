package bean;

import javax.validation.constraints.Pattern;

public class EduTeacher {
    private Long tId;

    @Pattern(regexp="[a-zA-Z][a-zA-Z0-9]{3,11}"
    		,message="4-12λӢ��������ϣ�������ĸΪӢ��")
    private String tUsername;

    @Pattern(regexp="^[a-z0-9]{6,16}$",message="����Ϊ6-16ΪСдӢ����ĸ�������")
    private String tPassword;

    @Pattern(regexp="(^[a-zA-Z_-]{3,16})|(^[\u2E80-\u9FFF]{2,5})",message="�û�������Ϊ2��5λ���Ļ�3��16λӢ��")
    private String tName;

    public Long gettId() {
        return tId;
    }

    public void settId(Long tId) {
        this.tId = tId;
    }

    public String gettUsername() {
        return tUsername;
    }

    public void settUsername(String tUsername) {
        this.tUsername = tUsername == null ? null : tUsername.trim();
    }

    public String gettPassword() {
        return tPassword;
    }

    public void settPassword(String tPassword) {
        this.tPassword = tPassword == null ? null : tPassword.trim();
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName == null ? null : tName.trim();
    }
}