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
<title>修改页面</title>
<link href="/paimai/css/common.css" rel="stylesheet" type="text/css" />
<link href="/paimai/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="/paimai/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">
           function check(){
             var a = $("#imgname").val();
             var b =a.lastIndexOf("\\");  
             var c =a.substring(b);
              $("#img").prop("src","/paimai/images/"+c);   
          } 
          
          
          
                    function check4(){
             var a =$("#qipai").val();
             var b=parseInt(a);
             if(!isNaN(b)){
              $("#div1").html("");
             return true;
             }else{
                $("#div1").html("必须为数字");
                return false
             }
          } 
          
            function check1(){
             var a =$("#dijia").val();
             var b=parseInt(a);
             
             if(!isNaN(b)){
              $("#div2").html("");
             return true;
             }else{
                $("#div2").html("必须为数字");
                 return false
             }
          } 
           
            function check2(){
             var a =$("#end").val();
             var b =/^(\d{4})\/(\d{2})\/(\d{2}) (\d{2}):(\d{2}):(\d{2})$/; 
             if(b.test(a)){
              $("#div3").html("");
             return true;
             }else{
                $("#div3").html("日期格式不正确");
                 return false
             }
          } 
          
            function check3(){
             var a =$("#end").val();
             var b =/^(\d{4})\/(\d{2})\/(\d{2}) (\d{2}):(\d{2}):(\d{2})$/; 
             if(b.test(a)){
              $("#div4").html("");
             return true;
             }else{
                $("#div4").html("日期格式不正确");
                 return false
             }
          }       
           
        function check5(){
         var a =$("#dname").val();
         if(a.length>0){
              $("#div5").html("");
             return true;
             }else{
                $("#div5").html("请拍品名称");
                 return false;
             }     
     }    
           
           
     function checkname(){
         if(check4()&&check1()&&check2()&&check3()&&check5()){
               return true;
         }else{
               return false;
         }
       
     }  
           
</script>
</head>

<body>
<div class="wrap">
  <!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
  <form action="/paimai/update.con" method="post" target='_blank'  id="form"  enctype="multipart/form-data">
      <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
          <dl>
            <dd >
              <label>名称：</label>
              <input type="text" class="inputh lf" value="${requestScope.product.auction_name }" name="auction_name"  onblur="check5()" id="dname"/>
              <div class="xzkbg spbg lf" id="div5"></div>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input type="text" class="inputh lf" value="${requestScope.product.auction_start_price }"  name="auction_start_price" onblur="check4()" id="qipai"/>
              <div class="lf red laba" id="div1"></div>
            </dd>
            <dd>
              <label>底价：</label>
              <input type="text" class="inputh lf" value="${requestScope.product.auction_upset }"  name="auction_upset" onblur="check1()" id="dijia"/>
              <div class="lf red laba" id="div2"></div>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input type="text" class="inputh lf" value="<fmt:formatDate value="${requestScope.product.auction_start_time }" pattern="yyyy/MM/dd hh:mm:ss"/>" name="auction_start_time" onblur="check2()" id="start"/>
              <div class="lf red laba" id="div3"></div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input type="text" class="inputh lf" value="<fmt:formatDate value="${requestScope.product.auction_end_time }" pattern="yyyy/MM/dd hh:mm:ss"/>"  name="auction_end_time" onblur="check3()" id="end"/>
              <div class="lf red laba" id="div4"></div>
            </dd>
            <dd class="dds">
              <label>描述：</label>
              <textarea  cols="" rows="" class="textarea" name="auction_desc">${requestScope.product.auction_desc }</textarea>
            </dd>
            <dd>
              <label>修改图片：</label>
              <div class="lf salebd"><a href="#"><img src="/paimai/images/${requestScope.product.auction_pic }" width="100" height="100" id="img"/></a></div>
               <input name="file" type="file" class="marg10" onchange="check()" id="imgname"/>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb" />
                <input name="" type="submit" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb" />
                <input type="hidden" name="auction_id" value="${requestScope.product.auction_id }">
                <input type="hidden" name="auction_pic" value="${requestScope.product.auction_pic }">
            </dd>
          </dl>
    </div>
    </form>
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
</body>
</html>
