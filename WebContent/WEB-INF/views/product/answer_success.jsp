<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<script>
	alert('답변이 저장되었습니다.')
	location.href = '${root}product/read?questionid=${answerBean.questionid}'

</script>