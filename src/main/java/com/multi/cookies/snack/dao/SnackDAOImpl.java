
package com.multi.cookies.snack.dao;


import com.multi.cookies.snack.dto.SearchDTO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import java.util.*;


@Repository
public class SnackDAOImpl implements SnackDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<SearchDTO> snackSearch(String keyword, String category) {
        System.out.println("DAO까지 잘 왔어!");

        List<SearchDTO> searchResults;
        if (category.equals("name")) {
            searchResults = sqlSessionTemplate.selectList("snack.searchName", keyword);
        } else if (category.equals("ingredient")) {
            searchResults = sqlSessionTemplate.selectList("snack.searchIngredient", keyword);
        } else {
            searchResults = sqlSessionTemplate.selectList("snack.searchAll", keyword);
        }
        return searchResults;
    }

    @Override
    public SearchDTO snackInfo(int snack_id) {
        System.out.println("디테일 DAO!");
        return sqlSessionTemplate.selectOne("snack.snackInfo", snack_id);
    }

    @Override
    public void saveKeyword(String keyword) {

        int duplicateCheck = sqlSessionTemplate.selectOne("snack.duplicateCheck", keyword);
        if (duplicateCheck > 0) {
            sqlSessionTemplate.update("snack.updateKeywordCount", keyword);
        }else {
            sqlSessionTemplate.insert("snack.saveKeyword", keyword);
        }
    }

    @Override
    public List<String> getPopularKeywords() {
        System.out.println("DAO 요청이 되었느냐?");
        List<String> popularKeywords = sqlSessionTemplate.selectList("snack.getPopularKeywords");
        System.out.println(popularKeywords);
        return popularKeywords;
    }


  // @Override
  // public List<String> getPopularKeywords() {
  //     System.out.println("DAO 요청이 되었느냐?");
  //     List<String> popularKeywords = sqlSessionTemplate.selectList("snack.getPopularKeywords");
  //     System.out.println(popularKeywords);
  //     return popularKeywords;
  // }
}

