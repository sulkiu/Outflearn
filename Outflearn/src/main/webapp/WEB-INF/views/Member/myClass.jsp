<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Outflearn</title>

  <!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
  <script src="https://kit.fontawesome.com/27cb20e940.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="resources/css/myPage.css">

  <!-- Bootstrap -->
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome/css/font-awesome.css">

  <!-- Stylesheet ================================================== -->
  <link rel="stylesheet" type="text/css" href="resources/css/style.css">

  <!-- Sweet Alert2 -->
  <link href='resources/js/sweetalert/sweetalert2.min.css' rel='stylesheet' />
  <script src='resources/js/sweetalert/sweetalert2.min.js'></script>

</head>

<body>

  <jsp:include page="../header/LectureListHeader.jsp"></jsp:include>

  <div class="container">

    <div class="row">

      <aside class="col-sm-2">

        <div class="side_category">
          <ul class="nav flex-column text-center">

            <li class="nav-item side_menu select">
              <a href="myPage">대시보드</a>
            </li>

            <li class="nav-item side_menu">
              <a href="void:0">내 강좌</a>
              <ul class="inner_menu">
                <sec:authorize access="hasRole('ROLE_TUTOR')">
                  <li><a href="myClass" class="selectMenu">게시한 강좌</a></li>
                </sec:authorize>
                <li><a href="listenClass">수강중인 강좌</a></li>
                <li><a href="basketSelect">장바구니</a></li>
              </ul>
            </li>

            <li class="nav-item side_menu">
              <a href="void:0">로드맵</a>
              <ul class="inner_menu">
                <sec:authorize access="hasRole('ROLE_TUTOR')">
                  <li><a href="myRoadmap">게시한 로드맵</a></li>
                </sec:authorize>
                <li><a href="subRoadmap">참여중인 로드맵</a></li>
              </ul>
            </li>

            <li class="nav-item side_menu">
              <a href="myQuestion">내 질문</a>
            </li>

            <li class="nav-item side_menu">
              <a href="void:0">설정</a>
              <ul class="inner_menu">
                <li><a href="configProfile">프로필 설정</a></li>
              </ul>
            </li>

          </ul>
        </div>

        <sec:authorize access="hasRole('ROLE_TUTOR')">
          <div class="side_category live">
            <ul class="nav flex-column text-center">
              <li class="nav-item side_menu">
                <a href="void:0">LIVE</a>
                <ul class="inner_menu">
                  <li><a class="configLiveRoom" href="void:0">방송하기</a></li>
                  <li><a id="setLiveSchedule" href="void:0">방송 스케줄</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </sec:authorize>

      </aside>

      <div class="col-sm-10">
        <div class="page-header">
          <h1 id="page-header-content">내 강좌</h1>
        </div>
        <article>
          <div class="page-body">
            <div class="row">
              <div class="col-sm-12">
                <div class="boardBox">
                  <h4 class="boxTitle">게시한 강좌</h4>
                  <table class="table table-hover table-condensed">
                    <thead>
                      <tr>
                        <th style="width: 70%">강좌</th>
                        <th style="width: 10%" class="text-center">구독</th>
                        <th style="width: 10%" class="text-center">강좌 수정</th>
                        <th style="width: 10%" class="text-right">강좌 삭제</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${empty myClass }">
                          <tr>
                            <td colspan="4" class="text-center">
                              <h5>게시한 강좌가 없습니다...ㅠㅠ</h5>
                            </td>
                          </tr>
                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${myClass }" var="item">
                            <tr>
                              <td>
                                <div class="col-sm-2 hidden-xs">
                                  <img src="${pageContext.request.contextPath }/resources/uploadImage/${item.class_img}"
                                    class="img-responsive">
                                </div>
                                <div class="col-sm-10 text-right">
                                  <h4>${item.class_title}</h4>
                                </div>
                              </td>
                              <td class="text-center">${item.class_subcount}명</td>
                              <td class="text-center"><button
                                  onclick="updateClass(${item.class_num}, '${item.class_title }')">수정</button></td>
                              <td class="text-right"><button
                                  onclick="deleteClass(${item.class_num}, '${item.class_title }')">삭제</button></td>
                            </tr>
                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                      <tr>
                        <td colspan="4" class="text-center">
                          <button onclick="location.href='ClassInfoInsertForm'">강좌 추가</button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>


          </div>
        </article>
      </div>
    </div>
  </div>
  <!-- ==================== FOOTER ==================== -->

  <jsp:include page="../footer/Footer.jsp"></jsp:include>

  <script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
  <script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
  <script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
  <script type="text/javascript" src="resources/js/utils/myPage.js"></script>
</body>

</html>