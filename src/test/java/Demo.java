import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dj.ssm.pojo.User;
import com.fasterxml.jackson.databind.util.JSONPObject;

import java.util.List;

public class Demo {
    public static void main(String[] args) {
        //json格式字符串
        String str = "{\"userName\":\"q\",\"userPwd\":\"123\"}";
        //字符串转换为json对象
        JSONObject jsonObject = JSONObject.parseObject(str);
        //json对象转换为java对象
        User user = jsonObject.toJavaObject(User.class);
        System.out.println(user.getId()+"-"+user.getUserName()+"-"+user.getPassword());

        //字符串直接转java对象
        User user1 = JSONObject.parseObject(str, User.class);
        System.out.println(user.getId()+"-"+user.getUserName()+"-"+user.getPassword());

        //java对象转json字符串
        String s = JSONObject.toJSONString(user);
        System.out.println(s);


        String str1 = "[{\"userName\":\"qa\",\"userPwd\":\"123\"},{\"userName\":\"qb\",\"userPwd\":\"123\"},{\"userName\":\"qc\",\"userPwd\":\"123\"},{\"userName\":\"qw\",\"userPwd\":\"123\"}]";
        //json字符串转换json数组
        JSONArray json = JSONArray.parseArray(str);
        //json数组转换成java集合
        List<User> ts = json.toJavaList(User.class);
        System.out.println(ts.size());
        //List---str
        String s1 = JSONArray.toJSONString(ts);
        System.out.println(s1);

    }
}
