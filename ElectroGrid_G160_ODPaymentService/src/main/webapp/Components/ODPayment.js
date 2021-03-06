 $(document).ready(function() 
{ 
if ($("#alertSuccess").text().trim() == ""){ 
 $("#alertSuccess").hide(); 
 } 
 $("#alertError").hide(); 
}); 


// SAVE ============================================
 $(document).on("click", "#btnSave", function(event) 
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
 
 
// Form validation-------------------
var status = validateODPaymentsForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
 
// If valid------------------------
var type = ($("#hidOdpsIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "ODPaymentAPI", 
 type : type, 
 data : $("#formOdps").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onODPaymentsSaveComplete(response.responseText, status); 
 } 
 }); 
});

function onODPaymentsSaveComplete(response, status) 
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divOdpsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 } 

 $("#hidOdpsIDSave").val(""); 
 $("#formOdps")[0].reset(); 
}

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
 $("#hidOdpsIDSave").val($(this).data("odpaymentid")); 
 $("#ODCode").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#dueAmount").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#dueMonthsNo").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#dueMonths").val((decodeURI($(this).closest("tr").find('td:eq(3)').text())));
 $("#accountNo").val($(this).closest("tr").find('td:eq(4)').text());
// $("#IsSuspend1").prop("checked", true);
  var val = $(this).closest("tr").find('td:eq(5)').text();
if(val == "true"){
	$("#IsSuspend1").prop("checked", true);
}else{
	$("#IsSuspend2").prop("checked", true);
}
//$("#IsSuspend").val($(this).closest("tr").find('td:eq(5)').text()); 
 
 }); 


$(document).on("click", ".btnRemove", function(event) 
{ 
 $.ajax( 
 { 
 url : "ODPaymentAPI", 
 type : "DELETE", 
 data : "ODPaymentID=" + $(this).data("odpaymentid"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onODPaymentsDeleteComplete(response.responseText, status); 
 } 
 }); 
});


function onODPaymentsDeleteComplete(response, status) 
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divOdpsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}




// CLIENT-MODEL================================================================
function validateODPaymentsForm() 
{ 
	
// OverDue Payment Code
if ($("#ODCode").val().trim() == ""){ 
 return "Insert Overdue Payment Code."; 
 } 
 

// OverDue Amount
if ($("#dueAmount").val().trim() == ""){ 
 return "Insert Due Amount."; 
 } 
 
// is numerical value
var tmpdueAmount = $("#dueAmount").val().trim(); 
if (!$.isNumeric(tmpdueAmount)) 
 { 
 return "Insert a numerical value for Due Amount."; 
 } 
// convert to decimal price
 $("#dueAmount").val(parseFloat(tmpdueAmount).toFixed(2)); 
 
 
 //No of DueMonths
if ($("#dueMonthsNo").val().trim() == "") 
 { 
 return "Insert No of Due Months."; 
 } 
 
// is numerical value
var tmpdueMonthsNo = $("#dueMonthsNo").val().trim(); 
if (!$.isNumeric(tmpdueMonthsNo)) 
 { 
 return "Insert a numerical value for No of DueMonths."; 
 } 
 
 
 // Due Months
if ($("#dueMonths").val().trim() == "") 
 { 
 return "Insert Due Months."; 
 } 
 
// Account Number
if ($("#accountNo").val().trim() == "") 
 { 
 return "Insert Item Account Number."; 
 } 
 

 
return true; 
}