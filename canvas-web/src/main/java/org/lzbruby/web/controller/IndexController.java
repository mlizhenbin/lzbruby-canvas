package org.lzbruby.web.controller;

import org.lzbruby.biz.cache.LoginQueryBiz;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 功能描述：
 *
 * @author: Zhenbin.Li
 * email： lizhenbin08@sina.com
 * company：org.lzbruby
 * Date: 16/3/17 Time: 16:48
 */
@Controller
public class IndexController {

    /**
     * sl4j
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private LoginQueryBiz loginQueryBiz;

    @RequestMapping("/hello.html")
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("hello", "hello world!");

//        for (int i = 20000000; i < 20010000; i++) {
//            UserDo userDo = loginQueryBiz.findUserDoById(i);
//            LOGGER.info("userDao={}", userDo);
//        }
        return "hello";
    }
}
