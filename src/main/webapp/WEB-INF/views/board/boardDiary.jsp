<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".plan_sub_btn").click(function () {
		
		// 제목
		var title = $("#Pl_Title").val();
		
		// 여행 날짜
		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		
		var date1 = $("#Pl_Date1").val();
		var date2 = $("#Pl_Date2").val();
		
		// 장소
		var Pl_Place = $("#Pl_Place").val();
		
		// 설명
		var Pl_Text = $("#Pl_Text").val();
		
		var date = [];
        var place = [];
        var plan_intro = [];
        var y = [];
        var x = [];
        var time = [];
		
        var isValid = true;
		
		$('.plans_box').each(function (i){
            if($(this).children().length < 1){
                alert("한개 이상의 장소를 입력해주세요.");
                isValid = false;
            }
        });
		
		if (isValid == false) {
			return false;
		}
		// 제목 유효성 검사
		if (title == '') {
			alert('제목을 입력해 주세요.');
			$("#Pl_Title").focus();
			return false;
		} 
		
		// 여행 날짜 유효성 검사
		else if (date1.value == '') {
			alert('출발 날짜를 선택해주세요.');
			$("#Pl_Date1").focus();
			return false;
		} else if (date2.value == '') {
			alert('도착 날짜를 선택해주세요.');
			$("#Pl_Date2").focus();
			return false;
		} else if (regex.test(date1) == false) {
			alert('출발 날짜를 선택해주세요.');
			$("#Pl_Date1").focus();
			return false;
		} else if (regex.test(date2) == false) {
			alert('도착 날짜를 선택해주세요.');
			$("#Pl_Date2").focus();
			return false;
		}
		
		$.ajax({
			url:"${contextPath}/board/newPlan.do",
            data:{
            	Pl_Title : title,
            	Pl_Date1 : date1,
            	Pl_Date2 : date2,
            	Pl_Place : Pl_Place,
            	Pl_Text : Pl_Text
            },
            type:"post",
            success: function (data) {
                location.href="${contextPath}/board/planboard.do";
            }
        }); // end ajax
	});
});


</script>

<style>
.layout {
	padding-top: 40px;
	width: 100%;
}

.diary_container {
	margin-top: 100px;
	width: max-content;
}

.diary_container .mapbox {
	width: 800px;
	height: 800px;
	float: left;
	border: 1px solid rgb(51, 102, 153);
}

.map {
	width: 100%;
	height: 100%;
	z-index: 0;
}

.map_search {
	border-bottom: 1px solid #757575;
	height: 40px;
	text-align: center;
}

#keyword {
	border: 2px solid #757575;
	width: 200px;
	height: 30px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	font-size: 14px;
}

.map_search .search_button {
	width: 40px;
	height: 30px;
	border: 2px solid #757575;
	background-color: white;
	color: #757575;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
}

#map_searchbox {
	border-right: 1px solid #757575;
	border-bottom: 1px solid #757575;
	width: 350px;
	height: 800px;
	position: absolute;
	overflow-y: scroll;
	background-color: rgba(255, 255, 255, 0.7);
	z-index: 1;
}

#map_searchbox_ui {
	width: 100%;
	margin: 0;
	padding: 0;
}

#map_searchbox_ui li {
	margin: 0px 0 0 0;
	border-bottom: 1px solid #757575;
	list-style: none;
	width: 100%;
	height: 80px;
	position: relative;
}

#map_searchbox_ui .markerbg {
	float: left;
	position: absolute;
	left: 15px;
	width: 36px;
	height: 37px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#map_searchbox_ui .info {
	float: right;
	width: 220px;
	height: 100%;
	position: absolute;
	left: 50px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#map_searchbox_ui h5 {
	position: absolute;
	top: 9px;
	left: 10px;
	font-size: 16px;
	font-weight: bold;
	color: blue;
	width: 210px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 210px;
}

#map_searchbox_ui span {
	position: absolute;
	left: 10px;
	bottom: 25px;
	font-size: 13px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#map_searchbox_ui .tel {
	position: absolute;
	left: 10px;
	bottom: 5px;
	font-size: 13px;
	color: green;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#map_searchbox_ui .item .marker_1 {
	background-position: 0 -10px;
}

#map_searchbox_ui .item .marker_2 {
	background-position: 0 -56px;
}

#map_searchbox_ui .item .marker_3 {
	background-position: 0 -102px
}

#map_searchbox_ui .item .marker_4 {
	background-position: 0 -148px;
}

#map_searchbox_ui .item .marker_5 {
	background-position: 0 -194px;
}

#map_searchbox_ui .item .marker_6 {
	background-position: 0 -240px;
}

#map_searchbox_ui .item .marker_7 {
	background-position: 0 -286px;
}

#map_searchbox_ui .item .marker_8 {
	background-position: 0 -332px;
}

#map_searchbox_ui .item .marker_9 {
	background-position: 0 -378px;
}

#map_searchbox_ui .item .marker_10 {
	background-position: 0 -423px;
}

#map_searchbox_ui .item .marker_11 {
	background-position: 0 -470px;
}

#map_searchbox_ui .item .marker_12 {
	background-position: 0 -516px;
}

#map_searchbox_ui .item .marker_13 {
	background-position: 0 -562px;
}

#map_searchbox_ui .item .marker_14 {
	background-position: 0 -608px;
}

#map_searchbox_ui .item .marker_15 {
	background-position: 0 -654px;
}

.placelist_div {
	position: absolute;
	right: 15px;
	top: 27px;
}

.placelist_div_button {
	width: 35px;
	height: 35px;
	border: 2px solid #777;
	border-radius: 5px;
	background-color: white;
	color: #777;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

#map_searchbox_pagination {
	height: 70px;
	text-align: center;
	margin-top: 30px;
}

#map_searchbox_pagination a {
	display: inline-block;
	margin-right: 10px;
	font-size: 16px;
}

#map_searchbox_pagination .on {
	font-weight: bolder;
	cursor: default;
	color: black;
}

#map_searchbox_pagination a, #map_searchbox_paginationp a:hover,
	#map_searchbox_pagination a:active {
	color: grey;
	text-decoration: none;
}

.diary_container .diary {
	float: left;
	padding: 0 0 0 35;
}

.diary_container .diary table {
	margin: 1px;
}

.diary_container .diary textarea {
	height: 200px;
	resize: none;
}

.plans_box {
	border: 1px solid rgb(51, 102, 153);
    height: 386px;
    overflow-y: scroll;
}

.plan_box {
	border-bottom: 1px dotted rgb(51, 102, 153);
}

.plan_num {
	text-align: center;
	margin-left: 10px;
	display: inline-block;
}

.plan_num p {
	text-align: center;
	margin: 0;
}

.plan_num .plan_num_img_navy {
	margin: 15 0 15 0;
	width: 35px;
	height: 35px;
}

.plan_num .plan_num_time {
	margin-bottom: 15px;
}

.plan_detail {
	width: 360px;
	height: 135px;
	display: inline-block;
}

.plan_detail p {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	color: blue;
	margin: 18 0 18 0;
}

.plan_detail_input_time {
	width: 155px;
	display: block;
}

.plan_detail_input_intro {
	width: 315px;
	margin-top: 10px;
}

.plan_detail_input_intro::placeholder {
	font-size: 12px;
	font-weight: bold;
	text-align: center;
}

.plan_delete_button {
	width: 28px;
	margin-top: 10px;
	margin-left: 10px;
	border-radius: 6px;
	background-color: white;
	color: grey;
	font-weight: bold
}

.button_control {
	float: right;
    margin: 10 0 60 0;
}

</style>
</head>
<body>
	<div class="layout">
		<!-- body부분 삽입-->
		<div class="diary_container">

			<!-- 키워드로 장소 검색하는 div -->
			<div id="map_searchbox">

				<div class="map_search">
					<form>
						<input type="text" value="이태원 맛집" id="keyword" size="15">
						<input class="search_button" type="button"
							onclick="searchPlaces(); return false;" value="검색">
					</form>
				</div>

				<ul id="map_searchbox_ui"></ul>

				<div id="map_searchbox_pagination"></div>
			</div>

			<div class="mapbox">
				<div class="map" id="map"></div>
			</div>

			<div class="diary">
				<form>
					<h6>제목</h6>
					<p>
						<input type="text" id="Pl_Title" name="Pl_Title">
					</p>
					<h6>여행 날짜</h6>
					<span><input type="date" id="Pl_Date1" name="Pl_Date1">
						~ <input type="date" id="Pl_Date2" name="Pl_Date2"></span> <br>
					<br>
					<h4>일정 작성</h4>
					<div class="type_box">
						<table>
							<tbody>
								<tr>
									<td style="color: white; background: gray;">장소</td>
									<td><input type="text" style="width: 400px" id="Pl_Place" name="Pl_Place"></td>
								</tr>
								<tr>
									<td style="color: white; background: gray;">설명</td>
									<td><textarea style="width: 400px" id="Pl_Text" name="Pl_Text"></textarea></td>
								</tr>
							</tbody>
						</table>
						<div class="plans_box"></div>
					</div>
					<div class="button_control">
						<button class="plan_sub_btn">등록</button>
						<a href="${contextPath}/board/planboard.do">
							<input type="button" value="취소">
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddb9fdc368e57860edb508e2c16104cb&libraries=services"></script>
	<script>
		// 지도 생성 코드
		var markers = [];
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.5536472, 126.9678003),
			level : 3
		};
		var map = new kakao.maps.Map(container, options);
		// 검색을 위한 코드 시작
		var ps = new kakao.maps.services.Places();
		// 키워드로 장소를 검색합니다
		searchPlaces();
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);
				// 페이지 번호를 표출합니다
				displayPagination(pagination);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				alert('검색 결과가 존재하지 않습니다.');
				return;
			} else if (status === kakao.maps.services.Status.ERROR) {
				alert('검색 결과 중 오류가 발생했습니다.');
				return;
			}
		}
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			var listEl = document.getElementById('map_searchbox_ui'), menuEl = document
					.getElementById('map_searchbox'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);
			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);
				fragment.appendChild(itemEl);
			}
			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';
			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}
			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';
			itemStr += '<div class="placelist_div"><button class="placelist_div_button" onclick="planInsert(\''
					+ places.place_name
					+ '\',\''
					+ places.y
					+ '\',\''
					+ places.x + '\')">+</button></div>';
			el.innerHTML = itemStr;
			el.className = 'item';
			return el;
		}
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
			return marker;
		}
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document
					.getElementById('map_searchbox_pagination'), fragment = document
					.createDocumentFragment(), i;
			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}
			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;
				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}
				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}
		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		// 장소 검색 후 추가 버튼시 발동
		function planInsert(place_name, place_y, place_x) {
			var parent = $('.plans_box');
			var num = parent.children().length; // 하위 엘리먼트기에 일정 - 제목 (DAY) 부분도 포함됨

			if (num < 5) { // 일정은 9개까지만 추가 가능
				parent.append(getHtml(place_name, place_y, place_x, num));
			} else {
				alert("일정은 최대 5개로 제한됩니다.");
			}
		}

		// 일정 추가시 일정관련 div 생성
		function getHtml(place_name, place_y, place_x, num) {
			var div = "<div class=\"plan_box\" data-y=\"" + place_y + "\" data-x=\"" + place_x + "\" data-planNo=\"\">";
			div += "<div class=\"plan_num\">";
			div += "<img src=\"${contextPath}/resources/image/plan/num" + num + ".png\" class=\"plan_num_img_navy\">";
			div += "<p class=\"plan_num_time\">시간</p>";
			div += "<p class=\"plan_num_memo\">메모</p></div>";
			div += " <div class=\"plan_detail\">";
			div += " <p class=\"plan_detail_place\" title=\"" + place_name + "\">"
					+ place_name + "</p>";
			div += "<input type=\"time\" name=\"time\" class=\"plan_detail_input_time\" required >";
			div += "<input type=\"text\" name=\"intro\" class=\"plan_detail_input_intro\" placeholder=\"20자 내로 메모를 입력해주세요.\"  maxlength=\"20\">";
			div += "<button class=\"plan_delete_button\" onclick=\"planDelete(\'"
					+ num + "\')\">&times;</button></div> </div>";

			return div;
		}

		// 일정 x버튼 클릭시 내용 삭제 후 숫자 변경 하는 함수
		function planDelete(num) {
			var parent = $('.plans_box');
			var kid = parent.children().eq(num); // 일정 부분에 제목도 자식에 포함되기에 index +1
			var next_kids = kid.nextAll();

			kid.detach();

			next_kids.each(function(index, element) {
				var url = "${contextPath}/resources/image/plan/num" + num
						+ ".png";
				$(this).find('img').attr("src", url);

				var btn = "planDelete(" + num + ")";
				$(this).find('button').attr("onclick", btn);
				++num;
			});
			return num;
		}
	</script>
</body>
</html>