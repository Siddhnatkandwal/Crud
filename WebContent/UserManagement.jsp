<%@page import="beans.UserDetails"%>
<%@page import="beans.UserDetailsDao"%>
<%@page import="beans.UserDetailsDaoImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<c:import url="header.jsp"></c:import>

</head>
<body class="container" style="background-color:turquoise;">
    <h1>Registration Form</h1>
    <form action="/HibernateForm/RegisterOperation" method="post">
        <table>
			<tr>
				<td>User Name :</td>
				<td><input type="text" name="userName" size="30" /></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><input type="password" name="password" size="30" /></td>
			</tr>
			<tr>
				<td>Age :</td>
				<td><input type="number" name="age" min="10" max="99" /></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td>
					<select id="gender" name="gender">
						<option value="male">Male</option>
						<option value="female">Female</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>Contact Number :</td>
				<td><input type="text" name="c_num" pattern="[6789][0-9]{9}"/></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="email" name="email" size="30" /></td>
			</tr>
		</table>
        <p />
		<input type="hidden" name="action" value="insert" />
		<button type="submit" class="btn btn-primary ">REGISTER</button>
    </form>

	<h3>CURRENT USERS :</h3>
    
    <div class="container">
    <table class="table table-dark table-striped">
    
    	<thead>
    		<tr>
    		
    		<th>ID</th>
    		<th>USERNAME</th>
    		<th>PASSWORD</th>
    		<th>AGE</th>
    		<th>GENDER</th>
    		<th>CONTACT NUMBER</th>
    		<th>EMAIL</th>
    		<th>OPERATIONS</th>
    		
    		</tr>
    	</thead>
    	
    	
   
    		<tr>
    		
    	<%
    	UserDetailsDao usdDao = new UserDetailsDaoImplementation();
    	for(UserDetails userDetails : usdDao.fetchAllUsers()){
    	%>
    	<tr>
    	<td><%= userDetails.getId() %> </td>
    	<td><%= userDetails.getUsername()%> </td>
    	<td><%= userDetails.getPassword()%> </td>
    	<td><%= userDetails.getAge()%> </td>
    	<td><%= userDetails.getGender()%> </td>
    	<td><%= userDetails.getC_num()%> </td>
    	<td><%= userDetails.getEmail()%> </td>
    	<td>
    	<form action="/HibernateForm/RegisterOperation" method="post" style="display:inline;">	
   			<input type="hidden" name="id" value="<%= userDetails.getId()%>">
    		<input type="hidden" name="action" value="delete">
    		<button type="submit" class="btn btn-danger btn-sm fas fa-minus">Delete</button>
    	</form>
    	<a href="/HibernateForm/EditUser.jsp?id=<%= userDetails.getId()%>"  class="btn btn-success btn-sm fas fa-cog" style="margin-left:50px;">Edit</a>
    	</td>
    	</tr>
    		
    	<%  } 
    		%>
    
    </table>
    </div>

</body>
</html>