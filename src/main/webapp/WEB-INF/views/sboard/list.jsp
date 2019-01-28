<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>


</script>

<%@include file="../include/header.jsp" %>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">LIST ALL PAGE</h3>
					</div>
					<div class="box-body">
						<div style="margin-top: 10px;">
							<select name="searchType">
							
								<option value="n"
									<c:out value="${ cri.searchType == null ? 'selected':'' }" />>
									---</option><!-- 검색 조건 없음 -->
								<option value="t"
									<c:out value="${ cri.searchType eq 't' ? 'selected':'' }" />>
									Title</option><!-- 제목으로 검색 -->
								<option value="c"
									<c:out value="${ cri.searchType eq 'c' ? 'selected':'' }" />>
									Content</option><!-- 내용으로 검색 -->
								<option value="w"
									<c:out value="${ cri.searchType eq 'w' ? 'selected':'' }" />>
									Writer</option><!-- 작성자로 검색 -->
								<option value="tc"
									<c:out value="${ cri.searchType eq 'tc' ? 'selected':'' }" />>
									Title or Content</option><!-- 제목이나 내용으로 검색 -->
								<option value="cw"
									<c:out value="${ cri.searchType eq 'cw' ? 'selected':'' }" />>
									Content or Writer</option><!-- 내용이나 작성자로 검색 -->
								<option value="tcw"
									<c:out value="${ cri.searchType eq 'tcw' ? 'selected':'' }" />>
									Title or Content or Writer</option><!-- 제목이나 내용 혹은 작성자로 검색 -->
			
							</select>
						
							<input type="text" name="keyword" id="keywordInput" value="${ cri.keyword }">
							<button id = "searchBtn">Search</button>
							<button id = "newBtn">New Board</button>
							<hr>
							</div>
					
						<table class="table table-bordered">
					 		<tr>
					   			<th style="width:10px">BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th style="width:40px">VIEWCNT</th>	
							</tr>
					
						<c:forEach items="${list}" var="boardVO">
							<tr>
								<td>${boardVO.bno}</td>
								<td><a href='/sboard/readPage${ pageMaker.makeSearch(pageMaker.cri.page) 
										}&bno=	${boardVO.bno}'>
												${boardVO.title}<strong>&nbsp;(&nbsp;${boardVO.replycnt }&nbsp;)&nbsp;</strong>
												</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></td>
								<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
							</tr>
						</c:forEach>
					 
						</table>
					
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					 </div>
					 
					</div>

				</div>
		 	</div>
		</div>
	</section>
	
	<script>
	 var result = '${msg}';
	 
	 if(result == 'success'){
	  alert("처리가 완료되었습니다.");
	 }
	
	 
	 $(document).ready(
			 function() {
				 
				 $('#searchBtn').on(
					"click",
					function(event) {
						
						// makeQuery는 검색 조건이 없는 상황에서 사용하는 메소드
						// ----> 검색 조건이 없는 링크 생성, 필요한 링크를 뒤에 연결 시키는 방식으로 처리
						self.location = "list"
							+ '${ pageMaker.makeQuery(1) }'
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
					});
				 
				 $('newBtn').on("click", function(evt) {
					
					 self.location = "register";
					 
				 });
				 
			 });
	 
</script>
	<%@include file="../include/footer.jsp" %>