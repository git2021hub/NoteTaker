<%@page import="org.hibernate.Session" %>
<%@page import="com.helper.FactoryProvider" %>
<%@page import="org.hibernate.Query" %>
<%@page import="com.entites.*" %>
<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
 <div class="container">
   <%@include file="navbar.jsp" %>
   <br>
   <h1 class="text-uppercase">All Notes</h1>
   
    <div class="row">
    	<div class="col-12">
    <%
    Session s=FactoryProvider.getFactory().openSession();
    Query q=s.createQuery("from Note");
    List<Note> list=q.list();
    for(Note note:list){
     %>	
     <div class="card mt-3" >
  		 <img class="card-img-top m-4" style="max-width:100px;" src="image/notepad.png" alt="Card image cap">
 		 <div class="card-body px-5">
    	 <h5 class="card-title"><%= note.getTitle()%></h5>
    	 <p class="card-text">
    	 <%= note.getContent() %> </p>
    	 <div class="container text-center mt-3 ">
    	 <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
    	 <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">update</a>
    	 </div>
  </div>
</div>
    
   <%  }
    s.close();
   %>	
  </div>
 </div>
 </div>
</body>
</html>