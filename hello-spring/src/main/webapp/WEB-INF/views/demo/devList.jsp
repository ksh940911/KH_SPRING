<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Dev 목록" name="title"/>
</jsp:include>
<table class="table w-75 mx-auto">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">이름</th>
      <th scope="col">경력</th>
      <th scope="col">이메일</th>
      <th scope="col">성별</th>
      <th scope="col">개발가능언어</th>
      <th scope="col">수정 | 삭제</th>
	</tr>
	<c:forEach items="${list}" var="dev">
	<tr>
		<td scope="row">${dev.no}</td>
		<td>${dev.name}</td>
		<td>${dev.career}년</td>
		<td>${dev.email}</td>
		<td>${dev.gender}</td>
		<td>
			<c:forEach items="${dev.lang}" var="lang" varStatus="vs">
			${lang}${vs.last ? "" : ","}
			</c:forEach>
		</td>
		<td>
			<button class="btn btn-outline-secondary" onclick="updateDev(this);" data-no="${dev.no}">수정</button>
			<button class="btn btn-outline-danger" onclick="deleteDev(this)" data-no="${dev.no}">삭제</button>
		</td>
	</tr>
	</c:forEach>
</table>
<form
	name="devDelFrm" 
	action="${pageContext.request.contextPath}/demo/deleteDev.do" 
	method="POST">
	<input type="hidden" name="no" value="" />
</form>
<script>
function updateDev(btn){
	//GET /demo/updateDev.do?no=123 ---> devUpdateForm.jsp
	//POST /demo/updateDev.do ---> redirect:/demo/devList.do
	var no = $(btn).data("no");
	//console.log(btn, no);
	location.href = `${pageContext.request.contextPath}/demo/updateDev.do?no=\${no}`;
}
function deleteDev(btn){
	//POST /demo/deleteDev.do ---> redirect:/demo/devList.do
	var no = $(btn).data("no");
	if(confirm(no + "번 개발자 정보를 정말 삭제하시겠습니까?")){
		var $frm = $(document.devDelFrm);
		$frm.find("[name=no]").val(no);
		$frm.submit();
	}
}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
