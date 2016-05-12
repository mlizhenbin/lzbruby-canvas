package org.lzbruby.ssm.domain.protobuf;

import com.google.code.ssm.api.CacheKeyMethod;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/4/16 Time: 15:56
 */
public class Session {

    private long sessionId;

    private Map<String, String> map = new HashMap<String, String>();

    public void setAttribute(String key, String value) {
        map.put(key, value);
    }

    public String getAttribute(String key) {
        return map.get(key);
    }

    public Set<String> getAttributeKeySet() {
        return map.keySet();
    }

    public Session(Ssm.Session session) {
        Iterator<Ssm.MapEntity> entityIterator = session.getAttributesList().iterator();
        while (entityIterator.hasNext()) {
            Ssm.MapEntity entity = entityIterator.next();
            map.put(entity.getKey(), entity.getValue());
        }
    }


    public long getSessionId() {
        return sessionId;
    }

    @CacheKeyMethod
    public String cacheKey() {
        return String.valueOf(sessionId);
    }

    public void setSessionId(long sessionId) {
        this.sessionId = sessionId;
    }

    public Session() {
    }

    @Override
    public String toString() {
        return "Session{" +
                "sessionId=" + sessionId +
                ", map=" + map +
                '}';
    }
}