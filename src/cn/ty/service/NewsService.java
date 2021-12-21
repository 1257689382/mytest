package cn.ty.service;

import cn.ty.pojo.News;
import com.github.pagehelper.PageInfo;

import java.text.ParseException;

public interface NewsService {
    PageInfo<News> findAll(int pageNum, int pageSize, String start, String end, String title) throws ParseException;

    void insert(News news);

    void    delete(int id);

    News findByid(int id);
    void update(News ne);
}
