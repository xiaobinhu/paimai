<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
<title>注册页面</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

  <script type="text/javascript"  src="/paimai/jquery/jquery-1.11.1.js"></script>
  <script type="text/javascript">
       
          function lala(){
            
             $("#imgVcode").prop("src","/paimai/yanzhengma.con?a="+Math.random());
          }
          
          function check(){
             var a =$("#dname").val(); 
            if(a.length>=6){
               $("#divv").html("");
               return true;
            }else{
                $("#divv").html("用户名要求不低于6个字符");
                return false;
            }
          }
    
           function check1(){
             var a =$("#dname").val(); 
            if(a.length>=6){
               $("#div2").html("");
               return true;
            }else{
                $("#div2").html("密码要求不低于6个字符");
                return false;
            }
          }
    
            function check2(){
             var a =$("#sheng").val(); 
            if(a.length>0){
               $("#div3").html("");
               return true;
            }else{
                $("#div3").html("请输入正确的身份证号");
                return false;
            }
          }
    
              function check3(){
             var a =$("#tel").val(); 
            if(a.length>0){
               $("#div4").html("");
               return true;
            }else{
                $("#div4").html("手机号必填");
                return false;
            }
          }
          
          function checkName(){
           var a=$("#rem_u").prop("checked")
             if(check()&&check1()&&check2()&&check3()&&a){
                return true;
             }else{
               return false;
             }
          }
          
          
          
          
          
          
          
  </script>
</head>

<body>
<form action="${pageContext.request.contextPath }/regist.con" method="post" target='_blank'  id="form" onsubmit="return checkName()">
<div class="wrap">
  <!-- main begin-->
      <div class="zclf login logns">
        <h1  class="blue">用户注册</h1>
          <dl>
            <dd>
              <label> <small>*</small>用户名</label>
              <input type="text" class="inputh lf" value="" name="user_name" onblur="check()" id="dname"/>
             <div class="lf red laba" id="divv"></div>
            </dd>
            <dd>
              <label> <small>*</small>密码</label>
              <input type="text" class="inputh lf" value=""  name="user_password" onblur="check1()" id="dword"/>
              <div class="lf red laba" id="div2"></div>
            </dd>
            <dd>
              <label> <small>*</small>身份证号</label>
              <input type="text" class="inputh lf" value="" name="user_card_no" onblur="check2()" id="sheng"/>
              <div class="lf red laba" id="div3"></div>
            </dd>
            <dd>
              <label> <small>*</small>电话</label>
              <input type="text" class="inputh lf" value="" name="user_tel" onblur="check3()" id="tel"/>
              <div class="lf red laba" id="div4"></div>
            </dd>
            <dd>
              <label> <small>*</small>住址</label>
              <input type="text" class="inputh lf" value=""  name="user_address"/>
            </dd>
            <dd>
              <label> <small>*</small>邮政编码</label>
              <input type="text" class="inputh lf" value=""  name="user_post_number"/>
            </dd>
            <dd class="hegas">
              <label> <small>*</small>验证码</label>
              <input type="text" class="inputh inputs lf" value=""  name="number"/>
               <span class="wordp lf"><img src="/paimai/yanzhengma.con" width="96" height="27" alt=""  id="imgVcode"/></span>
               <span class="blues lf"><a href="javascript:void(0)" title="" onclick="lala()">看不清</a></span>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
               <input name="checkbox"  type="checkbox" id="rem_u"  value="1" />
              <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
              <input name="" type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
            </dd>
          </dl>
    </div>
<!-- main end-->
<!-- footer begin-->

</div>
</form>
 <!--footer end-->
 
</div>

</body>
</html>
