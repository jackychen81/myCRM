package com.myCRM.tools;
import java.util.HashMap;
import java.util.Map;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DataTableParams {
	public Map<String,Object> getParams(String aoData){
		Map<String,Object> params = new HashMap<String, Object>();
		Map<String,String> search = new HashMap<String, String>();
		JSONArray jsonarray = JSONArray.fromObject(aoData);
		String sEcho = null;
		int iDisplayStart = 0;
		int iDisplayLength = 10;
		String sSearch= "";
		int iSortCol = 0;
		String sSortDir = "asc";
		String sortColName=null;
		
		for (int i = 0; i < jsonarray.size(); i++) {
			JSONObject obj = (JSONObject) jsonarray.get(i);
			if (obj.get("name").equals("sEcho")){
				sEcho = obj.get("value").toString();
				params.put("sEcho", sEcho);
			}
			
			//获取tfoot自定义查询的参数 var params = {"name":"search","value":[]};
			if (obj.get("name").equals("search")){
				JSONArray value = obj.getJSONArray("value");
				for(int j = 0;j<value.size();j++){
					search.put("a"+value.getJSONObject(j).get("name").toString(), value.getJSONObject(j).get("value").toString());
				}
				params.put("mySearch", search);
				params.put("mySearchJson", value);
			}
			
			//��ʼ��
			if (obj.get("name").equals("iDisplayStart")){
				iDisplayStart = obj.getInt("value");
				params.put("start", iDisplayStart);
			}
			
			//ҳ��С
			if (obj.get("name").equals("iDisplayLength")){
				iDisplayLength = obj.getInt("value");
				params.put("length", iDisplayLength);
			}
			
			//�����ؼ���
			if(obj.get("name").equals("sSearch")){
				sSearch = obj.get("value").toString();
				//System.out.println(sSearch);
				params.put("search", sSearch);
			}
			//������
			if(obj.get("name").equals("sSortDir_0")){
				sSortDir = obj.get("value").toString();
				//System.out.println("sSortDir= "+sSortDir);
				params.put("dir", sSortDir);
			}
			//����������
			if(obj.get("name").equals("iSortCol_0")){
				iSortCol = obj.getInt("value");
				//System.out.println("sort col id= "+iSortCol);
				
			}
		}
		for (int i = 0; i < jsonarray.size(); i++){
			JSONObject obj = (JSONObject) jsonarray.get(i);
			if(obj.get("name").equals("mDataProp_"+iSortCol)){
				sortColName = obj.get("value").toString();
				params.put("sort", sortColName);
				//System.out.println(sortColName);
			}
		}
		return params;
	}
}
