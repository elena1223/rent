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
      <a class="navbar-brand" >Rent</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="<%=uri.equals("index")?"active":""%>"><a href="<%=request.getContextPath() %>/index"><span class="glyphicon glyphicon-home"></span></a></li>
        <li class="<%=uri.equals("info")?"active":""%>"><a href="<%=request.getContextPath() %>/info?type=소형">차량정보</a></li>
        <li class="<%=uri.equals("reserve")?"active":""%> needLogin" id=""><a href="<%=request.getContextPath() %>/reserve">렌트예약</a></li>
        <li class="<%=uri.equals("service")?"active":""%>"><a href="<%=request.getContextPath() %>/service/way">이용안내</a></li>
        <li class="<%=uri.equals("customer")?"active":""%>"><a href="<%=request.getContextPath() %>/customer/qna">고객센터</a></li>
        <li class="<%=uri.equals("visit")?"active":""%>">
        <a href="<%=request.getContextPath() %>/visit">방명록</a></li>
        <c:if test="${logon!=null}">
        <li class="<%=uri.equals("mypage")?"active":""%>"><a href="<%=request.getContextPath() %>/mypage">회원정보</a></li>
        </c:if>
        <c:if test="${logon.LV==2}">
        <li class="<%=uri.equals("manager")?"active":""%>"><a href="<%=request.getContextPath() %>/manager/register">관리자페이지</a></li>
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
  <!-- Channel Plugin Scripts -->
<script>
	$(".needLogin").click(function(){
		if(${logon==null}){
			window.alert("로그인후 이용가능한 서비스입니다. 로그인페이지로 이동합니다.")
		}
	})
	
	var onws = new WebSocket("ws://${pageContext.request.serverName}/logonWs");
		
		onws.onmessage = function(rst) {
			var obj = JSON.parse(rst.data);
			switch(obj.mode) {
			case "logon":
				window.alert(obj.msg);
				location.href="/logout"
				break;
			case "message":
				window.alert("관리자부터로의 메세지 : "+obj.msg)
				break;
			}
		}
	

	


  window.channelPluginSettings = {
    "pluginKey": "2d430381-a4c9-4620-bebc-c885356f0493"
  };
  (function() {
    var node = document.createElement('div');
    node.id = 'ch-plugin';
    document.body.appendChild(node);
    var async_load = function() {
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = '//cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    };
    if (window.attachEvent) {
      window.attachEvent('onload', async_load);
    } else {
      window.addEventListener('DOMContentLoaded', async_load, false);
    }
  })();
</script>
<!-- End Channel Plugin -->  