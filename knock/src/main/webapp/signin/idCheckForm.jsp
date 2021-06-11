<%
String result=(String)request.getAttribute("result");
int num = Integer.parseInt(result);

System.out.println("result >> " + result);
String str = "";

System.out.println("num: " + num);
if (num == 1) {
	str = "Y";
	out.print(str);
} else if (num == -1) {
	str = "N";
	out.print(str);

} else if (num == 0) {
	str = "NULL";
	out.print(str);
}
%>