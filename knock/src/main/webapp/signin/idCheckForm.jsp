<%
String result=(String)request.getAttribute("result");
int num = Integer.parseInt(result);
String str = "";
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