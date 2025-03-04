package com.xh.blogs.controller.manager;

import com.xh.blogs.api.IGroupService;
import com.xh.blogs.consts.CommonConst;
import com.xh.blogs.consts.RequestUrl;
import com.xh.blogs.consts.ViewUrl;
import com.xh.blogs.domain.po.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Name CommentsController
 * @Description
 * @Author wen
 * @Date 2019-05-06
 */
@Controller
@RequestMapping("/admin/group")
public class GroupController {

    @Autowired
    private IGroupService groupService;

    @GetMapping("/list")
    public String list(ModelMap model) {
        model.put(CommonConst.DATA_RESULT_KEY, groupService.getAll());
        return ViewUrl.ADMIN_GROUP_LIST;
    }

    @GetMapping("/view")
    public String view(Integer id, ModelMap model) {
        if(id != null && id > 0){
            model.put(CommonConst.DATA_RESULT_KEY, groupService.getById(id));
        }
        return ViewUrl.ADMIN_GROUP_VIEW;
    }

    @PostMapping("/update")
    public String update(Group group){
        groupService.save(group);
        return RequestUrl.REDIRECT_ADMIN_GROUP_LIST;
    }

}
