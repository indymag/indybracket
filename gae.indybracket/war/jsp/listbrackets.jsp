<%@ page import="java.util.*" %>
<%@ page import="net.indybracket.tourney.servlet.DisplayBracketBean" %>
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
		  <td class="rankCell"><%= oBean.getRank() %></td>
		  <td class="nameCell"><a href="viewbracket.do?name=<%= oBean.getName() %>"><%= oBean.getName() %></a>&#160;<% if(oBean.getTotalComments() > 0){ %><font style="color:red;font-size:11px">(<%= oBean.getTotalComments() %>)</font><% } %></td>
		  <td class="scoreCell"><%= oBean.getScore() %></td>
		  <td class="maxCell"><%= oBean.getMaxScore() %></td>
		  <td class="ffAliveCell"><%= oBean.getNumFinalFourTeams() %></td>
		  <td class="winnerCell">
			<% if(!(oBean.isChampionAlive())){ %><span style="text-decoration:line-through;color:red"><%= oBean.getWinner() %></span><% }else{%><%= oBean.getWinner() %><%}%>			
	        </td>
		  <td class="beatenByCell"><%= oBean.getWhoIsBetter() %></td></tr> 
	 <% } else{ %>
		<tr class="offwhite">
		  <td class="rankCell"><%= oBean.getRank() %></td>
		  <td class="nameCell"><a href="viewbracket.do?name=<%= oBean.getName() %>"><%= oBean.getName() %></a>&#160;<% if(oBean.getTotalComments() > 0){ %><font style="color:red;font-size:11px">(<%= oBean.getTotalComments() %>)</font><% } %></td>
		  <td class="scoreCell"><%= oBean.getScore() %></td>
		  <td class="maxCell"><%= oBean.getMaxScore() %></td>
		  <td class="ffAliveCell"><%= oBean.getNumFinalFourTeams() %></td>
		  <td class="winnerCell">
			<% if(!(oBean.isChampionAlive())){ %><span style="text-decoration:line-through;color:red"><%= oBean.getWinner() %></span><% }else{%><%= oBean.getWinner() %><%}%>			
	        </td>
		  <td class="beatenByCell"><%= oBean.getWhoIsBetter() %></td></tr> 	 
      <%	}
		 counter++;   
 		} %>
  </table>
  <br/>
   <div class="celebrityDisclaimer">
     Celebrity brackets are not included for rank or "beaten by" analysis. They are for reference only.
     <ul>
       <li><div class="celebrityLabel">Obama</div> uses President Obama's bracket. Note: Obama2016 is a real entry that used the same picks.
       <li><div class="celebrityLabel">JahnaviClass</div> is Jahnavi's 2nd grade class bracket.  The students voted for each selection as a group.
       <li><div class="celebrityLabel">538Unweighted</div> uses <a href="http://fivethirtyeight.com/features/how-fivethirtyeight-is-forecasting-the-2016-ncaa-tournament/">FiveThirtyEight's Elo ranking</a> for each prediction.
       <li><div class="celebrityLabel">538Weighted</div> uses <a href="http://projects.fivethirtyeight.com/2016-march-madness-predictions/">FiveThirtyEight's win probabilities</a> weighted against my scoring system. The team that maximizes the <a href="https://en.wikipedia.org/wiki/Expected_value">expected value</a> for points is chosen for each pick.
     </ul>
   </div>
</div>

</body>
</html>
