<%--
  Created by IntelliJ IDEA.
  User: Munca
  Date: 19.02.2021
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="WebCustomerTracker.spring.utility.SortUtils"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Customer List</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web-resources/css/style.css"/>
</head>
<body>
<c:url var="sortLinkFirstName" value="/customer/list">
    <c:param name="sort" value="<%= Integer.toString(SortUtils.FIRST_NAME) %>" />
</c:url>
<c:url var="sortLinkLastName" value="/customer/list">
    <c:param name="sort" value="<%= Integer.toString(SortUtils.LAST_NAME) %>" />
</c:url>
<c:url var="sortLinkEmail" value="/customer/list">
    <c:param name="sort" value="<%= Integer.toString(SortUtils.EMAIL) %>" />
</c:url>
<div id="wrapper">

    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>

</div>
<div id="container">
    <div id="content">
        <input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd';return false;"
               class="add-button">
        <form:form action="search" method="GET">
            Search customer: <input type="text" name="theSearchName" />

            <input type="submit" value="Search" class="add-button" />
        </form:form>
        <!--  Here will be our table -->
        <table>
            <tr>
                <th><a href="${sortLinkFirstName}">First Name</a></th>
                <th><a href="${sortLinkLastName}">Last Name</a></th>
                <th><a href="${sortLinkEmail}">Email</a></th>
                <th>Action</th>
            </tr>

            <!-- loop over and print our customers -->
            <c:forEach var="tempCustomer" items="${customers}">

                <!-- construct an "update" link with customer id -->
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <!-- construct an "delete" link with customer id -->
                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <tr>
                    <td> ${tempCustomer.firstName} </td>
                    <td> ${tempCustomer.lastName} </td>
                    <td> ${tempCustomer.email} </td>

                    <td>
                        <!-- display the update link -->
                        <a href="${updateLink}">Update</a>
                        |
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                    </td>

                </tr>

            </c:forEach>
        </table>

    </div>
</div>


</body>
</html>
