package org.lzbruby.biz.cache.impl;

import com.google.code.ssm.api.*;
import com.google.code.ssm.api.format.Serialization;
import com.google.code.ssm.api.format.SerializationType;
import org.lzbruby.ssm.domain.protobuf.Session;
import org.springframework.stereotype.Service;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/4/16 Time: 17:29
 */
@Service("sessionManager")
public class SessionManager {

    @UpdateSingleCache(namespace = "lzb", expiration = 6000)
    @Serialization(SerializationType.CUSTOM)
    @ReturnDataUpdateContent
    public Session updateSession(@ParameterValueKeyProvider Session session) {
        session.setAttribute("sign","1234569");
        return session;
    }

    @ReadThroughSingleCache(namespace = "lzb", expiration = 6000)
    @Serialization(SerializationType.CUSTOM)
    public Session getSession(@ParameterValueKeyProvider long sessionId) {
        Session session = new Session();
        session.setSessionId(sessionId);
        session.setAttribute("name", "session" + session);
        session.setAttribute("sign", "12345678" + session);
        session.setAttribute("group", "dba" + session);
        return session;
    }

    @InvalidateSingleCache
    public void cleanSession(@ParameterValueKeyProvider long sessionId) {
    }
}
