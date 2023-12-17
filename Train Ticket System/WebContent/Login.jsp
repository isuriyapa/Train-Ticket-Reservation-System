<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.digitalbd.Helper" %>
<%@ page import="com.digitalbd.User" %>
<%@ include file="header.jsp" %>
<%
if(session.getAttribute("isUserLogin") != null && (boolean) session.getAttribute("isUserLogin")){
	response.sendRedirect("Dashboard.jsp");
}
User user = new User();
String message = "";
String userName = null,passWord = null;
long userId = 0;
if(request.getParameter("submit") != null){
	userName = request.getParameter("phone");
	passWord = request.getParameter("password");
	if(userName.equals("") || passWord.equals("")){
		message = "User name and password required!";
	}else if( (userId =user.doLogin(userName,passWord)) >0){
		session.setAttribute("isUserLogin", true);
		user.SetUserFromId(Long.toString(userId));
		user.SetUserSession(session);
		response.sendRedirect("Dashboard.jsp");
	}else{
		message = "User id or password not found!";
		session.invalidate();
	}
	
}
%>
<div class="signpage">
	<form class="register_form form_login" action="Login.jsp" method="post">
		
		<div class="row">
			
			
			<div class="w3-content" style="max-width:600px">
			  <img class="mySlides" src="images/slide1.jpg" style="width:100%;display:none; border-radius:5px; ">
			  <img class="mySlides" src="images/slide2.jpg" style="width:100%;  border-radius:5px;">
			  <img class="mySlides" src="images/slide3.jpg" style="width:100%;display:none;  border-radius:5px;">
			
			  <div class="w3-row-padding w3-section">
			    <div class="w3-col s4">
			      <img class="demo w3-opacity w3-hover-opacity-off" src="images/slide1.jpg" style="width:100%;cursor:pointer; border-radius:5px;" onclick="currentDiv(1)">
			    </div>
			    <div class="w3-col s4">
			      <img class="demo w3-opacity w3-hover-opacity-off" src="images/slide2.jpg" style="width:100%;cursor:pointer; border-radius:5px;" onclick="currentDiv(2)">
			    </div>
			    <div class="w3-col s4">
			      <img class="demo w3-opacity w3-hover-opacity-off" src="images/slide3.jpg" style="width:100%;cursor:pointer; border-radius:5px;" onclick="currentDiv(3)">
			    </div>
			  </div>
			</div>
			
			<script>
			function currentDiv(n) {
			  showDivs(slideIndex = n);
			}
			
			function showDivs(n) {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  var dots = document.getElementsByClassName("demo");
			  if (n > x.length) {slideIndex = 1}
			  if (n < 1) {slideIndex = x.length}
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";
			  }
			  for (i = 0; i < dots.length; i++) {
			    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
			  }
			  x[slideIndex-1].style.display = "block";
			  dots[slideIndex-1].className += " w3-opacity-off";
			}
			</script>
			
			
			
			
			<div class="col-xs-12 col-sm-4">
				<% if(!message.equals("")){ %>
				<div class="alert alert-danger"><p><%= message %></p></div>
				<% } %>
				<div class="rs_form_box">
					<h3 class="form_section_title">
						Login
					</h3>
					<div class="input-group">
						<label>Mobile*</label>
						<input type="text" name="phone" class="form-controller">
					</div>
					<div class="input-group">
						<label>Password</label>
						<input type="password" name="password" class="form-controller">
					</div>
				</div>
				<div class="text-center">
					<div class="rs_btn_group">
						<button class="btn btn-default" name="submit" type="submit">Login</button>
						<a href="<%= Helper.baseUrl %>Register.jsp" class="btn btn-default">Register</a>
					</div>
				</div>
			</div>
			
		</div>
	</form>
</div>
<%@ include file="footer.jsp" %>