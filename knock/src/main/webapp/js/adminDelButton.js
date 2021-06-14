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
                        url: "/knock/admin?type=adminKeywordDel",
                        type: "post",
                        data: { jsonData: jsonData },
                        traditional: true,
                        dataType: "json",
                        success: alert("success"),
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