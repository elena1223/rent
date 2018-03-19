<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 #map {
   width: 300px;
   height: 400px;
   background-color: grey;
   float:left;
   margin:10px;
 }
</style>
<h2 style="color:red; margin:20px"><b>오시는 길</b></h2>
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
<h2><small style="color:#2E64FE">위치안내</small></h2>
<table style="margin:10px;padding:10px;">
	<tr>
		<td style="width:60px"><b>주소</b></td>
		<td>서울특별시 중구 명동 세종대로</td>
	</tr>
	<tr>
		<td><b>전화번호</b></td>
		<td>010-1234-4321</td>
	</tr>
</table >
	<h2><small style="color:#2E64FE">대중교통안내</small></h2>
<table style="margin:10px;padding:10px;">
	<tr>
		<td style="width:50px"><b>지하철</b></td>
		<td><span style="color:#0B0B61"><b>1호선</b></span> 시청역</td>
	</tr>
	<tr>
		<td></td>
		<td><span style="color:#0B6121"><b>2호선</b></span> 시청역 을지로입구역</td>
	</tr>
</table >
