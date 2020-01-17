package com.cx.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * 普通用户页面拦截器
 * @author 崔信
 * 用来实现拦截未登录用户
 */
public class GeneralIndexInterceptor implements HandlerInterceptor {
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        //执行完毕，返回前拦截
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        //处理过程中执行拦截
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        // 获取请求的URL
        String url = request.getRequestURI();
        url.substring(0,8);
        // 获取Session
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("LOGIN_USER");
        // 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
        if ("GENERAL".equals(user) && url.contains("/general")) {
            //登陆成功，不拦截
            return true;
        }else{
            response.sendRedirect("/login");
            return false;
        }
    }

}

