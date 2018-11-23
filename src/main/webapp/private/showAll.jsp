<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<title>展示页面</title>
<link href="/paimai/css/common.css" rel="stylesheet" type="text/css" />
<link href="/paimai/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"  src="/paimai/jquery/jquery-1.11.1.js"></script>
  <script type="text/javascript">
          function check(){
              location="/paimai/private/add.jsp";    
          }
          
          
       function abc(){
	   
	   if(confirm("你真的确认要删除吗？请确认")){
	    
		   return true;
		 }
		 else{
			 return false;
			 }
			 
	   };
	   function dele(){
		   if(confirm("你真的确认要修改吗？请确认")){
			   return true;
			   }
			   else{
				   return false;
				   }
		   }
  
  </script>
</head>

<body>
<div class="wrap">
<!-- main begin-->
<form action="${pageContext.request.contextPath }/selectBy.con" method="post" target='_blank'  id="form">
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="/paimai/loginOut.con" title="注销">注销</a></div>
  </div>
  <div class="forms">
    <label for="name">名称</label>
    <input  type="text" class="nwinput" id="name" name="auction_name"/>
    <label for="names">描述</label>
    <input  type="text" id="names" class="nwinput" name="auction_desc"/>
    <label for="time">开始时间</label>
    <input  type="text" id="time" class="nwinput"  name="auction_start_time" />
    <label for="end-time">结束时间</label>
    <input  type="text" id="end-time" class="nwinput"  name="auction_end_time" />
    <label for="price">起拍价</label>
    <input  type="text" id="price" class="nwinput" name="auction_start_price"/>
    <input name="" type="submit"  value="查询" class="spbg buttombg f14  sale-buttom"/>
    
    <c:if test="${sessionScope.user.user_is_admin==1}">
    <input type="button"  value="发布" class="spbg buttombg f14  sale-buttom buttomb"  onclick="check()"/>
   </c:if>
    
  </div>
  <div class="items">
      <ul class="rows even strong">
        <li>名称</li>
        <li class="list-wd">描述</li>
        <li>开始时间</li>
        <li>结束时间</li>
        <li>起拍价</li>
        <li class="borderno">操作</li>
      </ul>
      
      <c:forEach items="${requestScope.list }"  var ="b" varStatus="sta">
       <c:if test="${sta.index%2==0 }">
        <ul class="rows">
       </c:if>
       <c:if test="${sta.index%2!=0 }">
        <ul class="rows even">
       </c:if>
        <li><a href="国书" title="">${b.auction_name }</a></li>
        <li class="list-wd">${b.auction_desc }</li>
        <li><fmt:formatDate value="${b.auction_start_time }" pattern="yyyy年MM月dd日 hh:mm:ss"/></li>
        <li><fmt:formatDate value="${b.auction_end_time }" pattern="yyyy年MM月dd日 hh:mm:ss"/></li>
        <li>${b.auction_start_price }</li>
        <li class="borderno red">
         <c:if test="${sessionScope.user.user_is_admin==0}">
           <a href="/paimai/selectOne1.con?auction_id=${b.auction_id }">竞拍</a>
           </c:if>
         <c:if test="${sessionScope.user.user_is_admin==1}">
		   <a href="/paimai/selectOne.con?auction_id=${b.auction_id }" title="修改" onclick="dele();">修改</a>|
          <a href="/paimai/delete.con?auction_id=${b.auction_id }" title="删除" onclick="abc();">删除</a>
          </c:if>
        </li>
        
      </ul>
     
  </c:forEach>    
      
      <div class="page">
        <a href="#" title="">首页</a>
        <a href="#" title="">上一页</a>
        <span class="red">前5页</span>
        <a href="#" title="">1</a> 
        <a href="#" title="">2</a> 
        <a href="#" title="">3</a> 
        <a href="#" title="">4</a>
        <a href="#" title="">5</a> 
        <a href="#" title="">下一页</a>
        <a href="#" title="">尾页</a> 
      </div>
  </div>
 </form>

<!-- main end-->
</div>
</body>
</html>
