package com.dj.ssm.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class UserQuery implements Serializable {

    private String userName;

    private String hobby;

    private String hobbyShow;

    private Integer sex;

    private Integer pageNo;

    private Integer pageSize;

    private List<User> pl;


}
