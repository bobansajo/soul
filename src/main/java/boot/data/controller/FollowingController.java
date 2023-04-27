package boot.data.controller;

import boot.data.service.FollowingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FollowingController {

    @Autowired
    FollowingService service;

    @GetMapping("/soul/following")
    public ModelAndView followingList() {
        ModelAndView mv=new ModelAndView();

        mv.setViewName("/following/followingList");
        return mv;
    }
}
