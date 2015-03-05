package ua.com.iweb.helpfull;

import java.io.Serializable;

/**
 * Created by Vadym on 05.03.15.
 */
public class Login implements Serializable {
    private String login;
    private String password;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
