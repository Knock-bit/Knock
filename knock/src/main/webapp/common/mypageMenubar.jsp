<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function updateMyInfo(frm){
		frm.action = "/userctr?type=updateMyInfoBtn.do";
		frm.submit();
		
	}


</script>
<style>

    .mypage {
        background-color: rgb(39, 192, 128); 
        height: 8%;
        display: flex;
        justify-content: center;
        align-items: center;}
    .mypage h3 {color: white;}

    .mylist {
        margin-top: 10px;
    }

    .updateInfo, .myPoint, .campaignBtn {
        text-align: center;
    }

    .infoUpdateBtn, .nowPointBtn{
        background-color: white;
        box-shadow: none;
        border: 0;
        font-size: 16px;
    }

    .infoUpdateBtn:hover, .nowPointBtn:hover, .campaign:hover {
        color: rgb(32, 189, 142);
        font-weight: bold;
    }


    .campaignBtn{position:relative; display: inline-block; width:100%;
         margin-top:3px;}
    
    

    .campaign-content {
        width: 90%;
        display:none; 
        position:absolute;
        
        }
    

    .campaign-content a {
        text-decoration: none;
        color: black;
        font-weight: normal;
        font-size: 13px;
        
        
        }
    .campaign-content li {
        list-style: none;
         margin : 0 auto;
        }

    .campaignBtn:hover .campaign-content {
        display: block;
    }

    .campaign-content a:hover {
        background-color: rgb(39, 192, 128);
    }

    .menubar {float: left; width:15%; height:700px; border-right: 1px solid black;}

</style>
</head>
<body>
<div class="menubar">
            <div class="mypage">
                <h3>마이페이지</h3>
            </div>
            <div class="myList">
                <div class="updateInfo"> 
                    <form method="post">
                        <input type="hidden" name="id" value="${vo.user_id }">
                        <input class ="infoUpdateBtn" type="button" value="내정보 수정" onclick="updateMyInfo(this.form)">
                    </form>
                </div>
                <div class="myPoint">
                    <form method="post">
                        <input class ="nowPointBtn" type="button" value="포인트 현황" onclick="location.href='/00_mypage/nowPoint.jsp'">
                    </form>
                </div>
                <div class="campaignBtn">
                    <div class="campaign">캠페인
                        <ui class="campaign-content">
                            <li><a href="/00_mypage/campaign_ing.jsp">참여중인 캠페인</a></li>
                            <li><a href="/userctr?type=endCam.do&user_idx=${vo.user_idx }">종료된 캠페인</a></li>
                           
                        </ui>
                    </div>
                </div>
            </div>

        </div>
</body>
</html>