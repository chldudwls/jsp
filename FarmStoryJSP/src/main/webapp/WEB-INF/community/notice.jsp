<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" href="/FarmStoryJSP/css/article.css">
	<link rel="stylesheet" href="/FarmStoryJSP/css/farmstory.css">
	
  <title>Farmstory</title>
  <style>
    main {
      height : auto;
      width: 980px;
      margin: 0 auto;
    }
    .titleEvent {
      width: 980px;
      height: 184px;
      background-image: url("../images/sub_top_bg.jpg");
      position: relative;
    }
    .titleEvent > img {
      position: absolute;
      left : 10px;
      bottom: 10px;
    }
    .mainSection {
      display: flex;
    }
    .mainAside{
      width: 176px;
      height: 650px;
      box-sizing: border-box;
      background-image: url("../images/sub_aside_bg_line.png");
      background-repeat: no-repeat;
      background-position: 169px;
    }
    .mainAside > .eventList {
      margin: 16px 16px;
    }
    .asideList {
      width: 175px;
      height: 233px;
      background-image: url("../images/sub_aside_bg_lnb.png");
      position: relative;
    }
    .asideList > li:nth-child(1){
      display: inline-block;
      margin-top: 30px;
    }
    .articleNav {
      width: 762px;
      height: 72px;
      margin-left: 40px;
      border-bottom: 1px solid #c2c2c2;
      position: relative;
    }
    .articleNav > img {
      position: absolute;
      bottom: 5px;
    }
    .articleNav > p {
      position: absolute;
      bottom: 5px;
      right: 0px;
    }
    .articleNav > p > strong {
      color : rgb(124, 165, 64)
    }
    .mainArticle > p {
      margin-left: 40px;
      margin-top: 40px;
    }
    .mainArticle {
      margin: 0 0;
      width: 802px;
      height : auto;
      box-sizing: border-box;
      
    }
  </style>
  
</head>
<body>
<%@ include file="/css/_header.jsp"%>
  
  <!-- header 끝-->



  <main>
    <div class="titleEvent"><img src="../images/sub_top_tit5.png" alt=""></div>
    <section class="mainSection">
      <aside class="mainAside">
        <img src="../images/sub_aside_cate5_tit.png" alt="Event" class="eventList">
        <ul class="asideList">
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=notice"><img src="../images/sub_cate5_lnb1_ov.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=menu"><img src="../images/sub_cate5_lnb2.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=chef"><img src="../images/sub_cate5_lnb3.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=faq"><img src="../images/sub_cate5_lnb4.png" alt=""></a></li>
          <li><a href="/FarmStoryJSP/article/list.do?group=community&cate=qna"><img src="../images/sub_cate5_lnb5.png" alt=""></a></li>
        </ul>
      </aside>

      <article class="mainArticle">
        <nav class="articleNav">
          <img src="../images/sub_nav_tit_cate5_tit1.png" alt="event">
          <p><img src="../images/sub_page_nav_ico.gif" alt="navIcon"> HOME > 커뮤니티 > <strong>공지사항</strong></p>
        </nav>
        <c:choose>
        	<c:when test="${type eq 'list'}">
        		<%@ include file="/css/_article.jsp"%>
        	</c:when>
        	<c:when test="${type eq 'view'}">
        		<section class="view">
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value="${articleDto.artTitle}" readonly/></td>
                    </tr>
                    <c:if test="${articleDto.artFile > 0}">
                    <tr>
                        <td>첨부파일</td>
                        <td>
                        <c:forEach var="file" items="${articleDto.artFiles}">
	                        <p style="margin:4px 0">
	                            <a href="/jboard/file/download.do?fno=${file.fno}">${file.oName}</a>
	                            <span>${file.download}회 다운로드</span>
	                        </p>
                        </c:forEach>
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" readonly>${articleDto.artContent}</textarea>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="#" class="btnDelete">삭제</a>
                    <a href="#" class="btnModify">수정</a>
                    <a href="/FarmStoryJSP/article/list.do?group=${group}&cate=${cate}" class="btnList">목록</a>
                </div>  
                
                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <c:forEach var="comment" items="${comments}">
	                    <article class="comment">
	                        <span>
	                            <span>${comment.comRdate}</span>
	                            <span>${comment.nick}</span>
	                        </span>
	                        <textarea name="comment" readonly>${comment.comContent}</textarea>
	                        
	                        <c:if test="${sessUser.uid eq comment.comWriter}">
		                        <div>
		                        	<!-- HTML 사용자 정의 속성을 이용한 삭제/수정 -->
		                            <a href="#" class="commentRemove" data-no="${comment.comNo}">삭제</a>
		                            <a href="#" class="commentCancel" data-no="${comment.comNo}">취소</a><!-- style.css 364라인 display: none; 처리하기 -->
		                            <a href="#" class="commentModify" data-no="${comment.comNo}">수정</a>
		                        </div>
	                        </c:if>
	                    </article>
                    </c:forEach>
                    <c:if test="${empty comments}">
	                    <p class="empty">등록된 댓글이 없습니다.</p>
                    </c:if>
                </section>
    
                <!-- 댓글입력폼 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form name="commentForm">
                    	<input type="hidden" name="parent" value="${articleDto.artNo}"/>
                    	<input type="hidden" name="writer" value="${sessUser.uid}"/>
                        <textarea name="comment"></textarea>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료"/>
                        </div>
                    </form>
                </section>
    
            </section>
        	</c:when>
        </c:choose>
        
      </article>
    </section>
  </main>


  
  <!-- footer 시작 -->
<%@ include file="/css/_footer.jsp"%>
</body>
</html>