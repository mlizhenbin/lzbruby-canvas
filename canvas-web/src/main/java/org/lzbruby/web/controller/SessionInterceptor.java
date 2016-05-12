package org.lzbruby.web.controller;

import org.lzbruby.biz.cache.impl.SessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/4/16 Time: 17:47
 */
public class SessionInterceptor implements HandlerInterceptor {

    @Autowired
    private SessionManager sessionManager;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String id = request.getSession().getId();
        sessionManager.getSession(id.hashCode());
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        sessionManager.getSession(112321);
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
