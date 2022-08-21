<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<button type="button" onclick="location.href='<c:url value="/boardlist?pdt_id=${param.pdt_id}&bbs_clsf_cd=${bbs_clsf_cd}&page=${page}&pageSize=${pageSize}"/>'">리뷰게시판</button>
</body>
</html>