<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<!-- include libraries(jQuery, bootstrap) -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<jsp:include page="../header/LectureListHeader.jsp"></jsp:include>

	<div class="jumbotron">
		<div id="jumbo_row" class="row">
			<img src="${pageContext.request.contextPath }/resources/uploadImage/${classinfo.class_img }" alt="썸네일" class="col-md-3">
			<div class="col-md-6 lecture-info">
				<h3>${classinfo.class_title }</h3>
				<div>
					<p id="rating-tag">
						<input type="hidden" id="rating" value="${classinfo.class_rating }">(수강평)
					</p>
					<p id="count-tag">수강생 : ${classinfo.class_subcount }</p>
<!-- 					<div class="progress"> -->
<!-- 						<div class="progress-bar" role="progressbar" aria-valuenow="2" -->
<!-- 							aria-valuemin="0" aria-valuemax="100" -->
<!-- 							style="min-width: 2em; width: 2%;">2%</div> -->
<!-- 					</div> -->
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
						<form:form action="basket" method="post">
							<input type="hidden" name="class_num" value="${class_num }">
							<input type="submit" value="장바구니 담기" class="btn-group btn-group-vertical btns" >
						</form:form>
					</div>
			
					
					<div id="course_info">
						<div id="instructor_profile" class="text-center">${classinfo.class_author }</div>
						<div id="course_metas">
							<p class="profile-border">
								평생 <span class="pull-right"> <i class="far fa-calendar-alt"></i></span>
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
				<li class="nav-item ">
					<a class="nav-link selected" href="#dashboard">대쉬보드</a>
				</li>
				<li class="nav-item ">
					<a class="nav-link" href="#LectureIntroduce">강좌소개</a>
				</li>
				<li class="nav-item ">
					<a class="nav-link" href="#review">수강후기</a>
				</li>
				<li class="nav-item ">
					<a class="nav-link" href="#Question">질문&답변</a>
				</li>
			</ul>
		</nav>
	</div>
	
	<div id="page-switch" class="nav-page">
		<!-- 대쉬보드 -->
		<input type="hidden" id="intro-content" value="${classIntroduce.class_content }">
		<div id="dashboard" class="container pull-left">
			<div id="dashboard-list" class="row">
				<div class="col-sm-5 col-md-5 panel panel-default">
					<h3>수강후기</h3>
					<table class="table">
						<c:choose>
							<c:when test="${empty ReviewList }">
								<tr>
									<td colspan="3" align="center">====작성된 리뷰가 없습니다.====</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${ReviewList}" var="dto">
									<tr>
										<td>
											<input type="hidden" class="review-star" value="${dto.user_star }">
											<h4 class="show-star"></h4>
										</td>
										<td>
											<h4>${user_nickname }</h4>
										</td>
										<td>
											<h4>${dto.review_content }</h4>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div class="col-sm-5 col-md-5 panel panel-default">
					<h3>질문사항</h3>
					<table class="table">
						<c:choose>
							<c:when test="${empty QAList }">
								<tr>
									<td colspan="3" align="center">====작성된 질문이 없습니다.====</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${QAList}" var="dto">
									<tr class="QA-SelectOne" onclick="location.href='QASelectOne?qa_num=${dto.qa_num }&qa_group_no=${dto.qa_group_no }'">
										<td><h4 class="icon"></h4></td>
										<td>
											<h4>${dto.qa_title }</h4>
										</td>
										<td>
											<h4>${user_nickname }</h4>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div id="playlist"></div>
		</div>

		<!-- 강좌소개 -->
		<div id="LectureIntroduce" class="nav-page">
			<div class="panel panel-default">
				<h1>강좌 소개</h1>
				<div class="form-group">
					<p>
						${classIntroduce.class_content }
					</p>
				</div>
			</div>
		</div>

		<!-- 리뷰 -->
		<div id="review" class="nav-page">
			<div class="panel panel-default">
				<h1>수강 후기</h1>
				<div>
					<c:choose>
						<c:when test="${empty classReview }">
								<div>=======작성된 글이 없습니다=======</div>
						</c:when>
						<c:otherwise>
							<div class="form-group row panel container review-container">
								<c:forEach items="${classReview }" var="dto">
									<c:choose>
										<c:when test="${dto.review_titletab eq '0'}">
											<div class="row panel">
											<div class="col-sm-1 col-md-1"></div>
											<div class="row">
												<div class="row">
													<div class="form-group col-sm-2 col-md-3 reviews_rating"><input type="hidden" class="review_rating" value="${dto.user_star  }"></div>
													<div class="col-sm-3 col-md-3 user_name">${user_nickname }</div>
												</div>
												<div class="col-sm-4 col-md-4"></div>
												<div id="c" class="col-sm-3 col-md-3">
													<div class="form-group">${dto.review_content }</div>
												</div>
											</div>
											<div align="right" id="answerOfAnswer${dto.review_num  }" class="row btn-rows">
												<div class="col-sm-2 col-md-2 pull-right"></div>
												<div class="col-sm-3 col-md-3 pull-right">
													<form:form action="LectureDetailAnswerDelete" method="post">
														<input type="hidden" name="class_num" value="${classinfo.class_num }">
														<input type="hidden" name="review_num" value="${dto.review_num }">
														<input type="submit" class="btn btn-default pull-right" value="삭제">
													</form:form>
													<input type="hidden" name="review_content" value="${dto.review_content }"> 
													<input type="hidden" name="review_num" value="${dto.review_num }">
													<button type="button" class="btn btn-default pull-right" id="b">수정</button>
													<form:form action="ReplyForm" method="post">
														<input type="hidden" name="review_num" value="${dto.review_num }">
														<input type="hidden" name="class_num" value="${classinfo.class_num }">
														<input type="hidden" name="user_star" value="${dto.user_star }">
														<button type="button" class="btn btn-default ReviewReply pull-right">답글</button>
													</form:form>
												</div>
											</div>
											<div class="container reply-div row">
												
													<form:form action="Reply" method="post">
														<input type="hidden" name="class_num" value="${dto.class_num }">
														<input type="hidden" name="user_num" value='<sec:authentication property="principal.user_num"/>'>
														<input type="hidden" name="review_num" value="${dto.review_num }">
														<input type="hidden" name="review_groupno" value="${dto.review_groupno }">
														<input type="hidden" name="review_groupsq" value="${dto.review_groupsq }">
														<div class="row">
															<textarea class="summernote" name="review_content"></textarea>
															<div class="col-sm-2 col-md-2 pull-right">
																<input type="submit" class="btn btn-default" value="작 성">
															</div>
														</div>
													</form:form>
											</div>
										</div>
										</c:when>
										<c:otherwise>
											<tr>
												<td></td>
												<td>
													<div class="form-group">${user_nickname }</div>
												</td>
												<td id="c">
													<div class="form-group">${dto.review_content }</div>
												</td>
											</tr>
											<tr align="right" id="answerOfAnswer${dto.review_num  }">
												<td>
													<form:form action="LectureDetailAnswerDelete" method="post">
														<input type="hidden" name="class_num" value="${classinfo.class_num }">
														<input type="hidden" name="review_num" value="${dto.review_num }">
														<input type="submit" class="btn btn-default" value="삭제">
													</form:form>
												</td>
												<td id="a">
													<input type="hidden" name="review_content" value="${dto.review_content }"> 
													<input type="hidden" name="review_num" value="${dto.review_num }">
													<button type="button" class="btn btn-default" id="b">수정</button>
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
									<tr class="row reply_group">
										<td colspan="3" class="reply_content col-sm-10 col-md-10">
											<c:choose>
												<c:when test="${empty ReviewReply }">
													<form:form action="Reply" method="post">
														<input type="hidden" name="class_num" value="${dto.class_num }">
														<input type="hidden" name="user_num" value='<sec:authentication property="principal.user_num"/>'>
														<input type="hidden" name="review_num" value="${dto.review_num }">
														<input type="hidden" name="review_groupno" value="${dto.review_groupno }">
														<input type="hidden" name="review_groupsq" value="${dto.review_groupsq }">
														<div class="row review-reply-btn">
															<div class="col-sm-8 col-md-8">
																<textarea name="review_content" cols="30" rows="10"></textarea>
															</div>
															<div class="col-sm-2 col-md-2">
																<input type="submit" class="btn btn-default" value="작 성">
															</div>
														</div>
													</form:form>
												</c:when>

												<c:otherwise>
													<div class="row">
														<div class="col-sm-10 col-md-10">${ReviewReply.review_content }</div>
													</div>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<section>
				<div class="form-group">
					<form:form action="LectureDetailAnswerForm">
						<input type="hidden" name="class_num" value="${classinfo.class_num }">
						<td><input type="submit" value="댓글쓰기" /></td>
					</form:form>
				</div>
			</section>
		</div>
		
		<!-- 질문답변 -->
		<div id="Question" class="nav-page">
			<div>
				<h1>질문</h1>
				<p><button id="Question-btn" class="btn btn-danger">질문작성</button></p>
				<p class="input-group pull-right">
						<input type="text" class="form-control" placeholder="검색하기">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">검색</button>
						</span>
					</p>
					<c:choose>
						<c:when test="${empty classQuestion }">
							<h2>=======작성된 글이 없습니다=======</h2>
						</c:when>

						<c:otherwise>
							<div class="form-group">
								<c:forEach items="${classQuestion }" var="dto">
									<div class="panel student_question_panel">
										<div id="question_content" class="form-group">
											<p class="question_title"><h3>${dto.qa_title } ${user_nickname }</h3></p>
											<p>${dto.qa_content }</p>
											<a class="question_detail_link" href="QASelectOne?qa_num=${dto.qa_num }&qa_group_no=${dto.qa_group_no }" aria-labe="여기로 이동"></a>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="ReviewForm" role="dialog">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form:form action="QuestionInsert">
						<input type="hidden" name="class_num" value="${classinfo.class_num }">
						<input type="hidden" name="user_num" value='<sec:authentication property="principal.user_num"/>'>
						<input type="hidden" name="user_nickname" value='<sec:authentication property="principal.user_nickname"/>'>
						<p><input type="text" placeholder="제목을 입력해주세요." name="qa_title" class="form-control"></p>
						<p><textarea rows="20" cols="60" name="qa_content"></textarea></p>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-default">작성</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="QuestionForm" role="dialog">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form:form action="QuestionInsert">
						<input type="hidden" name="class_num" value="${classinfo.class_num }">
						<input type="hidden" name="user_num" value='<sec:authentication property="principal.user_num"/>'>
						<input type="hidden" name="user_nickname" value='<sec:authentication property="principal.user_nickname"/>'>
						<p><input type="text" placeholder="제목을 입력해주세요." name="qa_title" class="form-control"></p>
						<p><textarea rows="20" cols="60" name="qa_content"></textarea></p>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-default">작성</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer/Footer.jsp"></jsp:include>


	<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/detail.js"></script>
	<script type="text/javascript" src="resources/js/ClassReview.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
</body>

</html>