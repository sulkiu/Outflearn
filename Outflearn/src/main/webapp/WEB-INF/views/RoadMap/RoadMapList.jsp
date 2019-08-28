<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Outflearn</title>

<!-- css -->
<link rel="stylesheet" href="resources/css/LectureList.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style type="text/css">
.container{
margin-top: 2%;

}
.social_item{
float: left;
}
</style>
</head>

<script type="text/javascript">
function PageMove(page,data) {
    location.href = "RoadMap?page="+page+"&txt_search=" + $('input#txt_search').val() + "&searchOption=" + $('#searchOption').val();
 }

</script>
<body>
	
	<!-- Header  -->
	<jsp:include page="../header/MainHeader.jsp"></jsp:include>
	<!-- Header  -->
	<!-- 베너 -->
	
		<div class="container">		
		<div class="row">
			<aside class="col-sm-2">
				 <div class="form-group">
					 <select class="form-control" id="exampleSelect1">
						<option>학생수순</option>
						<option>추천순</option>
						<option>공유순</option>
					</select>
				</div>	
				<div id="side_checkbox">
					<ul class="nav flex-column text-center" style="clear: both">
						<li class="lg_category nav-item text-left"><a href="void:0" id="level_btn" class="nav-link active text-left">분야별&nbsp;<i class="fas fa-chevron-down"></i></a>
							<div id="level" class="collapse">
								<c:forEach items="${mainList }" var="mainDto">
									<div class="sm_category">
										<input id="mainNum_${mainDto.main_num }" type="checkbox" value="${mainDto.main_num }"><label for="mainNum_${mainDto.main_num }">${mainDto.main_name }</label>
									</div>									
								</c:forEach>

							</div>
							</li>
							<li class="lg_category nav-item text-left"><a href="void:0" id="charged_btn" class="nav-link active">로드맵&nbsp;<i class="fas fa-chevron-down"></i></a>
							<div id="charged" class="collapse">
								<div class="sm_category">
									<input id="pay" type="checkbox"><label for="pay">미참여 로드맵</label>
								</div>
								<div class="sm_category">
									<input id="free" type="checkbox"><label for="free">참여 로드맵</label>
								</div>
							</div>							
							</li>
					    </ul>
					</div>
					<div style="text-align: center; margin-top: 3%;">
					   <a href="" class="filter_reset">
					   <i class="far fa-times-circle"></i>
					   <span>필터초기화</span>   
					   </a>
					 </div>  
				</aside>
				
			<div class="col-sm-10">
				<div class="page-header">
					<h1 id="page-header-content">전체 카테고리</h1>
					<p class="input-group col-sm-4 pull-right">
					<div class="form-group row justify-content-center">
						<div class="w100" style="padding-right:10px">
							<select class="form-control form-control-sm" name="searchOption" id="searchOption">
								<option value="all">전체</option>
								<option value="roadmap_title">제목</option>
								<option value="roadmap_author">작성자</option>
							</select>
						</div>
						<div class="w300" style="padding-right:10px">
							<input type="text" class="form-control form-control-sm" name="txt_search" id="txt_search" value="${txt_search }" placeholder="검색하기">
						</div>
						<div>
							<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch" onclick="javascript:PageMove(${pagination.pageNo});">검색</button>
						</div>
					</div>
						
		
				</div>
				<article>
					<div class="page-body">

						<c:choose>
							<c:when test="${empty comList }">
								<h3>강좌 정보가 없습니다...!!</h3>
							</c:when>
							<c:otherwise>
								<c:forEach items="${ comList }" var="roadDto">
									<div class="card">
										<a class="hidden_link" href="roadMapDetail?roadNum=${roadDto.roadmap_num }">
										<div class="content_area">
											<div class="upper_content">
												<h3>${roadDto.roadmap_title }</h3>
											</div>
											<br/><br/><br/><br/><br/><br/><br/><br/><br/>
											<div class="bottom_content">
												<p>by ${roadDto.user_nickname }</p>
												<div class="social_item">
													<div class="social_item">
														<i class="fas fa-user"></i>
														<span class="social_cnt">${roadDto.roadmap_subscribe }</span>&nbsp;&nbsp;
													</div>

													<div class="social_item">
														<i class="fas fa-share-alt"></i>
														<span class="social_cnt">${roadDto.roadmap_share }</span>
													</div>																										
												</div>
											</div>
										</div></a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</div>					
				</article>
			</div>
		</div>
	</div>
	
	
	<!-- Pagination -->
			<div class="text-center form-group form-inline" >
				<a href="javascript:PageMove(${pagination.firstPageNo})"
					class="button previous">&laquo;</a> <a
					href="javascript:PageMove(${pagination.prevPageNo})"
					class="button previous">&lt;</a>
				<div class="pages">
					<c:forEach var="i" begin="${pagination.startPageNo}" end="${pagination.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq pagination.pageNo}">
								<a href="javascript:PageMove(${i})" class="active">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:PageMove(${i})">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<a href="javascript:PageMove(${pagination.nextPageNo})"
					class="button_next">&gt;</a> <a
					href="javascript:PageMove(${pagination.finalPageNo})"
					class="button_next">&raquo;</a>
			</div>
   <!--footer  -->
		<jsp:include page="../footer/Footer.jsp"></jsp:include>
	

	<script type="text/javascript" src="resources/js/template/LectureList.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
   
</body>
</html>