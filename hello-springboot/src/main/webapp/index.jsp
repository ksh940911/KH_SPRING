<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu - RestAPI</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<style>
div.menu-test{width:50%; margin:0 auto; text-align:center;}
div.result{width:70%; margin:0 auto;}
</style>
</head>
<body>
<div id="container">
	<header>
		<div id="header-container">
			<h2>Menu - RestAPI</h2>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">
				<img src="${pageContext.request.contextPath }/resources/images/logo-spring.png" alt="스프링로고" width="50px" />
			</a>
		  	<!-- 반응형으로 width 줄어들경우, collapse버튼관련 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
		  	</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				
			 </div>
		</nav>
	</header>
	<section id="content">
		<div id="menu-container" class="text-center">
			<!-- 1. GET /menus-->
	        <div class="menu-test">
	            <h4>전체메뉴조회(GET)</h4>
	            <input type="button" class="btn btn-block btn-outline-success btn-send" id="btn-menus" value="전송" />
	        </div>
	        <div class="result" id="menus-result"></div>
	        <script>
			$("#btn-menus").click(() => {
				$.ajax({
					url: "${pageContext.request.contextPath}/menus",
					method: "GET",
					success(data){
						console.log(data);
						displayResultTable("menus-result", data);
					},
					error: console.log
				})
			});
	        </script>
			
			<!-- 2. GET /menus/kr  /menus/ch  /menus/jp -->
			<div class="menu-test">
				<h4>추천메뉴(GET)</h4>
				<form id="menuRecommendationFrm">
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="type" id="get-no-type" value="all" checked>
						<label for="get-no-type" class="form-check-label">모두</label>&nbsp;
						<input type="radio" class="form-check-input" name="type" id="get-kr" value="kr">
						<label for="get-kr" class="form-check-label">한식</label>&nbsp;
						<input type="radio" class="form-check-input" name="type" id="get-ch" value="ch">
						<label for="get-ch" class="form-check-label">중식</label>&nbsp;
						<input type="radio" class="form-check-input" name="type" id="get-jp" value="jp">
						<label for="get-jp" class="form-check-label">일식</label>&nbsp;
					</div>
					<br />
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="taste" id="get-no-taste" value="all" checked>
						<label for="get-no-taste" class="form-check-label">모두</label>&nbsp;
						<input type="radio" class="form-check-input" name="taste" id="get-hot" value="hot">
						<label for="get-hot" class="form-check-label">매운맛</label>&nbsp;
						<input type="radio" class="form-check-input" name="taste" id="get-mild" value="mild">
						<label for="get-mild" class="form-check-label">순한맛</label>
					</div>
					<br />
					<input type="submit" class="btn btn-block btn-outline-success btn-send" value="전송" >
				</form>
			</div>
			<div class="result" id="menuRecommendation-result"></div>
			<script>
			$("#menuRecommendationFrm").submit(e => {
				// 폼제출을 방지 : return false;
				e.preventDefault();
				
				// 현재폼
				const $frm = $(e.target);
				const type = $frm.find("[name=type]:checked").val();
				const taste = $frm.find("[name=taste]:checked").val();
				console.log(type, taste);

				$.ajax({
					url: `${pageContext.request.contextPath}/menus/\${type}/\${taste}`,
					success(data){
						console.log(data);
						displayResultTable("menuRecommendation-result", data);
					},
					error: console.log
				});
				
				
			});


			</script>
			
			    
			<!-- 2.POST /menu -->
			<div class="menu-test">
				<h4>메뉴 등록하기(POST)</h4>
				<form id="menuEnrollFrm">
					<input type="text" name="restaurant" placeholder="음식점" class="form-control" />
					<br />
					<input type="text" name="name" placeholder="메뉴" class="form-control" />
					<br />
					<input type="number" name="price" placeholder="가격" class="form-control" />
					<br />
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="type" id="post-kr" value="kr" checked>
						<label for="post-kr" class="form-check-label">한식</label>&nbsp;
						<input type="radio" class="form-check-input" name="type" id="post-ch" value="ch">
						<label for="post-ch" class="form-check-label">중식</label>&nbsp;
						<input type="radio" class="form-check-input" name="type" id="post-jp" value="jp">
						<label for="post-jp" class="form-check-label">일식</label>&nbsp;
					</div>
					<br />
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="taste" id="post-hot" value="hot" checked>
						<label for="post-hot" class="form-check-label">매운맛</label>&nbsp;
						<input type="radio" class="form-check-input" name="taste" id="post-mild" value="mild">
						<label for="post-mild" class="form-check-label">순한맛</label>
					</div>
					<br />
					<input type="submit" class="btn btn-block btn-outline-success btn-send" value="등록" >
				</form>
			</div>
			<script>
			/**
			*  POST /menu
			*/
			$("#menuEnrollFrm").submit(e => {
				e.preventDefault(); // 폼제출 방지
				const $frm = $(e.target);
				const restaurant = $frm.find("[name=restaurant]").val(); 
				const name = $frm.find("[name=name]").val(); 
				const price = Number($frm.find("[name=price]").val()); 
				const type = $frm.find("[name=type]:checked").val(); 
				const taste = $frm.find("[name=taste]:checked").val(); 

				const menu = {
					restaurant,
					name,
					price,
					type,
					taste
				};

				console.log(menu);
				$.ajax({
					url: "${pageContext.request.contextPath}/menu",
					data: JSON.stringify(menu),
					contentType: "application/json; charset=utf-8",
					method: "POST",
					success(data) {
						console.log(data);
						const {msg} = data;
						alert(msg);
					},
					error: console.log, 
					complete(){
						e.target.reset(); // 폼초기화
					} 
				});
			});
			</script>
			
			<!-- #3.PUT /menu/123 -->
			<div class="menu-test">
				<h4>메뉴 수정하기(PUT)</h4>
				<p>메뉴번호를 사용해 해당메뉴정보를 수정함.</p>
				<form id="menuSearchFrm">
					<input type="text" name="id" placeholder="메뉴번호" class="form-control" /><br />
					<input type="submit" class="btn btn-block btn-outline-primary btn-send" value="검색" >
				</form>
				<hr />
				<form id="menuUpdateFrm">
					<input type="hidden" name="id" />
					<input type="text" name="restaurant" placeholder="음식점" class="form-control" />
					<br />
					<input type="text" name="name" placeholder="메뉴" class="form-control" />
					<br />
					<input type="number" name="price" placeholder="가격" step="1000" class="form-control" />
					<br />
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="type" id="put-kr" value="kr" checked>
						<label for="put-kr" class="form-check-label">한식</label>&nbsp;
						<input type="radio" class="form-check-input" name="type" id="put-ch" value="ch">
						<label for="put-ch" class="form-check-label">중식</label>&nbsp;
						<input type="radio" class="form-check-input" name="type" id="put-jp" value="jp">
						<label for="put-jp" class="form-check-label">일식</label>&nbsp;
					</div>
					<br />
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="taste" id="put-hot" value="hot" checked>
						<label for="put-hot" class="form-check-label">매운맛</label>&nbsp;
						<input type="radio" class="form-check-input" name="taste" id="put-mild" value="mild">
						<label for="put-mild" class="form-check-label">순한맛</label>
					</div>
					<br />
					<input type="submit" class="btn btn-block btn-outline-success btn-send" value="수정" >
				</form>
			</div>
			<script>
			$("#menuUpdateFrm").submit(e => {
				e.preventDefault();
				const $frm = $(e.target);
				
				/* const menu = {
					id : $frm.find("[name=id]").val(),
					restaurant : $frm.find("[name=restaurant]").val(),
					name : $frm.find("[name=name]").val(),
					price : $frm.find("[name=price]").val(),
					type : $frm.find("[name=type]:checked").val(),
					taste : $frm.find("[name=taste]:checked").val(),
				};
				console.log(menu); */

				//formData를 활용해서 객체만들기
				const frmData = new FormData(e.target);
				const menu = {};
				frmData.forEach((value, key) => {
					menu[key] = value;
				});
				console.log(menu);
				
				$.ajax({
					url: `${pageContext.request.contextPath}/menu/\${menu.id}`,
					method: "PUT",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(menu),
					success(data){
						console.log(data);
						const {msg} = data;
						alert(msg);
					},
					error: console.log,
					complete(){
						$("#menuSearchFrm")[0].reset();
						$("#menuUpdateFrm")[0].reset();
					}
				});
				
			});

			
			$("#menuSearchFrm").submit(e => {
				e.preventDefault();

				// e.target하위의 선택자를 조회
				const id = $("[name=id]", e.target).val();
				if(!id) return;

				$.ajax({
					url: `${pageContext.request.contextPath}/menu/\${id}`,
					method: "GET",
					success(data){
						console.log(data);

						if(data){
							const $frm = $("#menuUpdateFrm");
							const {id, restaurant, name, price, type, taste} = data;
							$frm.find("[name=id]").val(id);
							$frm.find("[name=restaurant]").val(restaurant);
							$frm.find("[name=price]").val(price);
							$frm.find("[name=name]").val(name);
							$frm.find(`[name=type][value=\${type}]`).prop("checked", true);
							$frm.find(`[name=taste][value=\${taste}]`).prop("checked", true);
							
						}
						//else {
						//	alert("해당 메뉴가 존재하지 않습니다.");
						//	$("[name=id]", e.target).select();
						//}
						
					},
					error(xhr, statusText, err){
						console.log(xhr, statusText, err);

						const {status} = xhr;
						status == 404 && alert("해당 메뉴가 존재하지 않습니다.");
						$("[name=id]", e.target).select();
					}
				});
				

			});
			</script>
			
			<!-- 4. 삭제 DELETE /menu/123 -->    
			<div class="menu-test">
		    	<h4>메뉴 삭제하기(DELETE)</h4>
		    	<p>메뉴번호를 사용해 해당메뉴정보를 삭제함.</p>
		    	<form id="menuDeleteFrm">
		    		<input type="text" name="id" placeholder="메뉴번호" class="form-control" /><br />
		    		<input type="submit" class="btn btn-block btn-outline-danger btn-send" value="삭제" >
		    	</form>
		    </div>
		    <script>
			$("#menuDeleteFrm").submit(e => {
				e.preventDefault();

				const id = $("[name=id]", e.target).val();
				if(!id) return;

				$.ajax({
					url: `${pageContext.request.contextPath}/menu/\${id}`,
					method: "DELETE",
					success(data){
						console.log(data);
						const {msg} = data;
						alert(msg);
					},
					error(xhr, statusText, err){
						const {status} = xhr;
						switch(status){
							case 404: alert("해당 메뉴가 존재하지 않습니다."); break;
							default: alert("메뉴 삭제 실패!");
						}
					},
					complete(){
						$(e.target)[0].reset();
					}
				});
					
				
			});
		    </script>
			
			
		</div>
	</section>
	<footer>
		<p>&lt;Copyright 2017. <strong>KH정보교육원</strong>. All rights reserved.&gt;</p>
	</footer>
<script>
function displayResultTable(id, data){
	const $container = $("#" + id);
	let html = "<table class='table'>";
	html += "<tr><th>번호</th><th>음식점</th><th>메뉴</th><th>가격</th><th>타입</th><th>맛</th></tr>";

	//mybatis session.selectList는 데이터는 없는 경우, 빈 list를 리턴
	if(data.length > 0){
		$(data).each((i, menu) => {
			const {id, restaurant, name, price, type, taste} = menu;
			html += `
				<tr>
					<td>\${id}</td>
					<td>\${restaurant}</td>
					<td>\${name}</td>
					<td>\${price}</td>
					<td>\${type}</td>
					<td><span class="badge badge-\${taste == 'hot' ? 'danger' : 'warning'}">\${taste}</span></td>
				</tr>`;
		});
	}
	else {
		html += "<tr><td colspan='6'>검색된 결과가 없습니다.</td></tr>"
	}
	html += "</table>";
	$container.html(html);
	
}

</script>	
</div>
</body>
</html>
