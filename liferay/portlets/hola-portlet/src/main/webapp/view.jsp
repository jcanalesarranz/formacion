<%@ page import="javax.portlet.WindowState" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

This is the <b>hola-portlet</b>.

<portlet:renderURL var="editURL" windowState="<%=WindowState.MAXIMIZED.toString()%>">
    <portlet:param name="jspPage" value="/editOrUpdate.jsp" />
</portlet:renderURL>

<br />

<a href="${editURL}">Ir a edición</a>