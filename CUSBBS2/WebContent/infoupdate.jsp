<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>BOARD WEB SITE</title>
</head>
<body>
	<%
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int userNum = 0;
		if (request.getParameter("userNum") != null){
			userNum = Integer.parseInt(request.getParameter("userNum"));
		}
		
		User user = new UserDAO().getUser(userID);
		
		
		
	%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="main.jsp">BOARD WEB SITE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>

		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link" href="main.jsp">Home 
				<span class="sr-only">(current)</span></a> 
				<a class="nav-item nav-link" 
				href="board.jsp">Board</a>
				<%
					if (userID == null) {
				%>
				<a class="nav-item nav-link" href="login.jsp">login</a>

				<%
					} else {
				%>
				<a class="nav-item nav-link" href="logoutAction.jsp">logout</a> <span
					style="float: right;"><a href="myinfo.jsp"
					class="btn btn-outline-secondary active"><%=userID%></a> </span>

				<%
					}
				%>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="infoupdateAction.jsp">
			<h3 style="text-align: left;">내 정보</h3>
			
				<div class="form-group">
				<br>
					<label for="userID"><strong>ID</strong></label> <br>
					<label><%=user.getUserID()%></label></div>
				<div class="form-group">
					<label for="Password"><strong>PASSWORD</strong></label> <br>
				<input type="password" class="form-control" value="<%= user.getUserPassword() %>" name="userPassword" maxlength="10">
				</div>
				<div class="form-group">
				
					<label for="userName"><strong>NAME</strong></label> <br>
				<input type="text" class="form-control" value="<%= user.getUserName() %>" name="userName" maxlength="10">
					<br>
					</div>
			<input type="submit" class="btn btn-primary" value="수정">
				
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1. min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>