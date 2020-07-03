<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기페이지로 복귀</title>
</head>
<script>

var news_no=${param.news_no};
location.href="/SemiProject/news/newsDetail.hb?news_no="+news_no;

</script>
<body>

</body>
</html>