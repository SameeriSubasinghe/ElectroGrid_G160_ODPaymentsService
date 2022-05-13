<%@page import="com.ODPayment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Overdue Payments and Service Suspension</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.js"></script>
<script src="Components/ODPayment.js"></script>
</head>

<body> 
<div class="container"><div class="row"><div class="col-md-"> 
       <h1>Overdue Payments and Service Suspension</h1>
              <form id="formOdps" name="formOdps"> 
              Overdue Payment Code: 
              <input id="ODCode" name="ODCode" type="text" class="form-control form-control-sm">
              <br>
              Due Amount: 
              <input id="dueAmount" name="dueAmount" type="number" class="form-control form-control-sm">
              <br> 
              Number of Due Months: 
              <input id="dueMonthsNo" name="dueMonthsNo" type="number" class="form-control form-control-sm">
              <br>
              Due Months: 
              <input id="dueMonths" name="dueMonths" type="text" class="form-control form-control-sm">
              <br>
              Account Number: 
              <input id="accountNo" name="accountNo" type="text" class="form-control form-control-sm">
              <br>
              Suspended
              <input id="IsSuspend1" name="IsSuspend" type="radio" class="form-control form-control-sm">
              <br>
              Not Suspended
              <input id="IsSuspend2" name="IsSuspend" type="radio" class="form-control form-control-sm">
              <br>
              
              
              <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
              <input type="hidden" id="hidOdpsIDSave" name="hidOdpsIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divOdpsGrid">
 <%
 ODPayment ODPObj = new ODPayment(); 
 out.print(ODPObj.readODPayment()); 
 %>
</div>
</div> </div> </div> 
</body>
</html>
