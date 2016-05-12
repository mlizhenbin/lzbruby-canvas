package org.lzbruby.ssm.transcoder;

import com.google.code.ssm.providers.CacheTranscoder;
import com.google.code.ssm.providers.CachedObject;
import com.google.code.ssm.providers.CachedObjectImpl;
import com.google.protobuf.InvalidProtocolBufferException;
import org.lzbruby.ssm.domain.protobuf.Session;
import org.lzbruby.ssm.domain.protobuf.Ssm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/4/16 Time: 15:55
 */
public class ProtobufCacheTranscoder implements CacheTranscoder {

    /**
     * sl4j
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(ProtobufCacheTranscoder.class);

    @Override
    public Session decode(CachedObject data) {
        try {
            Ssm.Session session = Ssm.Session.parseFrom(data.getData());
            return new Session(session);
        } catch (InvalidProtocolBufferException e) {
            LOGGER.error("parse session from protobuf error", e);
        }
        return null;
    }

    @Override
    public CachedObject encode(Object o) {
        if (o == null) {
            throw new RuntimeException("cache object null");
        }

        if (!(o instanceof Session)) {
            throw new RuntimeException("cache Object not session");
        }

        Session session = (Session) o;
        Ssm.Session.Builder builder = Ssm.Session.newBuilder();
        for (String key : session.getAttributeKeySet()) {
            Ssm.MapEntity.Builder entityBuilder = Ssm.MapEntity.newBuilder();
            entityBuilder.setKey(key).setValue(session.getAttribute(key));
            builder.addAttributes(entityBuilder.build());
        }

        return new CachedObjectImpl(PROTOBUF_SERIALIZED, builder.build().toByteArray());
    }


    private static final int PROTOBUF_SERIALIZED = 9;

}
