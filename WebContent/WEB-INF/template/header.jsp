<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String uriArr[]=((String)request.getAttribute( "javax.servlet.forward.request_uri")).split("/");
	String uri=uriArr.length>0?uriArr[1]:"index";
%>
<div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" >메뉴</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="<%=uri.equals("index")?"active":""%>"><a href="<%=request.getContextPath() %>/index">메인</a></li>
        <li class="<%=uri.equals("info")?"active":""%>"><a href="<%=request.getContextPath() %>/info?type=소형">차량정보</a></li>
        <li class="<%=uri.equals("reserve")?"active":""%>"><a href="<%=request.getContextPath() %>/reserve">렌트예약</a></li>
        <li class="<%=uri.equals("service")?"active":""%>"><a href="<%=request.getContextPath() %>/service/way">이용안내</a></li>
        <li class="<%=uri.equals("costomer")?"active":""%>"><a href="<%=request.getContextPath() %>/costomer/qna">고객센터</a></li>
        <c:if test="${logon!=null}">
        <li class="<%=uri.equals("mypage")?"active":""%>"><a href="<%=request.getContextPath() %>/mypage" me>회원정보</a></li>
        </c:if>
        <c:if test="${logon.LV==2}">
        <li class="<%=uri.equals("manager")?"active":""%>"><a href="<%=request.getContextPath() %>/manager">관리자페이지</a></li>
        </c:if>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
      	<c:when test="${logon==null}">
        <li><a href="<%=request.getContextPath() %>/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </c:when>
        <c:otherwise>
        <li><a href="<%=request.getContextPath() %>/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </c:otherwise>
       </c:choose>
      </ul>
    </div>
    