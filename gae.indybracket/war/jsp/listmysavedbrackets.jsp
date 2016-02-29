<%@ page import="java.util.*" %>
<%@ page import="net.indybracket.tourney.servlet.DisplayBracketBean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<html>
<head>
 <title>Tourney</title>
<link href="css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body bgcolor="#f0f0f0" onload="document.loadform.name.focus()">
<div class="loadError"><html:errors/></div>
<div class="titleGraphic"><img src="images/bball.gif" border="0" /></div>
<div class="titleBar">&nbsp;</div>
<div class="titleHeader">NCAA Bracket Challenge</div>
<div class="yourBracketsHeader">Your Brackets</div>
<div class="isValidLabel">Valid Entry</div>

<% List oBrackets = (List)session.getAttribute("mybrackets"); %>
<div class="mybracketlistbox">

  <table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr><td><% "AAA".toString(); %></td></tr>
  	<% 
	  for (int i = 0; oBrackets != null && i < oBrackets.size(); i++) { 
		DisplayBracketBean oBean = (DisplayBracketBean)oBrackets.get(i); %>
		<tr class="white">
		  <td width="75%"><a href="loadbracketaction.do?name=<%= oBean.getName() %>"><%= oBean.getName() %></a></td>
		  <td width="25%"><%= oBean.isValid() %></td>		  
		</tr>
    <%
 	  } %>
  
  </table>
</div>

</body>
</html>
