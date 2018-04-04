<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 #map {
   width: 300px;
   height: 400px;
   background-color: grey;
   float:left;
   margin:10px;
   margin-bottom: 50px;
 }
</style>
<h2 style="color:red;"><b>오시는 길</b></h2>

<hr/>
<div id="map">
<script>
      function initMap() {
        var home = {lat: 37.566296, lng: 126.977945};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: home
        });
        var marker = new google.maps.Marker({
          position: home,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWsZvnZtBBPJgSjIT8JmruDVcg2_9j1Ks&callback=initMap">
    </script>
</div>

    <div class="panel panel-info" style="margin-left: 400px; height: 200px;">
      <div class="panel-heading" style="text-align: center;"><b>위&nbsp;치&nbsp;안&nbsp;내</b></div>
      <div class="panel-body" style="vertical-align: middle;">
      <br/><br/>
      	주소 : 서울특별시 중구 명동 세종대로<br/>
      	전화번호 : 010-1234-1234
      </div>
    </div>
    <div class="panel panel-info"  style="margin-left: 400px;  height: 200px;">
      <div class="panel-heading"style="text-align: center;"> <b>대&nbsp;중&nbsp;교&nbsp;통&nbsp;안&nbsp;내</b></div>
      <br/><br/>
      <div class="panel-body">
      	지하철 :<span style="color:#0B0B61">&nbsp;&nbsp;<b>1호선</b></span> 시청역 <br/>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<span style="color:#0B6121"><b>2호선</b></span> 시청역 을지로입구역
      </div>
    </div>    
