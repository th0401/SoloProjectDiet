<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pagingIndex" required="true"
	type="java.util.ArrayList"%>
<%@ attribute name="isFirst" required="true"%>
<%@ attribute name="isLast" required="true"%>
<%@ attribute name="url" required="true"%>
<div style="text-align:center;">
<div class="btn-group" role="group" aria-label="Basic example">
	<c:choose>		
		<c:when test="${!isFirst}">
			<!-- 첫번째 페이지가 아니면 버튼 활성화 -->			
				<button type="button" onclick="location.href='${url}?index=${index-1}'"
					class="btn btn-outline-secondary">&lt;</button>			

		</c:when>
	</c:choose>	
	&nbsp;&nbsp;&nbsp; 
	<c:forEach var="pa" items="${pagingIndex}">
          <button type="button" class="btn btn-outline-secondary" onclick="location.href='${url}?index=${pa}'">${pa}</button>
    </c:forEach> 
	&nbsp;&nbsp;&nbsp;	
	<c:choose>			
		<c:when test="${!isLast}">
			<!-- 마지막페이지가 아니면 버튼 활성화 -->				
				<button type="button" onclick="location.href='${url}?index=${index+1}'"
					class="btn btn-outline-secondary">&gt;</button>			
		</c:when>		
	</c:choose>		
	              
</div>
	</div>		

		
