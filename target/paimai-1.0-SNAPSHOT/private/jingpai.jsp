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
<title>竞拍页面</title>
<link href="/paimai/css/common.css" rel="stylesheet" type="text/css" />
<link href="/paimai/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"  src="/paimai/jquery/jquery-1.11.1.js"></script>
  <script type="text/javascript">
          function check(){
             var a =$("#sta").html();
             var b =$("#sale").val();
             var c =$("#qipaijia").html();
             

             if(a==undefined&&parseInt(b)>parseInt(c)){
             //$("#form").prop("action","${pageContext.request.contextPath }/insert.con"); 
             $("#la").html("");
             return true;
             }else if(a!=undefined&&parseInt(b)>parseInt(a)){
                 //$("#form").prop("action","${pageContext.request.contextPath }/insert.con"); 
                 $("#la").html("");
                  return true;
             }else{
                $("#la").html("不能低于底价或最高竞拍价");
                return false;
             }
                 
          }
          
          function checkName(){
            return check();
           }
     
     
         function check1(){
             var a =$("#idd").val();
             
             location="/paimai/selectOne1.con?auction_id="+a;   
          }    
            function check2(){
             
             
             location="/paimai/selectBy.con";   
          }    
          

  </script>
</head>

<body>
<div class="wrap">
<!-- main begin-->
<form action="${pageContext.request.contextPath }/insert.con" method="post" target='_blank'  id="form" onsubmit="return checkName()">
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="loginOut.con" title="注销">注销</a></div>
  </div>
  <div class="items sg-font lf">
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${requestScope.product.auction_name }</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${requestScope.product.auction_desc }</li>
      </ul>
      <ul class="rows">
        <li>开始时间：</li>
        <li class="borderno"><fmt:formatDate value="${requestScope.product.auction_start_time }" pattern="yyyy年MM月dd日 hh:mm:ss"/></li>
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno"><fmt:formatDate value="${requestScope.product.auction_end_time }" pattern="yyyy年MM月dd日 hh:mm:ss"/></li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
        <li class="borderno" id="qipaijia">${requestScope.product.auction_start_price }</li>
      </ul>
  </div>
  <div class="rg borders"><img src="/paimai/images/${requestScope.product.auction_pic }" width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  <div class="top10 salebd">
       <p>
       <label for="sale">出价：</label>
       <input type="text"  class="inputwd" id="sale" name="auction_price"/>
       <input type="hidden" value="${requestScope.product.auction_id }" name="auction_id" id="idd"/>
       <input name="" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom" onclick="check()"/>
       </p>
       <p class="f14 red" id="la"></p>
  </div>
  <div class="top10">
    <input name="" type="button" value="刷 新" class="spbg buttombg f14" onclick="check1()"/>
    <input name="" type="button" value="返回列表" class="spbg buttombg f14"  onclick="check2()"/>
  </div>
  <div class="offer">
    <h3>出价记录</h3>
    <div class="items sg-font">
      <ul class="rows even strong">
        <li>竞拍时间</li>
        <li>竞拍价格</li>
        <li class="borderno">竞拍人</li>
      </ul>
       <c:forEach items="${requestScope.list }"  var ="b" varStatus="sta">
       <c:if test="${sta.index==0}">
       <ul class="rows" >
        <li><fmt:formatDate value="${b.auction_time }" pattern="yyyy年MM月dd日 hh:mm:ss"/></li>
        <li id="sta">${b.auction_price }</li>
        <li class="borderno">${b.user_name }</li>
      </ul>
      </c:if>
      
      <c:if test="${sta.index!=0}">
      <ul class="rows">
        <li><fmt:formatDate value="${b.auction_time }" pattern="yyyy年MM月dd日 hh:mm:ss"/></li>
        <li>${b.auction_price }</li>
        <li class="borderno">${b.user_name }</li>
      </ul>
       </c:if>
      
      </c:forEach>
  </div>
  </div>
  </form>
<!-- main end-->
</div>
</body>
</html>
