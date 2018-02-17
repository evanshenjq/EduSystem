package bean;

import javax.validation.constraints.Pattern;

public class EduTeacher {
    private Long tId;

    @Pattern(regexp="[a-zA-Z][a-zA-Z0-9]{3,11}"
    		,message="4-12位英文数字组合，且首字母为英文")
    private String tUsername;

    @Pattern(regexp="^[a-z0-9]{6,16}$",message="密码为6-16为小写英文字母数字组合")
    private String tPassword;

    @Pattern(regexp="(^[a-zA-Z_-]{3,16})|(^[\u2E80-\u9FFF]{2,5})",message="用户名可以为2到5位中文或3到16位英文")
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