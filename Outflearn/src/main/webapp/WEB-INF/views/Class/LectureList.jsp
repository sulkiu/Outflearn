<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Outflearn</title>

<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/css/LectureList.css">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet ================================================== -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

</head>
<script type="text/javascript">
	function list(page,data) {
		location.href = "LectureList?page="+page+"&searchOption="${map.searchOption} + "&txt_search=" + $('input#txt_search').val() + "&class_category="${class_category}";
	}

</script>
<body>

	<jsp:include page="../header/LectureListHeader.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<aside class="col-sm-2">
				<div id="side_category">
					<ul class="nav flex-column text-center">
						<li class="nav-item side_menu"><a href="void:0"
							class="nav-link active" data-toggle="dropdown">카테고리</a></li>
						<li class="nav-item all_category"><a href="void:0"
							id="side_server" class="nav-link active">서버&nbsp;<i
								class="fas fa-chevron-right"></i></a>
							<ul id="side_server_menu" class="nav flex-column collapse">
								<li><a href="void:0" class="nav-link active">BackEnd<input
										type="hidden" name="" value="backend"></a></li>
								<li><a href="void:0" class="nav-link active">Linux</a></li>
								<li><a href="void:0" class="nav-link active">Nodejs</a></li>
								<li><a href="void:0" class="nav-link active">Express</a></li>
								<li><a href="void:0" class="nav-link active">C#</a></li>
								<li><a href="void:0" class="nav-link active">MYSQL</a></li>
							</ul></li>
						<li class="nav-item all_category"><a href="void:0"
							id="side_web" class="nav-link active">웹 개발&nbsp;<i
								class="fas fa-chevron-right"></i></a>
							<ul id="side_web_menu" class="nav flex-column collapse">
								<li><a href="void:0" class="nav-link active">html/css</a></li>
								<li><a href="void:0" class="nav-link active">FrontEnd</a></li>
								<li><a href="void:0" class="nav-link active">Javascript</a></li>
								<li><a href="void:0" class="nav-link active">Spring</a></li>
								<li><a href="LectureList?class_category=카테고리2"
									class="nav-link active">Java</a></li>
								<li><a href="void:0" class="nav-link active">Vuejs</a></li>
							</ul></li>
						<li class="nav-item all_category"><a href="void:0"
							id="side_db" class="nav-link active">데이터베이스&nbsp;<i
								class="fas fa-chevron-right"></i></a>
							<ul id="side_db_menu" class="nav flex-column collapse">
								<li><a href="void:0" class="nav-link active">MYSQL</a></li>
								<li><a href="void:0" class="nav-link active">MONGODB</a></li>
								<li><a href="void:0" class="nav-link active">PL/SQL</a></li>
							</ul></li>
					</ul>
				</div>
				<div id="side_checkbox">
					<ul class="nav flex-column text-center" style="clear: both">
						<li class="lg_category nav-item text-left"><a href="void:0"
							id="level_btn" class="nav-link active text-left">난이도&nbsp;<i
								class="fas fa-chevron-down"></i></a>
							<div id="level" class="collapse">
								<div class="sm_category">
									<input id="begin" type="checkbox"><label for="begin">초급</label>
								</div>
								<div class="sm_category">
									<input id="intermediate" type="checkbox"><label
										for="intermediate">중급</label>
								</div>
								<div class="sm_category">
									<input id="advanced" type="checkbox"><label
										for="advanced">고급</label>
								</div>
							</div></li>
						<li class="lg_category nav-item text-left"><a href="void:0"
							id="charged_btn" class="nav-link active">유료/무료&nbsp;<i
								class="fas fa-chevron-down"></i></a>
							<div id="charged" class="collapse">
								<div class="sm_category">
									<input id="pay" type="checkbox"><label for="pay">유료</label>
								</div>
								<div class="sm_category">
									<input id="free" type="checkbox"><label for="free">무료</label>
								</div>
							</div></li>
					</ul>
				</div>
			</aside>
			<div class="col-sm-10">
				<div class="page-header">
					<h1 id="page-header-content">전체 카테고리</h1>
					<p class="input-group col-sm-4 pull-right">
						<form name="form1" method="post" action="${pageContext.request.contextPath}/LectureList">
						<select name="searchOption" id="searchOption">
							<!-- 검색 조건을 검색 처리 후 결과화면에 보여주기 위해 c:out 출력태그 사용, 삼항연산자.-->
							<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름</option>
							<option value="class_author" <c:out value="${map.searchOption == 'class_author'?'selected':'' }"/>>이름</option>
							<option value="class_title" <c:out value="${map.searchOption == 'class_title'?'selected':''}"/>>제목</option>
						</select> 
						
						<input type="text" class="form-control" name="txt_search" id="txt_search" placeholder="검색하기">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">검색</button>
						</span>
					</form>	
						
					</p>
				</div>
				<article>
					<div class="page-body">
						<span>
							<h2>
								지식 카테고리
								<div class="list-group pull-right">
									<select>
										<option>추천순</option>
										<option>평점순</option>
										<option>학생수순</option>
									</select>
								</div>
							</h2>
						</span>
						<div>
							<span class="label label-default">Python</span>
						</div>
						<c:choose>
							<c:when test="${empty classinfo }">
								<h3>강좌 정보가 없습니다...!!</h3>
									<input type="button" value="강의 추가" onclick="location.href='ClassInfoInsertForm'" />
							</c:when>
							<c:otherwise>
								<c:forEach items="${classinfo }" var="dto">
									<div class="card">
										<div>
											<a href="LectureDetail?class_num=${dto.class_num }"> <img
												class="card-img-top" src="${pageContext.request.contextPath }/resources/uploadImage/${dto.class_img }"
												alt="Card image cap">
												<div class="card-body">
													<h5 class="card-title">${dto.class_title }</h5>
													<p class="card-text">${dto.class_intro }</p>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>
								<input type="button" value="강의 추가"
									onclick="location.href='ClassInfoInsertForm'" />
							</c:otherwise>
						</c:choose>

			
					
				</article>
			</div>
		</div>
	</div>
				<!-- Pagination -->
			<div class="form-group form-inline" >
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
	<!-- ==================== FOOTER ==================== -->

	<jsp:include page="../footer/Footer.jsp"></jsp:include>

	<script type="text/javascript"
		src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript"
		src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript"
		src="resources/js/template/LectureList.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>

</html>