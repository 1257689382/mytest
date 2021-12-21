package cn.ty.controller;

import cn.ty.pojo.News;
import cn.ty.service.NewsService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

@Controller
@RequestMapping("news")
public class NewsController {
    @Autowired
        private NewsService newsService;

    @RequestMapping("/findAll")
    public String findAll(Model model, String title, String start, String end, @RequestParam(defaultValue = "1") int pageNum) throws ParseException {
        int pageSize= 2;
        PageInfo<News> pageInfo = newsService.findAll(pageNum,pageSize,start,end,title);
            model.addAttribute("pageInfo",pageInfo);
            model.addAttribute("start",start);
            model.addAttribute("end",end);
            model.addAttribute("title",title);
        return  "news/news_list";
    }
    @RequestMapping("/toinsert")
    public String toinsert(){

        return "news/news_add";
    }
    @RequestMapping("/insert")
    public String insert(News news){
        newsService.insert(news);

        return "redirect: findAll.action";
    }

    @RequestMapping("/delete")
    public String delete(String ids, HttpServletRequest req){
        String[] id = ids.split(",");
        for (int i = 0; i < id.length; i++) {
            newsService.delete(Integer.parseInt(id[i]));
        }
        return "redirect: findAll.action";
    }

    @RequestMapping("/toupdate")
    public String toupdate(Model model, int id){
        News byid = newsService.findByid(id);
        model.addAttribute("byid",byid);

        return "news/news_update";

    }

    @RequestMapping("/update")
    public  String update(News ne){
                newsService.update(ne);
        return "redirect: findAll.action";
    }
   @RequestMapping("/todelete")
    public  String todelete(int id){
        newsService.delete(id);

        return "redirect: findAll.action";
    }
}
