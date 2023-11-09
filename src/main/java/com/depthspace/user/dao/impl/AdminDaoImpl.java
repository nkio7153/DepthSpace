package com.depthspace.user.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.depthspace.user.rowmapper.AdminRowMapper;
import com.depthspace.user.dao.AdminDao;
import com.depthspace.user.dto.AdminRegisterRequest;
import com.depthspace.user.model.Admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Override
    public Admin getUserById(Integer userId) {
        String sql = "SELECT user_id, email, password, created_date, last_modified_date " +
                "FROM user WHERE user_id = :userId";

        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);

        List<Admin> userList = namedParameterJdbcTemplate.query(sql, map, new AdminRowMapper());

        if (userList.size() > 0) {
            return userList.get(0);
        } else {
            return  null;
        }
    }

    @Override
    public Admin getUserByEmail(String email) {
        String sql = "SELECT user_id, email, password, created_date, last_modified_date " +
                "FROM user WHERE email = :email";

        Map<String, Object> map = new HashMap<>();
        map.put("email", email);

        List<Admin> userList = namedParameterJdbcTemplate.query(sql, map, new AdminRowMapper());

        if (userList.size() > 0) {
            return userList.get(0);
        } else {
            return  null;
        }
    }

    @Override
    public Integer createUser(AdminRegisterRequest adminRegisterRequest) {
        String sql = "INSERT INTO user(email, password, created_date, last_modified_date) " +
                "VALUES (:email, :password, :createdDate, :lastModifiedDate)";

        Map<String, Object> map = new HashMap<>();
        map.put("email", adminRegisterRequest.getEmail());
        map.put("password", adminRegisterRequest.getPassword());

        Date now = new Date();
        map.put("createdDate", now);
        map.put("lastModifiedDate", now);

        KeyHolder keyHolder = new GeneratedKeyHolder();

        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map), keyHolder);

        int userId = keyHolder.getKey().intValue();

        return userId;
    }
}