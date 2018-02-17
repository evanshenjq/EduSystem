package bean;

import javax.validation.constraints.Pattern;

public class EduStudent {
    private Long sId;
    
    @Pattern(regexp="[a-zA-Z][a-zA-Z0-9]{3,11}"
    		,message="4-12位英文数字组合，且首字母为英文")
    private String sUsername;
    
    @Pattern(regexp="^[a-z0-9]{6,16}$",message="密码为6-16为小写英文字母数字组合")
    private String sPassword;

    @Pattern(regexp="(^[a-zA-Z_-]{3,16})|(^[\u2E80-\u9FFF]{2,5})",message="用户名可以为2到5位中文或3到16位英文")
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