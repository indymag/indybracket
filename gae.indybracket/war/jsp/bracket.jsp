<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>

<html>
<head>
 <title>Tourney</title>
<link href="css/styles.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="js/jsFunctions.js"></script>
<script language="javascript">
      document.onkeyup = KeyCheck; 
      function initPage()
      {
      		var eastW = '<%= session.getAttribute("eastWinners") %>';
      		var southW = '<%= session.getAttribute("southWinners") %>';
      		var midwestW = '<%= session.getAttribute("midwestWinners") %>';
      		var westW = '<%= session.getAttribute("westWinners") %>';
      		var ffW = '<%= session.getAttribute("ffWinners") %>';
	      	populateRegions(eastW,southW,midwestW,westW,ffW,false);
	      	
	      	var sErrorCode = '<%= request.getAttribute("errorCode") %>';
	      	var sMissingRegion = '<%= request.getAttribute("missingRegion") %>';
	      	var bGoodValidate = '<%= request.getAttribute("goodValidate") %>';
	      	
      		viewBracket("east",1, sMissingRegion, sErrorCode, bGoodValidate);		
      }      
</script>
</head>

<body onLoad="initPage()">

<div id="_eastTab" class="eastTab"><a href="#" onClick="viewBracket('east',1)" class="tabLink">EAST</a></div>
<div id="_southTab" class="southTab"><a href="#" onClick="viewBracket('south',2)" class="tabLink">SOUTH</a></div>
<div id="_midwestTab" class="midwestTab"><a href="#" onClick="viewBracket('midwest',3)" class="tabLink">MIDWEST</a></div>
<div id="_westTab" class="westTab"><a href="#" onClick="viewBracket('west',4)" class="tabLink">WEST</a></div>
<div id="_ffTab" class="finalfourTab"><a href="#" onClick="viewBracket('ff',5)" class="tabLink">FINAL FOUR</a></div>
<div class="bracketBox"></div>

<div class="errors"><html:errors/></div>

<!-- <div class="randomizer">
	<a href="#" onClick="randomizer()">Random</a>
</div>
-->

<div id="bracketBars">

<!-- Bracket Horizontal Bars -->
<div class="barRound1Game1Team1"></div>
<div class="barRound1Game1Team2"></div>
<div class="barRound1Game2Team1"></div>
<div class="barRound1Game2Team2"></div>
<div class="barRound1Game3Team1"></div>
<div class="barRound1Game3Team2"></div>
<div class="barRound1Game4Team1"></div>
<div class="barRound1Game4Team2"></div>
<div class="barRound1Game5Team1"></div>
<div class="barRound1Game5Team2"></div>
<div class="barRound1Game6Team1"></div>
<div class="barRound1Game6Team2"></div>
<div class="barRound1Game7Team1"></div>
<div class="barRound1Game7Team2"></div>
<div class="barRound1Game8Team1"></div>
<div class="barRound1Game8Team2"></div>
<div class="barRound2Game1Team1"></div>
<div class="barRound2Game1Team2"></div>
<div class="barRound2Game2Team1"></div>
<div class="barRound2Game2Team2"></div>
<div class="barRound2Game3Team1"></div>
<div class="barRound2Game3Team2"></div>
<div class="barRound2Game4Team1"></div>
<div class="barRound2Game4Team2"></div>
<div class="barRound3Game1Team1"></div>
<div class="barRound3Game1Team2"></div>
<div class="barRound3Game2Team1"></div>
<div class="barRound3Game2Team2"></div>
<div class="barRound4Game1Team1"></div>
<div class="barRound4Game1Team2"></div>
<div class="barFinalFour"></div>

<!-- Bracket Vertical Bars -->
<div class="barRound1Game1"></div>
<div class="barRound1Game2"></div>
<div class="barRound1Game3"></div>
<div class="barRound1Game4"></div>
<div class="barRound1Game5"></div>
<div class="barRound1Game6"></div>
<div class="barRound1Game7"></div>
<div class="barRound1Game8"></div>
<div class="barRound2Game1"></div>
<div class="barRound2Game2"></div>
<div class="barRound2Game3"></div>
<div class="barRound2Game4"></div>
<div class="barRound3Game1"></div>
<div class="barRound3Game2"></div>
<div class="barRound4"></div>

<!-- Seedings -->
<div class="seed1">1.</div>
<div class="seed2">2.</div>
<div class="seed3">3.</div>
<div class="seed4">4.</div>
<div class="seed5">5.</div>
<div class="seed6">6.</div>
<div class="seed7">7.</div>
<div class="seed8">8.</div>
<div class="seed9">9.</div>
<div class="seed10">10.</div>
<div class="seed11">11.</div>
<div class="seed12">12.</div>
<div class="seed13">13.</div>
<div class="seed14">14.</div>
<div class="seed15">15.</div>
<div class="seed16">16.</div>
</div>

<!- EAST DIV -->
<div id="eastBracket" style="display:none">
<!-- East Round 1 matchups -->
<div class="round1Game1Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed1Value"/>','1','false')"><bean:message key="eastSeed1Label"/></a>
</div>
<div class="round1Game1Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed16Value"/>','1','false')"><bean:message key="eastSeed16Label"/></a>
</div>
<div class="round1Game2Team1">
  <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed8Value"/>','2','false')"><bean:message key="eastSeed8Label"/></a>
</div>
<div class="round1Game2Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed9Value"/>','2','false')"><bean:message key="eastSeed9Label"/></a>
</div>
<div class="round1Game3Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed5Value"/>','3','false')"><bean:message key="eastSeed5Label"/></a>
</div>
<div class="round1Game3Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed12Value"/>','3','false')"><bean:message key="eastSeed12Label"/></a>
</div>
<div class="round1Game4Team1">
<a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed4Value"/>','4','false')"><bean:message key="eastSeed4Label"/></a>
</div>
<div class="round1Game4Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed13Value"/>','4','false')"><bean:message key="eastSeed13Label"/></a>
</div>
<div class="round1Game5Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed6Value"/>','5','false')"><bean:message key="eastSeed6Label"/></a>
</div>
<div class="round1Game5Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed11Value"/>','5','false')"><bean:message key="eastSeed11Label"/></a>
</div>
<div class="round1Game6Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed3Value"/>','6','false')"><bean:message key="eastSeed3Label"/></a>
</div>
<div class="round1Game6Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed14Value"/>','6','false')"><bean:message key="eastSeed14Label"/></a>
</div>
<div class="round1Game7Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed7Value"/>','7','false')"><bean:message key="eastSeed7Label"/></a>
</div>
<div class="round1Game7Team2"> 
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed10Value"/>','7','false')"><bean:message key="eastSeed10Label"/></a>
</div>
<div class="round1Game8Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed2Value"/>','8','false')"><bean:message key="eastSeed2Label"/></a>
</div>
<div class="round1Game8Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed15Value"/>','8','false')"><bean:message key="eastSeed15Label"/></a>
</div>


<!-- East Region #1 - <bean:message key="eastSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="eastSeed1Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed1Value"/>-2','9','false')"><bean:message key="eastSeed1Label"/></a>
</div>
<!-- East Region #1 - <bean:message key="eastSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed1Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed1Value"/>-3','13','false')"><bean:message key="eastSeed1Label"/></a>
</div>
<!-- East Region #1 - <bean:message key="eastSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed1Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed1Value"/>-4','15','false')"><bean:message key="eastSeed1Label"/></a>
</div>
<!-- East Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed1Label"/>-4">
  <bean:message key="eastSeed1Label"/>
</div>


<!-- East Region #16 - <bean:message key="eastSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="eastSeed16Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed16Value"/>-2','9','false')"><bean:message key="eastSeed16Label"/></a>
</div>

<!-- East Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed16Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed16Value"/>-3','13','false')"><bean:message key="eastSeed16Label"/></a>
</div>

<!-- East Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="eastSeed16Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed16Value"/>-4','15','false')"><bean:message key="eastSeed16Label"/></a>
</div>

<!-- East Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed16Label"/>-4" >
  <bean:message key="eastSeed16Label"/>
</div>



<!-- East Region #8 - <bean:message key="eastSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="eastSeed8Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed8Value"/>-2','9','false')"><bean:message key="eastSeed8Label"/></a>
</div>

<!-- East Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed8Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed8Value"/>-3','13','false')"><bean:message key="eastSeed8Label"/></a>
</div>

<!-- East Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="eastSeed8Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed8Value"/>-4','15','false')"><bean:message key="eastSeed8Label"/></a>
</div>

<!-- East Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed8Label"/>-4" >
 <bean:message key="eastSeed8Label"/>
</div>


<!-- East Region #9 - <bean:message key="eastSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="eastSeed9Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed9Value"/>-2','9','false')"><bean:message key="eastSeed9Label"/></a>
</div>

<!-- East Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed9Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed9Value"/>-3','13','false')"><bean:message key="eastSeed9Label"/></a>
</div>

<!-- East Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed9Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed9Value"/>-4','15','false')"><bean:message key="eastSeed9Label"/></a>
</div>


<!-- East Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed9Label"/>-4" >
 <bean:message key="eastSeed9Label"/>
</div>


<!-- East Region #5 - <bean:message key="eastSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="eastSeed5Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed5Value"/>-2','10','false')"><bean:message key="eastSeed5Label"/></a>
</div>


<!-- East Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed5Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed5Value"/>-3','13','false')"><bean:message key="eastSeed5Label"/></a>
</div>


<!-- East Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed5Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed5Value"/>-4','15','false')"><bean:message key="eastSeed5Label"/></a>
</div>


<!-- East Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed5Label"/>-4" >
<bean:message key="eastSeed5Label"/>
</div>


<!-- East Region #12 - <bean:message key="eastSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="eastSeed12Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed12Value"/>-2','10','false')"><bean:message key="eastSeed12Label"/></a>
</div>


<!-- East Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed12Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed12Value"/>-3','13','false')"><bean:message key="eastSeed12Label"/></a>
</div>


<!-- East Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed12Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed12Value"/>-4','15','false')"><bean:message key="eastSeed12Label"/></a>
</div>


<!-- East Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed12Label"/>-4" >
 <bean:message key="eastSeed12Label"/>
</div>


<!-- East Region #4 - <bean:message key="eastSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="eastSeed4Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed4Value"/>-2','10','false')"><bean:message key="eastSeed4Label"/></a>
</div>

<!-- East Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed4Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed4Value"/>-3','13','false')"><bean:message key="eastSeed4Label"/></a>
</div>

<!-- East Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed4Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed4Value"/>-4','15','false')"><bean:message key="eastSeed4Label"/></a>
</div>

<!-- East Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed4Label"/>-4" >
 <bean:message key="eastSeed4Label"/>
</div>


<!-- East Region #13 - <bean:message key="eastSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="eastSeed13Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed13Value"/>-2','10','false')"><bean:message key="eastSeed13Label"/></a>
</div>

<!-- East Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed13Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed13Value"/>-3','13','false')"><bean:message key="eastSeed13Label"/></a>
</div>

<!-- East Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed13Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed13Value"/>-4','15','false')"><bean:message key="eastSeed13Label"/></a>
</div>

<!-- East Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed13Label"/>-4" >
 <bean:message key="eastSeed13Label"/>
</div>


<!-- East Region #6 - <bean:message key="eastSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="eastSeed6Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed6Value"/>-2','11','false')"><bean:message key="eastSeed6Label"/></a>
</div>

<!-- East Region #6 - <bean:message key="eastSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed6Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed6Value"/>-3','14','false')"><bean:message key="eastSeed6Label"/></a>
</div>

<!-- East Region #6 - <bean:message key="eastSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed6Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed6Value"/>-4','15','false')"><bean:message key="eastSeed6Label"/></a>
</div>

<!-- East Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed6Label"/>-4" >
<bean:message key="eastSeed6Label"/>
</div>


<!-- East Region #11 - <bean:message key="eastSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="eastSeed11Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed11Value"/>-2','11','false')"><bean:message key="eastSeed11Label"/></a>
</div>

<!-- East Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed11Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed11Value"/>-3','14','false')"><bean:message key="eastSeed11Label"/></a>
</div>

<!-- East Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed11Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed11Value"/>-4','15','false')"><bean:message key="eastSeed11Label"/></a>
</div>

<!-- East Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed11Label"/>-4" >
<bean:message key="eastSeed11Label"/>
</div>



<!-- East Region #3 - <bean:message key="eastSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="eastSeed3Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed3Value"/>-2','11','false')"><bean:message key="eastSeed3Label"/></a>
</div>

<!-- East Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed3Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed3Value"/>-3','14','false')"><bean:message key="eastSeed3Label"/></a>
</div>

<!-- East Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed3Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed3Value"/>-4','15','false')"><bean:message key="eastSeed3Label"/></a>
</div>

<!-- East Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed3Label"/>-4" >
 <bean:message key="eastSeed3Label"/>
</div>


<!-- East Region #14 - <bean:message key="eastSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="eastSeed14Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed14Value"/>-2','11','false')"><bean:message key="eastSeed14Label"/></a>
</div>

<!-- East Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed14Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed14Value"/>-3','14','false')"><bean:message key="eastSeed14Label"/></a>
</div>

<!-- East Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed14Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed14Value"/>-4','15','false')"><bean:message key="eastSeed14Label"/></a>
</div>

<!-- East Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed14Label"/>-4" >
 <bean:message key="eastSeed14Label"/>
</div>


<!-- East Region #7 - <bean:message key="eastSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="eastSeed7Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed7Value"/>-2','12','false')"><bean:message key="eastSeed7Label"/></a>
</div>

<!-- East Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed7Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed7Value"/>-3','14','false')"><bean:message key="eastSeed7Label"/></a>
</div>

<!-- East Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed7Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed7Value"/>-4','15','false')"><bean:message key="eastSeed7Label"/></a>
</div>

<!-- East Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed7Label"/>-4" >
 <bean:message key="eastSeed7Label"/>
</div>


<!-- East Region #10 - <bean:message key="eastSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="eastSeed10Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed10Value"/>-2','12','false')"><bean:message key="eastSeed10Label"/></a>
</div>

<!-- East Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed10Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed10Value"/>-3','14','false')"><bean:message key="eastSeed10Label"/></a>
</div>

<!-- East Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed10Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed10Value"/>-4','15','false')"><bean:message key="eastSeed10Label"/></a>
</div>

<!-- East Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed10Label"/>-4" >
 <bean:message key="eastSeed10Label"/>
</div>


<!-- East Region #2 - <bean:message key="eastSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="eastSeed2Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed2Value"/>-2','12','false')"><bean:message key="eastSeed2Label"/></a>
</div>

<!-- East Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed2Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed2Value"/>-3','14','false')"><bean:message key="eastSeed2Label"/></a>
</div>

<!-- East Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed2Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed2Value"/>-4','15','false')"><bean:message key="eastSeed2Label"/></a>
</div>

<!-- East Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed2Label"/>-4" >
 <bean:message key="eastSeed2Label"/>
</div>


<!-- East Region #15 - <bean:message key="eastSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="eastSeed15Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed15Value"/>-2','12','false')"><bean:message key="eastSeed15Label"/></a>
</div>

<!-- East Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed15Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed15Value"/>-3','14','false')"><bean:message key="eastSeed15Label"/></a>
</div>

<!-- East Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed15Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="eastSeed15Value"/>-4','15','false')"><bean:message key="eastSeed15Label"/></a>
</div>

<!-- East Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed15Label"/>-4" >
 <bean:message key="eastSeed15Label"/>
</div>
</div>

<!- SOUTH Bracket -->
<div id="southBracket" style="display:none">
<!-- South Round 1 matchups --> <div class="round1Game1Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed1Value"/>','1','false')"><bean:message key="southSeed1Label"/></a>
</div> <div class="round1Game1Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed16Value"/>','1','false')"><bean:message key="southSeed16Label"/></a>
</div> <div class="round1Game2Team1">
  <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed8Value"/>','2','false')"><bean:message key="southSeed8Label"/></a>
</div> <div class="round1Game2Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed9Value"/>','2','false')"><bean:message key="southSeed9Label"/></a>
</div> <div class="round1Game3Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed5Value"/>','3','false')"><bean:message key="southSeed5Label"/></a>
</div>
<div class="round1Game3Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed12Value"/>','3','false')"><bean:message key="southSeed12Label"/></a>
</div>
<div class="round1Game4Team1">
<a href="#" class="team" onClick="setWinner('<bean:message key="southSeed4Value"/>','4','false')"><bean:message key="southSeed4Label"/></a>
</div>
<div class="round1Game4Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed13Value"/>','4','false')"><bean:message key="southSeed13Label"/></a>
</div>
<div class="round1Game5Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed6Value"/>','5','false')"><bean:message key="southSeed6Label"/></a>
</div>
<div class="round1Game5Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed11Value"/>','5','false')"><bean:message key="southSeed11Label"/></a>
</div>
<div class="round1Game6Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed3Value"/>','6','false')"><bean:message key="southSeed3Label"/></a>
</div>
<div class="round1Game6Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed14Value"/>','6','false')"><bean:message key="southSeed14Label"/></a>
</div>
<div class="round1Game7Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed7Value"/>','7','false')"><bean:message key="southSeed7Label"/></a>
</div>
<div class="round1Game7Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed10Value"/>','7','false')"><bean:message key="southSeed10Label"/></a>
</div>
<div class="round1Game8Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed2Value"/>','8','false')"><bean:message key="southSeed2Label"/></a>
</div>
<div class="round1Game8Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed15Value"/>','8','false')"><bean:message key="southSeed15Label"/></a>
</div>


<!-- South Region #1 - <bean:message key="southSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="southSeed1Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed1Value"/>-2','9','false')"><bean:message key="southSeed1Label"/></a>
</div>
<!-- South Region #1 - <bean:message key="southSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed1Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed1Value"/>-3','13','false')"><bean:message key="southSeed1Label"/></a>
</div>
<!-- South Region #1 - <bean:message key="southSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed1Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed1Value"/>-4','15','false')"><bean:message key="southSeed1Label"/></a>
</div>
<!-- South Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed1Label"/>-4">
  <bean:message key="southSeed1Label"/>
</div>


<!-- South Region #16 - <bean:message key="southSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="southSeed16Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed16Value"/>-2','9','false')"><bean:message key="southSeed16Label"/></a>
</div>

<!-- South Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed16Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed16Value"/>-3','13','false')"><bean:message key="southSeed16Label"/></a>
</div>


<!-- South Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="southSeed16Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed16Value"/>-4','15','false')"><bean:message key="southSeed16Label"/></a>
</div>

<!-- South Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed16Label"/>-4" >
  <bean:message key="southSeed16Label"/>
</div>



<!-- South Region #8 - <bean:message key="southSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="southSeed8Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed8Value"/>-2','9','false')"><bean:message key="southSeed8Label"/></a>
</div>

<!-- South Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed8Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed8Value"/>-3','13','false')"><bean:message key="southSeed8Label"/></a>
</div>

<!-- South Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="southSeed8Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed8Value"/>-4','15','false')"><bean:message key="southSeed8Label"/></a>
</div>

<!-- South Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed8Label"/>-4" >
 <bean:message key="southSeed8Label"/>
</div>

<!-- South Region #9 - <bean:message key="southSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="southSeed9Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed9Value"/>-2','9','false')"><bean:message key="southSeed9Label"/></a>
</div>

<!-- South Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed9Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed9Value"/>-3','13','false')"><bean:message key="southSeed9Label"/></a>
</div>

<!-- South Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed9Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed9Value"/>-4','15','false')"><bean:message key="southSeed9Label"/></a>
</div>


<!-- South Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed9Label"/>-4" >
 <bean:message key="southSeed9Label"/>
</div>


<!-- South Region #5 - <bean:message key="southSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="southSeed5Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed5Value"/>-2','10','false')"><bean:message key="southSeed5Label"/></a>
</div>


<!-- South Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed5Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed5Value"/>-3','13','false')"><bean:message key="southSeed5Label"/></a>
</div>
<!-- South Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed5Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed5Value"/>-4','15','false')"><bean:message key="southSeed5Label"/></a>
</div>


<!-- South Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed5Label"/>-4" >
<bean:message key="southSeed5Label"/>
</div>


<!-- South Region #12 - <bean:message key="southSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="southSeed12Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed12Value"/>-2','10','false')"><bean:message key="southSeed12Label"/></a>
</div>


<!-- South Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed12Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed12Value"/>-3','13','false')"><bean:message key="southSeed12Label"/></a>
</div>


<!-- South Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed12Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed12Value"/>-4','15','false')"><bean:message key="southSeed12Label"/></a>
</div>

<!-- South Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed12Label"/>-4" >
 <bean:message key="southSeed12Label"/>
</div>


<!-- South Region #4 - <bean:message key="southSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="southSeed4Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed4Value"/>-2','10','false')"><bean:message key="southSeed4Label"/></a>
</div>

<!-- South Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed4Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed4Value"/>-3','13','false')"><bean:message key="southSeed4Label"/></a>
</div>

<!-- South Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed4Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed4Value"/>-4','15','false')"><bean:message key="southSeed4Label"/></a>
</div>

<!-- South Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed4Label"/>-4" >
 <bean:message key="southSeed4Label"/>
</div>


<!-- South Region #13 - <bean:message key="southSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="southSeed13Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed13Value"/>-2','10','false')"><bean:message key="southSeed13Label"/></a>
</div>


<!-- South Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed13Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed13Value"/>-3','13','false')"><bean:message key="southSeed13Label"/></a>
</div>

<!-- South Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed13Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed13Value"/>-4','15','false')"><bean:message key="southSeed13Label"/></a>
</div>

<!-- South Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed13Label"/>-4" >
 <bean:message key="southSeed13Label"/>
</div>


<!-- South Region #6 - <bean:message key="southSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="southSeed6Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed6Value"/>-2','11','false')"><bean:message key="southSeed6Label"/></a>
</div>

<!-- South Region #6 - <bean:message key="southSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed6Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed6Value"/>-3','14','false')"><bean:message key="southSeed6Label"/></a>
</div>

<!-- South Region #6 - <bean:message key="southSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed6Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed6Value"/>-4','15','false')"><bean:message key="southSeed6Label"/></a>
</div>

<!-- South Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed6Label"/>-4" >
<bean:message key="southSeed6Label"/>
</div>


<!-- South Region #11 - <bean:message key="southSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="southSeed11Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed11Value"/>-2','11','false')"><bean:message key="southSeed11Label"/></a>
</div>

<!-- South Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed11Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed11Value"/>-3','14','false')"><bean:message key="southSeed11Label"/></a>
</div>

<!-- South Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed11Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed11Value"/>-4','15','false')"><bean:message key="southSeed11Label"/></a>
</div>

<!-- South Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed11Label"/>-4" >
<bean:message key="southSeed11Label"/>
</div>



<!-- South Region #3 - <bean:message key="southSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="southSeed3Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed3Value"/>-2','11','false')"><bean:message key="southSeed3Label"/></a>
</div>


<!-- South Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed3Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed3Value"/>-3','14','false')"><bean:message key="southSeed3Label"/></a>
</div>

<!-- South Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed3Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed3Value"/>-4','15','false')"><bean:message key="southSeed3Label"/></a>
</div>

<!-- South Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed3Label"/>-4" >
 <bean:message key="southSeed3Label"/>
</div>


<!-- South Region #14 - <bean:message key="southSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="southSeed14Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed14Value"/>-2','11','false')"><bean:message key="southSeed14Label"/></a>
</div>

<!-- South Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed14Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed14Value"/>-3','14','false')"><bean:message key="southSeed14Label"/></a>
</div>

<!-- South Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed14Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed14Value"/>-4','15','false')"><bean:message key="southSeed14Label"/></a>
</div>




<!-- South Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed14Label"/>-4" >
 <bean:message key="southSeed14Label"/>
</div>


<!-- South Region #7 - <bean:message key="southSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="southSeed7Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed7Value"/>-2','12','false')"><bean:message key="southSeed7Label"/></a>
</div>

<!-- South Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed7Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed7Value"/>-3','14','false')"><bean:message key="southSeed7Label"/></a>
</div>

<!-- South Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed7Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed7Value"/>-4','15','false')"><bean:message key="southSeed7Label"/></a>
</div>

<!-- South Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed7Label"/>-4" >
 <bean:message key="southSeed7Label"/>
</div>


<!-- South Region #10 - <bean:message key="southSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="southSeed10Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed10Value"/>-2','12','false')"><bean:message key="southSeed10Label"/></a>
</div>



<!-- South Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed10Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed10Value"/>-3','14','false')"><bean:message key="southSeed10Label"/></a>
</div>

<!-- South Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed10Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed10Value"/>-4','15','false')"><bean:message key="southSeed10Label"/></a>
</div>

<!-- South Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed10Label"/>-4" >
 <bean:message key="southSeed10Label"/>
</div>


<!-- South Region #2 - <bean:message key="southSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="southSeed2Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed2Value"/>-2','12','false')"><bean:message key="southSeed2Label"/></a>
</div>

<!-- South Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed2Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed2Value"/>-3','14','false')"><bean:message key="southSeed2Label"/></a>
</div>

<!-- South Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed2Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed2Value"/>-4','15','false')"><bean:message key="southSeed2Label"/></a>
</div>


<!-- South Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed2Label"/>-4" >
 <bean:message key="southSeed2Label"/>
</div>


<!-- South Region #15 - <bean:message key="southSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="southSeed15Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed15Value"/>-2','12','false')"><bean:message key="southSeed15Label"/></a>
</div>

<!-- South Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed15Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed15Value"/>-3','14','false')"><bean:message key="southSeed15Label"/></a>
</div>

<!-- South Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed15Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="southSeed15Value"/>-4','15','false')"><bean:message key="southSeed15Label"/></a>
</div>

<!-- South Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed15Label"/>-4" >
 <bean:message key="southSeed15Label"/>
</div>
</div>
<div id="midwestBracket" style="display:none">
<!-- midwest Round 1 matchups -->
<div class="round1Game1Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed1Value"/>','1','false')"><bean:message key="midwestSeed1Label"/></a>
</div>
<div class="round1Game1Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed16Value"/>','1','false')"><bean:message key="midwestSeed16Label"/></a>
</div>
<div class="round1Game2Team1">
  <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed8Value"/>','2','false')"><bean:message key="midwestSeed8Label"/></a>
</div>
<div class="round1Game2Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed9Value"/>','2','false')"><bean:message key="midwestSeed9Label"/></a>
</div>
<div class="round1Game3Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed5Value"/>','3','false')"><bean:message key="midwestSeed5Label"/></a>
</div>
<div class="round1Game3Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed12Value"/>','3','false')"><bean:message key="midwestSeed12Label"/></a>
</div>
<div class="round1Game4Team1">
<a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed4Value"/>','4','false')"><bean:message key="midwestSeed4Label"/></a>
</div>
<div class="round1Game4Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed13Value"/>','4','false')"><bean:message key="midwestSeed13Label"/></a>
</div>
<div class="round1Game5Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed6Value"/>','5','false')"><bean:message key="midwestSeed6Label"/></a>
</div>
<div class="round1Game5Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed11Value"/>','5','false')"><bean:message key="midwestSeed11Label"/></a>
</div>
<div class="round1Game6Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed3Value"/>','6','false')"><bean:message key="midwestSeed3Label"/></a>
</div>
<div class="round1Game6Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed14Value"/>','6','false')"><bean:message key="midwestSeed14Label"/></a>
</div>
<div class="round1Game7Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed7Value"/>','7','false')"><bean:message key="midwestSeed7Label"/></a>
</div>
<div class="round1Game7Team2"> 
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed10Value"/>','7','false')"><bean:message key="midwestSeed10Label"/></a>
</div>
<div class="round1Game8Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed2Value"/>','8','false')"><bean:message key="midwestSeed2Label"/></a>
</div>
<div class="round1Game8Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed15Value"/>','8','false')"><bean:message key="midwestSeed15Label"/></a>
</div>


<!-- midwest Region #1 - <bean:message key="midwestSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="midwestSeed1Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed1Value"/>-2','9','false')"><bean:message key="midwestSeed1Label"/></a>
</div>
<!-- midwest Region #1 - <bean:message key="midwestSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed1Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed1Value"/>-3','13','false')"><bean:message key="midwestSeed1Label"/></a>
</div>
<!-- midwest Region #1 - <bean:message key="midwestSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed1Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed1Value"/>-4','15','false')"><bean:message key="midwestSeed1Label"/></a>
</div>
<!-- midwest Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed1Label"/>-4">
  <bean:message key="midwestSeed1Label"/>
</div>


<!-- midwest Region #16 - <bean:message key="midwestSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="midwestSeed16Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed16Value"/>-2','9','false')"><bean:message key="midwestSeed16Label"/></a>
</div>

<!-- midwest Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed16Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed16Value"/>-3','13','false')"><bean:message key="midwestSeed16Label"/></a>
</div>

<!-- midwest Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed16Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed16Value"/>-4','15','false')"><bean:message key="midwestSeed16Label"/></a>
</div>

<!-- midwest Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed16Label"/>-4" >
  <bean:message key="midwestSeed16Label"/>
</div>



<!-- midwest Region #8 - <bean:message key="midwestSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="midwestSeed8Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed8Value"/>-2','9','false')"><bean:message key="midwestSeed8Label"/></a>
</div>

<!-- midwest Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed8Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed8Value"/>-3','13','false')"><bean:message key="midwestSeed8Label"/></a>
</div>

<!-- midwest Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed8Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed8Value"/>-4','15','false')"><bean:message key="midwestSeed8Label"/></a>
</div>

<!-- midwest Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed8Label"/>-4" >
 <bean:message key="midwestSeed8Label"/>
</div>


<!-- midwest Region #9 - <bean:message key="midwestSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="midwestSeed9Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed9Value"/>-2','9','false')"><bean:message key="midwestSeed9Label"/></a>
</div>

<!-- midwest Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed9Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed9Value"/>-3','13','false')"><bean:message key="midwestSeed9Label"/></a>
</div>

<!-- midwest Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed9Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed9Value"/>-4','15','false')"><bean:message key="midwestSeed9Label"/></a>
</div>


<!-- midwest Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed9Label"/>-4" >
 <bean:message key="midwestSeed9Label"/>
</div>


<!-- midwest Region #5 - <bean:message key="midwestSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="midwestSeed5Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed5Value"/>-2','10','false')"><bean:message key="midwestSeed5Label"/></a>
</div>


<!-- midwest Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed5Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed5Value"/>-3','13','false')"><bean:message key="midwestSeed5Label"/></a>
</div>


<!-- midwest Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed5Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed5Value"/>-4','15','false')"><bean:message key="midwestSeed5Label"/></a>
</div>


<!-- midwest Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed5Label"/>-4" >
<bean:message key="midwestSeed5Label"/>
</div>


<!-- midwest Region #12 - <bean:message key="midwestSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="midwestSeed12Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed12Value"/>-2','10','false')"><bean:message key="midwestSeed12Label"/></a>
</div>


<!-- midwest Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed12Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed12Value"/>-3','13','false')"><bean:message key="midwestSeed12Label"/></a>
</div>


<!-- midwest Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed12Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed12Value"/>-4','15','false')"><bean:message key="midwestSeed12Label"/></a>
</div>


<!-- midwest Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed12Label"/>-4" >
 <bean:message key="midwestSeed12Label"/>
</div>


<!-- midwest Region #4 - <bean:message key="midwestSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="midwestSeed4Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed4Value"/>-2','10','false')"><bean:message key="midwestSeed4Label"/></a>
</div>

<!-- midwest Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed4Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed4Value"/>-3','13','false')"><bean:message key="midwestSeed4Label"/></a>
</div>

<!-- midwest Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed4Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed4Value"/>-4','15','false')"><bean:message key="midwestSeed4Label"/></a>
</div>

<!-- midwest Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed4Label"/>-4" >
 <bean:message key="midwestSeed4Label"/>
</div>


<!-- midwest Region #13 - <bean:message key="midwestSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="midwestSeed13Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed13Value"/>-2','10','false')"><bean:message key="midwestSeed13Label"/></a>
</div>

<!-- midwest Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed13Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed13Value"/>-3','13','false')"><bean:message key="midwestSeed13Label"/></a>
</div>

<!-- midwest Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed13Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed13Value"/>-4','15','false')"><bean:message key="midwestSeed13Label"/></a>
</div>

<!-- midwest Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed13Label"/>-4" >
 <bean:message key="midwestSeed13Label"/>
</div>


<!-- midwest Region #6 - <bean:message key="midwestSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="midwestSeed6Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed6Value"/>-2','11','false')"><bean:message key="midwestSeed6Label"/></a>
</div>

<!-- midwest Region #6 - <bean:message key="midwestSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed6Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed6Value"/>-3','14','false')"><bean:message key="midwestSeed6Label"/></a>
</div>

<!-- midwest Region #6 - <bean:message key="midwestSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed6Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed6Value"/>-4','15','false')"><bean:message key="midwestSeed6Label"/></a>
</div>

<!-- midwest Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed6Label"/>-4" >
<bean:message key="midwestSeed6Label"/>
</div>


<!-- midwest Region #11 - <bean:message key="midwestSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="midwestSeed11Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed11Value"/>-2','11','false')"><bean:message key="midwestSeed11Label"/></a>
</div>

<!-- midwest Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed11Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed11Value"/>-3','14','false')"><bean:message key="midwestSeed11Label"/></a>
</div>

<!-- midwest Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed11Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed11Value"/>-4','15','false')"><bean:message key="midwestSeed11Label"/></a>
</div>

<!-- midwest Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed11Label"/>-4" >
<bean:message key="midwestSeed11Label"/>
</div>



<!-- midwest Region #3 - <bean:message key="midwestSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="midwestSeed3Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed3Value"/>-2','11','false')"><bean:message key="midwestSeed3Label"/></a>
</div>

<!-- midwest Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed3Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed3Value"/>-3','14','false')"><bean:message key="midwestSeed3Label"/></a>
</div>

<!-- midwest Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed3Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed3Value"/>-4','15','false')"><bean:message key="midwestSeed3Label"/></a>
</div>

<!-- midwest Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed3Label"/>-4" >
 <bean:message key="midwestSeed3Label"/>
</div>


<!-- midwest Region #14 - <bean:message key="midwestSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="midwestSeed14Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed14Value"/>-2','11','false')"><bean:message key="midwestSeed14Label"/></a>
</div>

<!-- midwest Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed14Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed14Value"/>-3','14','false')"><bean:message key="midwestSeed14Label"/></a>
</div>

<!-- midwest Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed14Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed14Value"/>-4','15','false')"><bean:message key="midwestSeed14Label"/></a>
</div>

<!-- midwest Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed14Label"/>-4" >
 <bean:message key="midwestSeed14Label"/>
</div>


<!-- midwest Region #7 - <bean:message key="midwestSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="midwestSeed7Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed7Value"/>-2','12','false')"><bean:message key="midwestSeed7Label"/></a>
</div>

<!-- midwest Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed7Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed7Value"/>-3','14','false')"><bean:message key="midwestSeed7Label"/></a>
</div>

<!-- midwest Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed7Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed7Value"/>-4','15','false')"><bean:message key="midwestSeed7Label"/></a>
</div>

<!-- midwest Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed7Label"/>-4" >
 <bean:message key="midwestSeed7Label"/>
</div>


<!-- midwest Region #10 - <bean:message key="midwestSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="midwestSeed10Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed10Value"/>-2','12','false')"><bean:message key="midwestSeed10Label"/></a>
</div>

<!-- midwest Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed10Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed10Value"/>-3','14','false')"><bean:message key="midwestSeed10Label"/></a>
</div>

<!-- midwest Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed10Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed10Value"/>-4','15','false')"><bean:message key="midwestSeed10Label"/></a>
</div>

<!-- midwest Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed10Label"/>-4" >
 <bean:message key="midwestSeed10Label"/>
</div>


<!-- midwest Region #2 - <bean:message key="midwestSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="midwestSeed2Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed2Value"/>-2','12','false')"><bean:message key="midwestSeed2Label"/></a>
</div>

<!-- midwest Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed2Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed2Value"/>-3','14','false')"><bean:message key="midwestSeed2Label"/></a>
</div>

<!-- midwest Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed2Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed2Value"/>-4','15','false')"><bean:message key="midwestSeed2Label"/></a>
</div>

<!-- midwest Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed2Label"/>-4" >
 <bean:message key="midwestSeed2Label"/>
</div>


<!-- midwest Region #15 - <bean:message key="midwestSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="midwestSeed15Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed15Value"/>-2','12','false')"><bean:message key="midwestSeed15Label"/></a>
</div>

<!-- midwest Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed15Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed15Value"/>-3','14','false')"><bean:message key="midwestSeed15Label"/></a>
</div>

<!-- midwest Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed15Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="midwestSeed15Value"/>-4','15','false')"><bean:message key="midwestSeed15Label"/></a>
</div>

<!-- midwest Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed15Label"/>-4" >
 <bean:message key="midwestSeed15Label"/>
</div>
</div>
<div id="westBracket" style="display:none">
<!-- west Round 1 matchups -->
<div class="round1Game1Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed1Value"/>','1','false')"><bean:message key="westSeed1Label"/></a>
</div>
<div class="round1Game1Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed16Value"/>','1','false')"><bean:message key="westSeed16Label"/></a>
</div>
<div class="round1Game2Team1">
  <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed8Value"/>','2','false')"><bean:message key="westSeed8Label"/></a>
</div>
<div class="round1Game2Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed9Value"/>','2','false')"><bean:message key="westSeed9Label"/></a>
</div>
<div class="round1Game3Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed5Value"/>','3','false')"><bean:message key="westSeed5Label"/></a>
</div>
<div class="round1Game3Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed12Value"/>','3','false')"><bean:message key="westSeed12Label"/></a>
</div>
<div class="round1Game4Team1">
<a href="#" class="team" onClick="setWinner('<bean:message key="westSeed4Value"/>','4','false')"><bean:message key="westSeed4Label"/></a>
</div>
<div class="round1Game4Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed13Value"/>','4','false')"><bean:message key="westSeed13Label"/></a>
</div>
<div class="round1Game5Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed6Value"/>','5','false')"><bean:message key="westSeed6Label"/></a>
</div>
<div class="round1Game5Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed11Value"/>','5','false')"><bean:message key="westSeed11Label"/></a>
</div>
<div class="round1Game6Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed3Value"/>','6','false')"><bean:message key="westSeed3Label"/></a>
</div>
<div class="round1Game6Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed14Value"/>','6','false')"><bean:message key="westSeed14Label"/></a>
</div>
<div class="round1Game7Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed7Value"/>','7','false')"><bean:message key="westSeed7Label"/></a>
</div>
<div class="round1Game7Team2"> 
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed10Value"/>','7','false')"><bean:message key="westSeed10Label"/></a>
</div>
<div class="round1Game8Team1">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed2Value"/>','8','false')"><bean:message key="westSeed2Label"/></a>
</div>
<div class="round1Game8Team2">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed15Value"/>','8','false')"><bean:message key="westSeed15Label"/></a>
</div>


<!-- west Region #1 - <bean:message key="westSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="westSeed1Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed1Value"/>-2','9','false')"><bean:message key="westSeed1Label"/></a>
</div>
<!-- west Region #1 - <bean:message key="westSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed1Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed1Value"/>-3','13','false')"><bean:message key="westSeed1Label"/></a>
</div>
<!-- west Region #1 - <bean:message key="westSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed1Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed1Value"/>-4','15','false')"><bean:message key="westSeed1Label"/></a>
</div>
<!-- west Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed1Label"/>-4">
  <bean:message key="westSeed1Label"/>
</div>


<!-- west Region #16 - <bean:message key="westSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="westSeed16Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed16Value"/>-2','9','false')"><bean:message key="westSeed16Label"/></a>
</div>

<!-- west Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed16Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed16Value"/>-3','13','false')"><bean:message key="westSeed16Label"/></a>
</div>

<!-- west Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="westSeed16Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed16Value"/>-4','15','false')"><bean:message key="westSeed16Label"/></a>
</div>

<!-- west Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed16Label"/>-4" >
  <bean:message key="westSeed16Label"/>
</div>



<!-- west Region #8 - <bean:message key="westSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="westSeed8Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed8Value"/>-2','9','false')"><bean:message key="westSeed8Label"/></a>
</div>

<!-- west Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed8Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed8Value"/>-3','13','false')"><bean:message key="westSeed8Label"/></a>
</div>

<!-- west Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="westSeed8Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed8Value"/>-4','15','false')"><bean:message key="westSeed8Label"/></a>
</div>

<!-- west Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed8Label"/>-4" >
 <bean:message key="westSeed8Label"/>
</div>


<!-- west Region #9 - <bean:message key="westSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="westSeed9Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed9Value"/>-2','9','false')"><bean:message key="westSeed9Label"/></a>
</div>

<!-- west Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed9Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed9Value"/>-3','13','false')"><bean:message key="westSeed9Label"/></a>
</div>

<!-- west Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed9Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed9Value"/>-4','15','false')"><bean:message key="westSeed9Label"/></a>
</div>


<!-- west Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed9Label"/>-4" >
 <bean:message key="westSeed9Label"/>
</div>


<!-- west Region #5 - <bean:message key="westSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="westSeed5Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed5Value"/>-2','10','false')"><bean:message key="westSeed5Label"/></a>
</div>


<!-- west Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed5Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed5Value"/>-3','13','false')"><bean:message key="westSeed5Label"/></a>
</div>


<!-- west Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed5Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed5Value"/>-4','15','false')"><bean:message key="westSeed5Label"/></a>
</div>


<!-- west Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed5Label"/>-4" >
<bean:message key="westSeed5Label"/>
</div>


<!-- west Region #12 - <bean:message key="westSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="westSeed12Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed12Value"/>-2','10','false')"><bean:message key="westSeed12Label"/></a>
</div>


<!-- west Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed12Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed12Value"/>-3','13','false')"><bean:message key="westSeed12Label"/></a>
</div>


<!-- west Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed12Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed12Value"/>-4','15','false')"><bean:message key="westSeed12Label"/></a>
</div>


<!-- west Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed12Label"/>-4" >
 <bean:message key="westSeed12Label"/>
</div>


<!-- west Region #4 - <bean:message key="westSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="westSeed4Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed4Value"/>-2','10','false')"><bean:message key="westSeed4Label"/></a>
</div>

<!-- west Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed4Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed4Value"/>-3','13','false')"><bean:message key="westSeed4Label"/></a>
</div>

<!-- west Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed4Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed4Value"/>-4','15','false')"><bean:message key="westSeed4Label"/></a>
</div>

<!-- west Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed4Label"/>-4" >
 <bean:message key="westSeed4Label"/>
</div>


<!-- west Region #13 - <bean:message key="westSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="westSeed13Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed13Value"/>-2','10','false')"><bean:message key="westSeed13Label"/></a>
</div>

<!-- west Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed13Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed13Value"/>-3','13','false')"><bean:message key="westSeed13Label"/></a>
</div>

<!-- west Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed13Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed13Value"/>-4','15','false')"><bean:message key="westSeed13Label"/></a>
</div>

<!-- west Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed13Label"/>-4" >
 <bean:message key="westSeed13Label"/>
</div>


<!-- west Region #6 - <bean:message key="westSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="westSeed6Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed6Value"/>-2','11','false')"><bean:message key="westSeed6Label"/></a>
</div>

<!-- west Region #6 - <bean:message key="westSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed6Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed6Value"/>-3','14','false')"><bean:message key="westSeed6Label"/></a>
</div>

<!-- west Region #6 - <bean:message key="westSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed6Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed6Value"/>-4','15','false')"><bean:message key="westSeed6Label"/></a>
</div>

<!-- west Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed6Label"/>-4" >
<bean:message key="westSeed6Label"/>
</div>


<!-- west Region #11 - <bean:message key="westSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="westSeed11Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed11Value"/>-2','11','false')"><bean:message key="westSeed11Label"/></a>
</div>

<!-- west Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed11Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed11Value"/>-3','14','false')"><bean:message key="westSeed11Label"/></a>
</div>

<!-- west Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed11Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed11Value"/>-4','15','false')"><bean:message key="westSeed11Label"/></a>
</div>

<!-- west Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed11Label"/>-4" >
<bean:message key="westSeed11Label"/>
</div>



<!-- west Region #3 - <bean:message key="westSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="westSeed3Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed3Value"/>-2','11','false')"><bean:message key="westSeed3Label"/></a>
</div>

<!-- west Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed3Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed3Value"/>-3','14','false')"><bean:message key="westSeed3Label"/></a>
</div>

<!-- west Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed3Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed3Value"/>-4','15','false')"><bean:message key="westSeed3Label"/></a>
</div>

<!-- west Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed3Label"/>-4" >
 <bean:message key="westSeed3Label"/>
</div>


<!-- west Region #14 - <bean:message key="westSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="westSeed14Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed14Value"/>-2','11','false')"><bean:message key="westSeed14Label"/></a>
</div>

<!-- west Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed14Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed14Value"/>-3','14','false')"><bean:message key="westSeed14Label"/></a>
</div>

<!-- west Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed14Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed14Value"/>-4','15','false')"><bean:message key="westSeed14Label"/></a>
</div>

<!-- west Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed14Label"/>-4" >
 <bean:message key="westSeed14Label"/>
</div>


<!-- west Region #7 - <bean:message key="westSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="westSeed7Label"/>">
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed7Value"/>-2','12','false')"><bean:message key="westSeed7Label"/></a>
</div>

<!-- west Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed7Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed7Value"/>-3','14','false')"><bean:message key="westSeed7Label"/></a>
</div>

<!-- west Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed7Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed7Value"/>-4','15','false')"><bean:message key="westSeed7Label"/></a>
</div>

<!-- west Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed7Label"/>-4" >
 <bean:message key="westSeed7Label"/>
</div>


<!-- west Region #10 - <bean:message key="westSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="westSeed10Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed10Value"/>-2','12','false')"><bean:message key="westSeed10Label"/></a>
</div>

<!-- west Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed10Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed10Value"/>-3','14','false')"><bean:message key="westSeed10Label"/></a>
</div>

<!-- west Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed10Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed10Value"/>-4','15','false')"><bean:message key="westSeed10Label"/></a>
</div>

<!-- west Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed10Label"/>-4" >
 <bean:message key="westSeed10Label"/>
</div>


<!-- west Region #2 - <bean:message key="westSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="westSeed2Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed2Value"/>-2','12','false')"><bean:message key="westSeed2Label"/></a>
</div>

<!-- west Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed2Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed2Value"/>-3','14','false')"><bean:message key="westSeed2Label"/></a>
</div>

<!-- west Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed2Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed2Value"/>-4','15','false')"><bean:message key="westSeed2Label"/></a>
</div>

<!-- west Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed2Label"/>-4" >
 <bean:message key="westSeed2Label"/>
</div>


<!-- west Region #15 - <bean:message key="westSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="westSeed15Label"/>" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed15Value"/>-2','12','false')"><bean:message key="westSeed15Label"/></a>
</div>

<!-- west Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed15Label"/>-2" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed15Value"/>-3','14','false')"><bean:message key="westSeed15Label"/></a>
</div>

<!-- west Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed15Label"/>-3" >
 <a href="#" class="team" onClick="setWinner('<bean:message key="westSeed15Value"/>-4','15','false')"><bean:message key="westSeed15Label"/></a>
</div>

<!-- west Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed15Label"/>-4" >
 <bean:message key="westSeed15Label"/>
</div>
</div>

<div id="ffBracket" style="display:none">
<div class="saveForm">
 <form name="saveForm" action="savebracket.do" method="POST" style="border:0px;margin:0px;padding:0px;">
   <input type="hidden" name="eastWinners" value=""/>
   <input type="hidden" name="midwestWinners" value=""/>
   <input type="hidden" name="southWinners" value=""/>
   <input type="hidden" name="westWinners" value=""/>
    <input type="hidden" name="ffWinners" value=""/>
   <div class="submitName">Entry Name<br>(e.g. KobeB)</div>
   <div class="nameField">
	<% java.lang.String sBracketName = (java.lang.String)session.getAttribute("loadedBracketName"); 
		if((sBracketName != null) && (!sBracketName.equals(""))) { %>
	<%=session.getAttribute("loadedBracketName")%>
	<input type="hidden" name="bracketName" value="<%=session.getAttribute("loadedBracketName")%>"/>
<% } 
	  else { %>
	 <input class="fieldBG" type="text" name="bracketName" value=""/>
	<% } %>
   </div>
   <div class="ffButtons">
    <input class="button" type="button" onClick="savePicks()" value="Save Picks"/></div>
 </form>
</div>

<div class="submitForm">
<form name="validateForm" action="validatePicks.do" method="POST" style="border:0px;margin:0px;padding:0px;">
   <input type="hidden" name="eastWinners" value=""/>
   <input type="hidden" name="southWinners" value=""/>
   <input type="hidden" name="midwestWinners" value=""/>
   <input type="hidden" name="westWinners" value=""/>
    <input type="hidden" name="ffWinners" value=""/>
    <div class="ffButtons">
       <input class="button" type="button" onClick="validatePicks()" value="Validate Bracket"/></div>
	<div id="validated" class="validated" style="display:none">
		<font style="font-weight:bold;font-size:15px">Validated</font> &#160;&#160;&#160;<font color="red">Please Save your bracket above</font>
	</div>
 </form>
</div>


<!-- Bracket Horizontal Bars -->
<div class="barSemisTeam1"></div>
<div class="barSemisTeam2"></div>
<div class="barSemisTeam3"></div>
<div class="barSemisTeam4"></div>
<div class="barFinalsTeam1"></div>
<div class="barFinalsTeam2"></div>
<div class="barChampion"></div>

<!-- Bracket Vertical Bars -->
<div class="barSemisGame1"></div>
<div class="barSemisGame2"></div>
<div class="barFinals"></div>

<!-- Final Four-->
<div class="semisGame1Team1">
 <a href="#" class="team" onClick="setFFWinner('<%= session.getAttribute("eastFF") %>','1','false','east')"><div id="eastWinner"></div></a>
</div>
<div class="semisGame1Team2">
 <a href="#" class="team" onClick="setFFWinner('<%= session.getAttribute("southFF") %>','1','false','south')"><div id="southWinner"></div></a>
</div>
<div class="semisGame2Team1">
 <a href="#" class="team" onClick="setFFWinner('<%= session.getAttribute("midwestFF") %>','2','false','midwest')"><div id="midwestWinner"></div></a>
</div>
<div class="semisGame2Team2">
 <a href="#" class="team" onClick="setFFWinner('<%= session.getAttribute("westFF") %>','2','false','west')"><div id="westWinner"></div></a>
</div>

<!-- Finalist 1 -->
<div class="finalsTeam1" >
 <a href="#" class="team" onClick="setChamp('','','1')"><div id="finalist1" style="display:block"></div></a>
</div>
<!-- Finalist 2 -->
<div class="finalsTeam2" >
 <a href="#" class="team" onClick="setChamp('','','2')"><div id="finalist2"></div></a>
</div>
<!-- Champion -->
<div class="champion" ID="<%= session.getAttribute("eastFFLabel") %>-champion" >
<div id="champion"></div>
</div>

</div>
</body>
</html>
