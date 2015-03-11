<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<portlet:actionURL name="save" var="saveURL" />

<form name="<portlet:namespace />fm" id="<portlet:namespace />fm" method="post" action="${saveURL}">
    <input type="text" name="<portlet:namespace />nombre" />
    <input type="submit" value="Enviar" />
</form>