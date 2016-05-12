package org.lzbruby.biz.cache;

import org.apache.commons.lang.builder.ToStringBuilder;

import java.io.Serializable;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/4/15 Time: 14:46
 */
public class UserDo implements Serializable {
    private static final long serialVersionUID = 3890556882726069894L;

    private long userId;

    private String userName;

    private String password;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
