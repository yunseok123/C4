<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath }"/> 
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>

     <link rel="stylesheet" href="${root }/css/commannouncement.css" type="text/css" />


</head>
<body>
       <c:import url="/WEB-INF/views/include/header.jsp"/>

        <div class="write-container">
      
       
        <form>
            <div class="form-group">
                <input type="text" id="title" name="title" placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group1">
                <textarea id="content" name="content" placeholder="내용을 작성하세요."></textarea>
            </div>
            <div class="form-group2">
          
                <button type="submit" class="submit-button">작성 완료</button>
            </div>
        </form>
    </div>
    </body>
  
</body>
</html>