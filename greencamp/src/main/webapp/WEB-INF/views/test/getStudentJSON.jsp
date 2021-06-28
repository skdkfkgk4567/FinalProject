<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
try{
	con = DriverManager.getConnection("jdbc:oracle:thin:@nsh9354.asuscomm.com:1521:xe","final","1234");
	ps	= con.prepareStatement("select * from tb_delng");
	rs	= ps.executeQuery();
	String result = "";
	
	while(rs.next()) {
		result += "{";
		result += "\"sj\":" + "\"" + rs.getString("sj") + "\",";
		result += "\"cn\":" + "\"" + rs.getString("cn") + "\",";
		result += "\"img\":" + "\"" + rs.getString("img") + "\",";
		result += "\"writngde\":" + "\"" + rs.getString("writngde") + "\",";
		result += "\"pc\":" + "\"" + rs.getString("pc") + "\",";
		result += "\"how\":" + "\"" + rs.getString("how") + "\",";
		result += "\"telno\":" + "\"" + rs.getString("telno") + "\",";
		result += "\"ncnm\":" + "\"" + rs.getString("ncnm") + "\"";
		result += "}";
	}
	if(result.length()>0) {
		result = result.subString(0,result.length()-1);
	}
	
	out.println(result);
	
	rs.close();
	ps.close();
	con.close();
}