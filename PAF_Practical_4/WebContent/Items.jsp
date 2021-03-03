<%@ page import="com.paf4_2.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (request.getParameter("action") != null) {
	//Insert item----------------------------------
	if (request.getParameter("action").toString().equalsIgnoreCase("insert")) {
		Item itemObj = new Item();
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),
		request.getParameter("itemPrice"), request.getParameter("itemDesc"));
		session.setAttribute("statusMsg", stsMsg);
		//Update item-----------------------------------
	} else if (request.getParameter("action").toString().equalsIgnoreCase("update")) {
		Item itemObj = new Item();
		String stsMsg = itemObj.updateItem(Integer.parseInt(request.getParameter("itemID").toString()),
		request.getParameter("itemCode"), request.getParameter("itemName"), request.getParameter("itemPrice"),
		request.getParameter("itemDesc"));
		session.setAttribute("statusMsg", stsMsg);
		//Remove item------------------------------------
	} else if (request.getParameter("action").toString().equalsIgnoreCase("remove")) {
		Item itemObj = new Item();
		String stsMsg = itemObj.removeItem(Integer.parseInt(request.getParameter("itemID").toString()));
		session.setAttribute("statusMsg", stsMsg);
	}
} else {
	session.setAttribute("statusMsg", "");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="views/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">


				<h1>Items Management</h1>
				<%
						if (request.getParameter("action") != null) {
						if (request.getParameter("action").toString().equalsIgnoreCase("select")) {
							Item itemObj = new Item();
							out.print(itemObj.viewItem(Integer.parseInt(request.getParameter("itemID"))));
						} else {
							out.print("<form method='post' action='Items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
							+ "Item code: <input name='itemCode' type='text' class='form-control col-md-3'><br>"
							+ "Item name: <input name='itemName' type='text' class='form-control col-md-3'><br> "
							+ "Item price: <input name='itemPrice' type='text' class='form-control col-md-3'><br> "
							+ "Item description: <input name='itemDesc' type='text' class='form-control col-md-3'><br> "
							+ "<input name='btnSubmit' type='submit' value='Save'> " + "</form>");
						}
					} else {
						out.print("<form method='post' action='Items.jsp'> " + "<input name='action' value='insert' type='hidden'> "
						+ "Item code: <input name='itemCode' type='text'><br>"
						+ "Item name: <input name='itemName' type='text'><br> "
						+ "Item price: <input name='itemPrice' type='text'><br> "
						+ "Item description: <input name='itemDesc' type='text'><br> "
						+ "<input name='btnSubmit' type='submit' value='Save' class='btn btn-primary'> " + "</form>");
					}
					%>

				<br>
				<p>
					<%
							if (session.getAttribute("statusMsg") != null) {
							out.print("<div class='alert alert-success'>" + session.getAttribute("statusMsg") + "</div>");
							session.setAttribute("statusMsg", null);
						}
						%>
				</p>

				<br>
				<%
						Item itemObj = new Item();
					out.print(itemObj.readItems());
					%>


			</div>
		</div>
	</div>
</body>
</html>