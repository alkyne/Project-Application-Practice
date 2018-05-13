<%@ page contentType="text/html;charset=utf-8"%>

<%!

String htmlspecialchars(String value) {      
	
	  value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	  value = value.replaceAll("'", "&#39;");
	  value = value.replaceAll("script", "");	  
	  return value;	  
}

%>
