<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title><tiles:getAsString name="title"/></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  .banners{
    position: relative;
    background-image: url(./img/banners.jpg);                                                               
    height: 15vh;  
    background-size: cover;  
  
  }
  
  .banner {
    position: relative;
    background-image: url(./img/banner_main.jpg);                                                               
    height: 15vh;  
    background-size: cover;
}
  
 .img-cover{
   position: absolute;
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.4);                                                                 

   z-index:1;
}
 .banner .content .banners{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   

     font-size:1rem;
     color: black;
     z-index: 2;
     text-align: center;
}
  
  
  
  </style>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <tiles:insertAttribute name="header"/>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="<%=request.getContextPath() %>/img/main1.jpg" alt="Image" style="height:450px" >    
      </div>

      <div class="item">
        <img src="<%=request.getContextPath() %>/img/main2.jpg" alt="Image" style="height:450px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <h3>최신 차량</h3><br>
  <div class="row">
    <div class="col-sm-4">
    <c:choose>
    	<c:when test="${logon != null}">
      <a href="/reserve/${car[0].NO}"><img src="/imgCar/${car[0].IMG}" class="img-responsive needLogin" style="width:100%" alt="Image"></a>
    	</c:when>
    	<c:otherwise>
      <a href="/info?type=소형"><img src="/imgCar/${car[0].IMG}" class="img-responsive" style="width:100%" alt="Image"></a>
    	</c:otherwise>
    </c:choose>      
      <p>${car[0].CNAME }</p>
    </div>
    <div class="col-sm-4"> 
    <c:choose>
    	<c:when test="${logon != null}">
      <a href="/reserve/${car[1].NO}"><img src="/imgCar/${car[1].IMG}" class="img-responsive needLogin" style="width:100%" alt="Image"></a>
    	</c:when>
    	<c:otherwise>
      <a href="/info?type=소형"><img src="/imgCar/${car[1].IMG}" class="img-responsive" style="width:100%" alt="Image"></a>
    	</c:otherwise>
    </c:choose>
      <p>${car[1].CNAME }</p>    
    </div>
    
    <div class="col-sm-4">
    
     <div class="banners">
        <div class="content" style="vertical-align: middle;">  
            <br/> <b>보험유의사항</b>	<br/>
            <small>고객의 안전을 최우선으로 생각합니다. <br>이용전 반드시 확인하세요!</small><br>
             <small><a href="/service/indemnity" style="text-decoration: none;">상세보기</a></small>
        </div>
        <div class="banner-cover"></div>
    </div>
</div>

    <div class="col-sm-4">
    
      <div class="banner">
        <div class="content">
            <h4><b style="background-color: white;">공지사항</b></h4>
             <p style="background-color: white;"><b>현재 진행중인 이벤트를 확인하세요!</b></p>
             <a href="/customer/notice" style="text-decoration: none;">CLICK!</a>
      	</div>
      	
     </div>
     
        <div class="banner-cover"></div>
    </div>      
      
    </div>
    
  </div>
<br>

<footer class="container-fluid text-center">
  <tiles:insertAttribute name="footer"/>
</footer>

</body>
</html>
