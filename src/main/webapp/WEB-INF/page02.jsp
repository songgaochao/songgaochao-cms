<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
		<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="javascript:gotoPage(${pageInfo.prePage==0?1:pageInfo.prePage })"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<c:forEach items="${pageInfo.navigatepageNums}" var="n">
				<li class="page-item ${n==pageInfo.pageNum?"active":""}"><a class="page-link" href="javascript:gotoPage(${n})">${n}</a></li>
			</c:forEach>

			<li class="page-item"><a class="page-link" href="javascript:gotoPage(${pageInfo.nextPage ==0?pageInfo.pages:pageInfo.nextPage})"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>

</div>