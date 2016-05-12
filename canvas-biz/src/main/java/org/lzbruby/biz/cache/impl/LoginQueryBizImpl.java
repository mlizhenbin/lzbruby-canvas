package org.lzbruby.biz.cache.impl;

import com.google.code.ssm.api.ParameterValueKeyProvider;
import com.google.code.ssm.api.ReadThroughSingleCache;
import org.lzbruby.biz.cache.LoginQueryBiz;
import org.lzbruby.biz.cache.UserDo;
import org.springframework.stereotype.Service;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/4/15 Time: 14:45
 */
@Service("loginQueryBiz")
public class LoginQueryBizImpl implements LoginQueryBiz {

    @ReadThroughSingleCache(namespace = "ruby", expiration = 300000)
    public UserDo findUserDoById(@ParameterValueKeyProvider long userId) {
        UserDo userDao = new UserDo();
        userDao.setUserId(userId);
        userDao.setUserName("ruby-Zhenbin.Li" + userId);
        userDao.setPassword("testpwd");
        return userDao;
    }
}
