<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>帖子列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<center>
		<table border="1" style="text-align:center">
			<tr>
				<td colspan="6"><h1>帖子列表</h1></td>
			</tr>
			<tr>
				<td colspan="6">帖子标题：
					<form action="init.do" method="get">
						<input type="text" name="queryCondition"
							value="${page.queryCondition}" id="condition"> <input
							type="submit" value="查询" />
					</form>
				</td>
			</tr>
			<tr>
				<th>编号</th>
				<th>标题</th>
				<th>内容摘要</th>
				<th>作者</th>
				<th>发布时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${invList}" var="item" varStatus="status">
				<tr
					<c:if test="${status.count%2!=0}"> 
			     style="background-color:#dbce8f"
			    </c:if>
					<c:if test="${status.count%2==0}"> style="background-color:grey"</c:if>>
					<td>${item.id}</td>
					<td>${item.title}"</td>
					<td>${item.summay}</td>
					<td>${item.author}</td>
					<%-- <td>${item.content}</td> --%>
					<td><fmt:formatDate value="${item.createDate}"
							pattern="yyyy-MM-dd" /></td>
					<td><a href="isdelete.do?id=${item.id}">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		<br /> <br /> <label>第${page.currentPage}/${page.totalPage}页
			共${page.totalRows}条</label> <a href="init.do?currentPage=0">首页</a> <a
			href="init.do?currentPage=${page.currentPage-1}"
			onclick="return checkFirst()">上一页</a> <a
			href="init.do?currentPage=${page.currentPage+1}"
			onclick="return checkNext()">下一页</a> <a
			href="init.do?currentPage=${page.totalPage}">尾页</a> 跳转到:<input
			type="text" style="width:30px" id="turnPage" />页 <input
			type="button" onclick="startTurn()" value="跳转">
	</center>

	<script type="text/javascript">
	
	function checkFirst(){
	     if(${page.currentPage>1}){
	     
	       return true;
	     
	     }
	     alert("已到页首,无法加载更多");
	    
	   return false;
	}
	
	function checkNext(){
	
	if(${page.currentPage<page.totalPage}){
	
	  return true;
	
	}
    alert("已到页尾，无法加载更多页");
	return false;
	
	}
	
	
	function startTurn(){
	
	var turnPage=document.getElementById("turnPage").value;
	
	if(turnPage>${page.totalPage}){
	
	  alert("对不起已超过最大页数");
	 
	  return false;
	
	}
	
	var shref="init.do?currentPage="+turnPage;
	
	window.location.href=shref;
}
</script>

</body>
</html>
