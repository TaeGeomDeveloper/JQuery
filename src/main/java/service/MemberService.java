package service;

import dao.memberDAO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import vo.memberVO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberService {

    public String sendData() {
        String jsonString = null;

        Map<String, String> obj1 = new HashMap<String, String>();
        obj1.put("name", "kim");
        obj1.put("age", "20");
        obj1.put("id", "user");

        Map<String, String> obj2 = new HashMap<String, String>();
        obj2.put("name", "lee");
        obj2.put("age", "25");
        obj2.put("id", "admin");

        List<Map<String, String>> list = new ArrayList<Map<String,String>>();

        list.add(obj1);
        list.add(obj2);

        Map<String,List<Map<String,String>>> obj3 = new HashMap<String,List<Map<String,String>>>();

        obj3.put("members", list);
        jsonString = (String)JSONObject.toJSONString(obj3);

        return jsonString;
    }

    public void testJsonObject(String json) throws ParseException {
        JSONParser parser = new JSONParser();
        JSONObject jsonObj = (JSONObject)parser.parse(json);
        System.out.println(jsonObj.get("name"));

        JSONArray array = (JSONArray)jsonObj.get("name");
        for(int i = 0; i < array.size(); i++) {
            System.out.println(array.get(i));
        }

    }
    public boolean isMember(String id) {
        boolean flag = false;

        memberDAO dao = new memberDAO();
        try {
            memberVO member = dao.selectOne(id);
            if(member != null) {
                flag = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return flag;
    }
}
