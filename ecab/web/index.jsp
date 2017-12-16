<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script>
    var i=1;
    function init(){
        setInterval("changeImage()",2000);
    }
    function changeImage(){
        i++;
        var name="images/pic0"+i+".jpg";
        document.getElementById("slider-image").src=name;
        if(i==3){
            i=1;
        }
    }
</script>

<link href="styles/default.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body onload="init()">
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="index.jsp">Ecab System</a></h1>
			
		</div>
		<div id="menu">
			<ul>
                                <li class="first active"><a href="index.jsp" accesskey="1" title="">Homepage</a></li>
				<li><a href="login.jsp" accesskey="2" title="">Login</a></li>
                                <li><a href="register.jsp" accesskey="3" title="">Register</a></li>
				<li><a href="viewcars.jsp" accesskey="4" title="">View Cars</a></li>				
			</ul>
		</div>
	</div>
</div>
<div id="banner">
	<div id="slider">
		<div class="viewer" style="position: relative; overflow: hidden;">
			<img id="slider-image" src="images/pic01.jpg" alt="">
		</div>
	</div>
</div>
    
<div id="footer">
	<p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
</div>
</body>
</html>
