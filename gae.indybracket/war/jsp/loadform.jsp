<%@ taglib uri="/tags/struts-html" prefix="html" %>

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
<div class="bracketForm">
 <form name="loadform" action="loadbracketaction.do" method="POST">
	<table width="300">
	  <tr><td class="formLabel" width="40%">Bracket Name:</td><td align="right"> <input type="text" name="name" value=""/></td></tr>	  
	  <tr><td colspan="2" align="right"><input class="button" type="submit" value="Load Bracket"/></td></tr>
	</table>   
 </form>
</div>
</form>
</body>
</html>
