<%@ page import="java.util.*" %>
<%@ page import="bracket.DisplayBracketBean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<html>
<head>
 <title>Tourney</title>
<link href="css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<%
    java.lang.String sAsc = request.getParameter("asc");
    if(sAsc == null)
    {
   		sAsc = "false";
    }
    boolean bAsc = java.lang.Boolean.parseBoolean(sAsc);
	bAsc = !bAsc;
%>
<body bgcolor="#f0f0f0">
<!--<div class="scenarios"></div>-->

<div class="titleGraphic"><img src="images/bball.gif" border="0" /></div>
<div class="titleBar">&nbsp;</div>
<div class="titleHeader">NCAA Bracket Challenge</div>
<div class="commentInfoLabel"></div>
<div class="scoreHeader">Bracket Scores</div>
<div class="scoreLabel"><a class="columnlink" href="listbracketsaction.do?sortBy=score&asc=<%= bAsc%>">Score</a></div>
<div class="maxScoreLabel"><a class="columnlink" href="listbracketsaction.do?sortBy=max&asc=<%= bAsc%>">Max</a></div>
<div class="ffAliveLabel"><a class="columnlink" href="listbracketsaction.do?sortBy=ff&asc=<%= bAsc%>">FF Alive</a></div>
<div class="winLabel"><a class="columnlink" href="listbracketsaction.do?sortBy=winner&asc=<%= bAsc%>">Winner</a></div>
<div class="beatenLabel"><a class="columnlink" href="listbracketsaction.do?sortBy=better&asc=<%= bAsc%>">Beaten By</a></div>

<% Vector oScores = (Vector)session.getAttribute("bracketscores"); %>
<div class="listbox">

  <table border="0" width="100%" cellpadding="0" cellspacing="0">
	<% int counter = 0; 
	  for (int i = 0; i<oScores.size(); i++) { 
		DisplayBracketBean oBean = (DisplayBracketBean)oScores.get(i);%>
	 <% if((counter % 2) == 0){ %>
		<tr class="white">
		  <td width="5%"><%= oBean.getRank() %></td>
		  <td width="30%"><a href="viewbracket.do?name=<%= oBean.getName() %>"><%= oBean.getName() %></a>&#160;<% if(oBean.getTotalComments() > 0){ %><font style="color:red;font-size:11px">(<%= oBean.getTotalComments() %>)</font><% } %></td>
		  <td width="7%"><%= oBean.getScore() %></td>
		  <td width="8%"><%= oBean.getMaxScore() %></td>
		  <td width="5%"><%= oBean.getNumFinalFourTeams() %></td>
		  <td width="25%" align="right">
			<% if(!(oBean.isChampionAlive())){ %><span style="text-decoration:line-through;color:red"><%= oBean.getWinner() %></span><% }else{%><%= oBean.getWinner() %><%}%>			
	        </td>
		  <td width="20%" align="right"><%= oBean.getWhoIsBetter() %></td></tr> 
	 <% } else{ %>
		<tr class="offwhite">
	  	  <td width="5%"><%= oBean.getRank() %></td>
		  <td width="30%"><a href="viewbracket.do?name=<%= oBean.getName() %>"><%= oBean.getName() %></a>&#160;<% if(oBean.getTotalComments() > 0){ %><font style="color:red;font-size:11px">(<%= oBean.getTotalComments() %>)</font><% } %></td>
		  <td width="7%"><%= oBean.getScore() %></td>
		  <td width="8%"><%= oBean.getMaxScore() %></td>
		  <td width="5%"><%= oBean.getNumFinalFourTeams() %></td>
		  <td width="25%" align="right">			
				<% if(!(oBean.isChampionAlive())){ %><span style="text-decoration:line-through;color:red"><%= oBean.getWinner() %></span><% }else{%><%= oBean.getWinner() %><%}%>
		 </td>
		  <td width="20%" align="right"><%= oBean.getWhoIsBetter() %></td></tr> 
      <%	}
		 counter++;   
 		} %>
  </table>
<br/><font style="color:green"><a href="http://www.google.com/moderator/#15/e=652f3&t=652f3.40">Questions and Comments</a></font>
</div>


</body>
</html>
