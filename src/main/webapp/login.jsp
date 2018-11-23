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
	
<title>登录页面</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript"  src="/paimai/jquery/jquery-1.11.1.js"></script>
  <script type="text/javascript">
         
           function check1(){
             location="/paimai/regist.jsp" 
          }
          
          function lala(){
            
             $("#imgVcode").prop("src","/paimai/yanzhengma.con?a="+Math.random());
          }
          
          
          
          function dname(){
             var a =$("#name").val();
             if(a.length!=0){
                $("#na").html("");
                return true;
             }else{
                $("#na").html("请输入用户名");
                return false;
             }
          }
          
          
          function dward(){
             var a =$("#password").val();
             if(a.length!=0){
                $("#pa").html("");
                return true;
             }else{
                $("#pa").html("请输入密码");
                return false;
             }
          }
          
             function yan(){
             var a =$("#passwords").val();
             if(a.length!=0){
                $("#yan").html("");
                return true;
             }else{
                $("#yan").html("请输入验证码");
                return false;
             }
          }      
         
         function checkName(){
            if(dname()&&dward()&&yan()){
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
 <div class="main">
   <div class="sidebar">
     <p><img src="images/img1.jpg" width="443" height="314" alt=""  /></p>
   </div>
   <div class="sidebarg">
     <form action="/paimai/login.con" method="post"  id="form" onsubmit="return checkName()" >
    <div class="login">
      <dl>
        <dt class="blues">用户登陆</dt>
        <dd><label for="name">用户名：</label><input type="text" class="inputh" id="name" name="user_name" onblur="dname()"/></dd><span id="na" style="color:red"></span>
        <dd><label for="password">密 码：</label><input type="text" class="inputh" id="password" name="user_password" onblur="dward()"/></dd><span id="pa" style="color:red"></span>
        <dd>
           <label class="lf" for="passwords">验证码：</label>
           <input type="text" class="inputh inputs lf"  id="passwords" name="number" onblur="yan()"/>
           <span class="wordp lf"><img src="yanzhengma" width="96" height="27" alt="" id="imgVcode"/></span>
           <span class="blues lf"><a href="javascript:void(0)" onclick="lala()" title="">看不清</a></span>
        </dd>
             <span id="yan" style="color:red"></span>
        <dd>
           <input name=""  type="checkbox" id="rem_u"  />
           <span for="rem_u">下次自动登录</span>
        </dd>
        <dd class="buttom">
           <input name="" type="submit" value="登 录" class="spbg buttombg f14 lf"/>
           <input name="" type="button" value="注 册" class="spbg buttombg f14 lf"  onclick="check1()"/>
           <span class="blues  lf"><a href="" title="">忘记密码?</a></span>
           <div class="cl"></div>
        </dd>
       
      </dl>
    </div>
    </form>
   </div>
  <div class="cl"></div>
 </div>
<!-- main end-->
 
<!-- footer begin-->
</div>
 <!--footer end-->
 
</div>
</body>
</html>
