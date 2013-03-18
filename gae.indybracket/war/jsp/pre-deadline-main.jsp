<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>

<html>
<head>
 <title>Tourney</title>
<link href="css/styles.css" rel="stylesheet" type="text/css"/>
</head>

<body bgcolor="#f0f0f0">
<div class="titleGraphic"><img src="images/bball.gif" border="0" /></div>
<div class="titleBar">&nbsp;</div>
<div class="titleHeader">NCAA Bracket Challenge</div>
<div class="tourneyInfo">
<b>Entry is limited to people I know.
I reserve the right to refuse any entry before the games start.</b>
<br><br>
<b>Fee</b>: $10
<br><br>
<b>Deadline</b>:  Thursday 3/21/2013 at 11:00 a.m. EDT 
<br><br>
<b>Prize</b>: Winner takes all, I take no cut and get no discount.
<br><br>
<b>Entering</b><br>
There are no passwords this year.  Your entry is tied to your Google Account.  You'll need to create a Google Account if you don't have one.
<br><br>
On the final four tab, you will be able to Save your entry.  Choose a name that will be visible publicly and others will be able to identify.  First name + Last initial is a good option. (e.g. <b>OprahW</b>)  
<br><br>
<b>Scoring System</b>
<br>
This year's scoring system is the same as in the most recent years.  
It will be (seed + 4) * round weight for each win.  The round 
weights are listed below.  
<ul>
<li>1st Round - 2</li>
<li>2nd Round - 4</li>
<li>3rd Round - 8</li>
<li>4th Round - 16</li>
<li>5th Round - 28</li>
<li>6th Round - 50</li>
</ul>

So if you pick Kansas (#1 seed) to win their first 3 games and 
they only win their first 2, you would get 
(1+4)*2 + (1+4)*4 = 30 points for their wins.  If you pick 
Memphis (#6 seed) to win 2 games and they do, you would get 
(6+4)*2 + (6+4)*4 = 60 points for their wins.

<br><br>
There are 4 play-in games.  These don't matter.  If you pick a play-in game winner to win in the first REAL
round, you'll get points if either of the teams win.  It doesn't
matter who wins the play-in game.
<br><br>
<b>Whoever has the most points wins.</b>
<br><br>
Feel free to ask questions as always.
<br><br>Note: You can use the arrow keys to navigate through the regions
<br><br>
-- CS
</div>
<div class="newBracket"><a href="newbracket.do" class="team"><img src="images/signup.gif" border="0" /></a></div>
<div class="newBracket"><a href="newbracket.do" class="team"><img src="images/signup.gif" border="0" /></a></div>
<div class="loadBracket"><a href="loadform.do" class="team"><img src="images/load_saved.gif" border="0" /></a></div>
</form>
</body>
</html>
