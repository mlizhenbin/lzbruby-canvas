package org.lzbruby.web.controller;

import com.google.code.ssm.api.ReadThroughSingleCache;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.lzbruby.biz.cache.impl.SessionManager;
import org.lzbruby.ssm.domain.protobuf.Session;

import javax.servlet.*;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/4/16 Time: 16:30
 */
public class SessionFilter implements Filter {

    private SessionManager sessionManager;

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
//        HttpSession session = httpServletRequest.getSession();
//        sessionManager.getSession(112321l);
        filterChain.doFilter(servletRequest, servletResponse);
    }

    public void destroy() {

    }

    @ReadThroughSingleCache(namespace = "ruby", expiration = 3600)
    private Session getSession(HttpSession httpSession) {
        Session session = new Session();
        session.setSessionId(httpSession.getId().hashCode());
        session.setAttribute("session", ToStringBuilder.reflectionToString(session));
        return session;
    }
}
