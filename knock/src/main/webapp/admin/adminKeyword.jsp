<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <%@ include file="admininclude.jsp"%>

        <script>
            $(() => {
                $("#delButton").click(keywordDel);
            });
            function keywordDel() {
                var checkLength = document.getElementsByName("keyname");

                var rowData = new Array();
                var tdArr = new Array();
                var list = [];

                // 체크된 체크박스 확인
                var checkBox = $("input[name=keyname]:checked");
                // 체크된 체크박스 값을 가져온다, 체크된 박스가 존재할때 실행
                checkBox.each(function (i) {
                    // checkbox.parent() : 부모는 <td>
                    // checkbox.parent().parent() : <td>의 부모는 <tr>
                    var tr = checkBox.parent().parent().eq(i);
                    var td = tr.children();

                    // 체크된 row의 모든 값을 배열에 담기
                    rowData.push(tr.text());

                    // 체크된 데이터 모두 tdArr에 넣기
                    /* 	tdArr.push(td.eq(0).text());
		console.log(tdArr);
		 */
                    var tdArrJson = { data: td.eq(0).text() };
                    list.push(tdArrJson);
                });

                var jsonData = JSON.stringify(list);
                if (list.length == 0) {
                    alert("선택된 데이터가 없습니다.");
                } else {
                    $.ajax({
                        url: "admin?type=adminKeywordDel",
                        type: "post",
                        data: { jsonData: jsonData },
                        traditional: true,
                        dataType: "json",
                        error: function (request, status, error) {
                            alert(
                                "code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" +
                                    "error:" +
                                    error
                            );
                        },
                    });
                }
            }
        </script>
    </head>
    <body>
        <div class="container-sm">
            <form id="keywordForm" method="post">
                <table class="table" id="activeTable">
                    <c:if test="${empty keyList }">
                        <tr>
                            <td>등록된 키워드가 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty keyList }">
                        <thead>
                            <tr>
                                <td>키워드 이름</td>
                                <td>키워드 선택</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="keyword" items="${keyList }">
                                <tr>
                                    <td>${keyword.k_content }</td>
                                    <td><input type="checkbox" name="keyname" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </c:if>
                    <tr>
                        <td><input type="text" name="keyadd" /></td>
                        <td><input type="button" value="추가하기" id="addButton" onclick="keywordAdd()" /></td>
                        <!-- <td><input type="button" value="삭제하기" id="delButton" class="delButton" onclick="keywordDel1()"/></td> -->
                        <td><input type="button" value="삭제하기" id="delButton" class="delButton" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
