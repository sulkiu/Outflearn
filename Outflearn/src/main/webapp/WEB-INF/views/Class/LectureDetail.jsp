<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Outflearn</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/detail.css">

	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">

	<!-- Stylesheet
    ================================================== -->
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">

	<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
		integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">


</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<jsp:include page="../header/LectureListHeader.jsp"></jsp:include>

	<div class="jumbotron">
		<div id="jumbo_row" class="row">
			<img src="resources/img/cardpx.svg" alt="썸네일" class="col-md-3">
			<div class="col-md-6">
				<h3>${classinfo.class_title }</h3>
				<div>
					<p id="rating-tag"><input type="hidden" id="rating" value="${classinfo.class_rating }">(수강평)</p>
					<p id="count-tag">수강생 : ${classinfo.class_subcount }</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="2" aria-valuemin="0"
							aria-valuemax="100" style="min-width: 2em; width: 2%;">2%</div>
					</div>
				</div>
			</div>
			<div id="study_btn" class="col-md-3">
				<p class="text-center" align="center">
					<a href="void:0" class="btn btn-success btn-lg" role="button">학습하기</a>
				</p>
				<div id="box">
					<div id="course">
						<h4>${classinfo.class_price }원</h4>
						<button type="button" class="btn-group btn-group-vertical btns">바로
							수강신청</button>
						<button type="button" class="btn-group btn-group-vertical btns">장바구니
							담기</button>
					</div>
					<div id="course_info">
						<div id="instructor_profile" class="text-center">${classinfo.class_author }</div>
						<div id="course_metas">
							<p class="profile-border">
								평생 <span class="pull-right"><i class="far fa-calendar-alt"></i></span>
							</p>
							<p class="profile-border">${classinfo.class_studentlevel }
								<span><i class="fab fa-leanpub pull-right"></i></span>
							</p>
							<p class="profile-border">
								<span id="count"></span>
								<span><i class="fas fa-book-open pull-right"></i></span>
							</p>
							<p class="profile-border">
								<span id="timer"></span>
								<span><i class="fas fa-hourglass-half pull-right"></i></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="main" class="container pull-left">
		<nav class="nav">
			<ul class="nav nav-tabs">
				<li class="nav-item "><a class="nav-link" href="void:0">대쉬보드</a></li>
				<li class="nav-item "><a class="nav-link" href="void:0">강좌소개</a></li>
				<li class="nav-item "><a class="nav-link" href="void:0">수강후기</a></li>
				<li class="nav-item "><a class="nav-link" href="void:0">질문&답변</a></li>
				<li class="nav-item "><a class="nav-link" href="void:0">새소식</a>
				</li>
			</ul>
		</nav>
	</div>
	<hr />

	
	<!-- 댓글 -->
	<div class="panel panel-default">
		<h1>글 목록</h1>
		<table>
			<c:choose>
				<c:when test="${empty classReview }">
					<tr>
						<td colspan="4" align="center">=======작성된 글이 없습니다=======</td>
					</tr>
				</c:when>

				<c:otherwise>
					<div class="form-group">
						<c:forEach items="${classReview }" var="dto">

							<tr>
								<td>
									<div class="form-group">${dto.user_star  }
											${user_nickname }
										</div>
								</td>
								<td>
									<c:forEach begin="1" end="${dto.qa_titletab }">
										&nbsp;
									</c:forEach>
								</td>
							</tr>
							<tr align="right" id="answerOfAnswer${dto.review_num  }"  >
							<td id="c${dto.review_num }">
									${dto.review_content }
								</td>
								<td>
									<form:form action="LectureDetailAnswerDelete" method="post">
										<input type="hidden" name="class_num" value="${classinfo.class_num }">
										<input type="hidden" name="review_num"  value="${dto.review_num }">
										<input type="submit" value="삭제">
									</form:form>
								</td>
								<td id="a">
									<input type="hidden" name="review_content" value="${dto.review_content }"> 
									<input type="hidden" name="review_num" value="${dto.review_num }">
									<button type="button" id="b">수정</button>
								</td>
								<td>
									<form:form action="ReplyForm" method="post">
										<input type="hidden" name="review_num" value="${dto.review_num }">
										<input type="hidden" name="class_num" value="${classinfo.class_num }">
										<input type="hidden" name="user_star" value="${dto.user_star }">
										<input type="submit" value="답글" />
									</form:form>
								</td>
							</tr>
						</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>

	<section>
		<div class="form-group">
			<form:form action="LectureDetailAnswerForm">
				<input type="hidden" name="class_num" value="${classinfo.class_num }">
				<td><input type="submit" value="댓글쓰기" /></td>
			</form:form>
		</div>
	</section>


	<div id="page-switch" class="container pull-left">
		<input type="hidden" id="selectone" value="${classinfo.class_num }">
	</div>


	<jsp:include page="../footer/Footer.jsp"></jsp:include>


	<script type="text/javascript" src="resources/js/ClassReview.js"></script>
	<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
	<script type="text/javascript" src="resources/js/template/detail.js"></script>
</body>

</html>