package cn.ty.service;

import cn.ty.mapper.NewsMapper;
import cn.ty.pojo.News;
import cn.ty.pojo.NewsExample;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class NewsServiceimpl implements NewsService {
    @Autowired
    private NewsMapper newsMapper;

    @Override
    public PageInfo<News> findAll(int pageNum, int pageSize, String start, String end, String title) throws ParseException {
        PageHelper.startPage(pageNum,pageSize);
        NewsExample newsExample = new NewsExample();
        NewsExample.Criteria cri = newsExample.createCriteria();
        if (!StringUtils.isEmpty(title)){
            cri.andTypeLike("%"+title+"%");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(!StringUtils.isEmpty(start)){// >=
            cri.andCreatetimeGreaterThanOrEqualTo(sdf.parse(start));
        }
        if(!StringUtils.isEmpty(end)){// <=
            cri.andCreatetimeLessThanOrEqualTo(sdf.parse(end));
        }
        List<News> news = newsMapper.selectByExample(newsExample);
        PageInfo pageInfo = new PageInfo<>(news);

        return pageInfo;
    }

    @Override
    public void insert(News news) {
        newsMapper.insertSelective(news);
    }

    @Override
    public void delete(int id) {

       newsMapper.deleteByPrimaryKey(id);

    }

    @Override
    public News findByid(int id) {
        News news = newsMapper.selectByPrimaryKey(id);

        return news ;
    }

    @Override
    public void update(News ne) {
            newsMapper.updateByPrimaryKey(ne);
    }


}
