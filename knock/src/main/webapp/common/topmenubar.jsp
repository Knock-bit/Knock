<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.topmenubar {
        width: 100%;
        height: 10%;
        display: flex;
        align-items: center;
        background-color: rgb(28, 126, 44);
    }
  
    .logo{
        float: left; width: 10%; height: auto;
        margin-left: 20px;
    }
    .logo img {
        width:35%;
        object-fit: cover;
    }
    .iam { 
        float: right;
        margin-left: 50px;
        color: white;
        font-size: 13px;
        }

    .iam > .iamcontent {
        float: right;
    }
    
    .introBtn, .campBtn, .openCampaignBtn, .community {
        position:relative; display: inline-block;  width:80%; width: 15%; height: 50%;
    }

    .compaign {
        color :white;
        font-size: 16px;
        font-weight: 800;
        margin-top: 10px;
    }

    .contents {
       
        display: none; 
        position:absolute;
        margin-top: -3px;
        margin-left: -30px; 
        width: 80%;
        font-weight: 400;
    }
    .contents a {text-decoration: none; }
    .contents li {   list-style:none;}
    .introBtn:hover .contents, .campBtn:hover .contents, .openCampaignBtn:hover .contents, .community:hover .contents {
        display: block;
    }


</style>
</head>
<body>
<div class="topmenubar">
        <div class="logo">
            <img src="image/knock.png">
        </div>
        <div class="introBtn">
            <div class="compaign">What is 놐놐
                <ul class="contents">
                    <li><a href="#">綠KNOCK은?</a></li>
                    <li><a href="#">또 뭐 넣지?</a></li>
                </ul>
            </div>
        </div>
        <div class="campBtn">
            <div class="compaign">캠페인
                <ul class="contents">
                    <li><a href="#">진행 중 캠페인</a></li>
                    <li><a href="#">종료된 캠페인</a></li>
                </ul>
            </div>
        </div>
        <div class="openCampaignBtn">
            <div class="compaign">캠페인 오픈하기
                <ul class="contents">
                    <li><a href="#">펀딩 중 캠페인</a></li>
                    <li><a href="#">저는 이 캠페인을 진행하고 싶어요</a></li>
                </ul>
            </div>
        </div>
        <div class="community">
            <div class="compaign">커뮤니티
                <ul class="contents">
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">QNA</a></li>
                </ul>
            </div>
        </div>
        <div class="iam">
            <div class="iamcontent">${vo.name }님 </div><br>
            <div class="iamcontent">현재 포인트 ${vo.total_point-vo.used_point }점</div>
        </div>
    </div>

</body>
</html>