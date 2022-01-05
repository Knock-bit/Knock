$(() => {
	$("#addButton").click(keywordAdd);
});

function keywordAdd() {
	var inputVal = $("#keyadd").val();
	alert(inputVal);
	$.ajax({
		url: "/knock/admin?type=adminKeywordAdd",
		type: "post",
		dataType: "text",
		data: "data=" + inputVal,
		success: function(result) {
			alert("데이터 추가 성공");
			location.reload()
		}
	})

}