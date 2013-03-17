<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>

<html>
<head>
 <title>Tourney</title>
<link href="css/styles.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="js/jsFunctions.js"></script>
<script language="javascript">
  //    document.onkeyup = KeyCheck; 
      function initPage()
      {
      		var eastW = '<%= session.getAttribute("eastWinners") %>';
      		var southW = '<%= session.getAttribute("southWinners") %>';
      		var midwestW = '<%= session.getAttribute("midwestWinners") %>';
      		var westW = '<%= session.getAttribute("westWinners") %>';
      		var eastWinner = '<%= session.getAttribute("eastFF") %>';
      		var southWinner = '<%= session.getAttribute("southFF") %>';
      		var midwestWinner = '<%= session.getAttribute("midwestFF") %>';
      		var westWinner = '<%= session.getAttribute("westFF") %>';
      		var ffW = '<%= session.getAttribute("ffWinners") %>';
	      	populateRegions(eastW,southW,midwestW,westW,ffW,true,eastWinner,southWinner,midwestWinner,westWinner);
	      	
      		viewBracket("ff",5);
      		// startw();
      }
    
    // Scrolling Stuff
    var wwidth=708;

	//scroller height: change to your own;
	var wheight=20;

	//background color: change to your own; 
	var wbcolor="#f0f0f0";

	var sspeed=8;
	var restart=sspeed;
	var rspeed=sspeed;

	trashtalk='<%= session.getAttribute("comments") %>';
	
	var sizeupw=0;var operbr=navigator.userAgent.toLowerCase().indexOf('opera');if(operbr==-1&&navigator.product&&navigator.product=="Gecko"){var agt = navigator.userAgent.toLowerCase();var rvStart = agt.indexOf('rv:');var rvEnd = agt.indexOf(')', rvStart);var check15 = agt.substring(rvStart+3, rvEnd);if(parseFloat(check15)>=1.8) operbr=0;}if (navigator.appVersion.indexOf("Mac")!=-1)operbr=0;
	function goup(){if(sspeed!=rspeed*8){sspeed=sspeed*2;restart=sspeed;}}
	function godown(){if(sspeed>rspeed){sspeed=sspeed/2;restart=sspeed;}}
	function startw(){if(document.getElementById)ns6marqueew(document.getElementById('wslider'));else if(document.all) iemarqueew(wslider);else if(document.layers)ns4marqueew(document.wslider1.document.wslider2);}function iemarqueew(whichdiv){iedivw=eval(whichdiv);iedivw.style.pixelLeft=wwidth+"px";iedivw.innerHTML='<nobr>'+trashtalk+'</nobr>';sizeupw=iedivw.offsetWidth;ieslidew();}function ieslidew(){if(iedivw.style.pixelLeft>=sizeupw*(-1)){iedivw.style.pixelLeft-=sspeed+"px";setTimeout("ieslidew()",100);}else{iedivw.style.pixelLeft=wwidth+"px";ieslidew();}}function ns4marqueew(whichlayer){ns4layerw=eval(whichlayer);ns4layerw.left=wwidth;ns4layerw.document.write('<nobr>'+trashtalk+'</nobr>');ns4layerw.document.close();sizeupw=ns4layerw.document.width;ns4slidew();}function ns4slidew(){if(ns4layerw.left>=sizeupw*(-1)){ns4layerw.left-=sspeed;setTimeout("ns4slidew()",100);}else{ns4layerw.left=wwidth;ns4slidew();}}function ns6marqueew(whichdiv){ns6divw=eval(whichdiv);ns6divw.style.left=wwidth+"px";ns6divw.innerHTML='<nobr>'+trashtalk+'</nobr>';sizeupw=ns6divw.offsetWidth;if(operbr!=-1){document.getElementById('operaslider').innerHTML='<nobr>'+trashtalk+'</nobr>';sizeupw=document.getElementById('operaslider').offsetWidth;}ns6slidew();}function ns6slidew(){if(parseInt(ns6divw.style.left)>=sizeupw*(-1)){ns6divw.style.left=parseInt(ns6divw.style.left)-sspeed+"px";setTimeout("ns6slidew()",100);}else{ns6divw.style.left=wwidth+"px";ns6slidew();}}   

</script>
</head>

<body onLoad="initPage()" align="left">

<div id="_eastTab" class="eastTab"><a href="#" onClick="viewBracket('east',1)" class="tabLink">EAST</a></div>
<div id="_southTab" class="southTab"><a href="#" onClick="viewBracket('south',2)" class="tabLink">WEST</a></div>
<div id="_midwestTab" class="midwestTab"><a href="#" onClick="viewBracket('midwest',3)" class="tabLink">SOUTHEAST</a></div>
<div id="_westTab" class="westTab"><a href="#" onClick="viewBracket('west',4)" class="tabLink">SOUTHWEST</a></div>
<div id="_ffTab" class="finalfourTab"><a href="#" onClick="viewBracket('ff',5)" class="tabLink">FINAL FOUR</a></div>

<div class="bracketBox"></div>
<!-- div id="trashtalklink"><a href="#" onClick="viewBracket('ff',5)" class="commentLink">Politely Comment</a></div -->
<div id="trashtalklink"></div>
<div id="bracketname">BRACKET NAME</div>
<div class="backtolist"><a href="listbracketsaction.do" class="backscoreslink">View Scores</a></div>

<%
//<div class="randomizer">
//	<a href="#" onClick="randomizer()">I don't follow college basketball, so pick for me</a>
//</div>
%>

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

<div id="eastBracket">
<!-- East Round 1 matchups -->
<div class="round1Game1Team1">
 <bean:message key="eastSeed1Label"/>
</div>
<div class="round1Game1Team2">
 <bean:message key="eastSeed16Label"/>
</div>
<div class="round1Game2Team1">
  <bean:message key="eastSeed8Label"/>
</div>
<div class="round1Game2Team2">
 <bean:message key="eastSeed9Label"/>
</div>
<div class="round1Game3Team1">
 <bean:message key="eastSeed5Label"/>
</div>
<div class="round1Game3Team2">
 <bean:message key="eastSeed12Label"/>
</div>
<div class="round1Game4Team1">
<bean:message key="eastSeed4Label"/>
</div>
<div class="round1Game4Team2">
 <bean:message key="eastSeed13Label"/>
</div>
<div class="round1Game5Team1">
 <bean:message key="eastSeed6Label"/>
</div>
<div class="round1Game5Team2">
 <bean:message key="eastSeed11Label"/>
</div>
<div class="round1Game6Team1">
 <bean:message key="eastSeed3Label"/>
</div>
<div class="round1Game6Team2">
 <bean:message key="eastSeed14Label"/>
</div>
<div class="round1Game7Team1">
 <bean:message key="eastSeed7Label"/>
</div>
<div class="round1Game7Team2"> 
 <bean:message key="eastSeed10Label"/>
</div>
<div class="round1Game8Team1">
 <bean:message key="eastSeed2Label"/>
</div>
<div class="round1Game8Team2">
 <bean:message key="eastSeed15Label"/>
</div>

<!-- East Region #1 - <bean:message key="eastSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="eastSeed1Label"/>">
 <bean:message key="eastSeed1Label"/>
</div>
<!-- East Region #1 - <bean:message key="eastSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed1Label"/>-2" >
<bean:message key="eastSeed1Label"/>
</div>
<!-- East Region #1 - <bean:message key="eastSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed1Label"/>-3" >
 <bean:message key="eastSeed1Label"/>
</div>
<!-- East Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed1Label"/>-4">
  <bean:message key="eastSeed1Label"/>
</div>


<!-- East Region #16 - <bean:message key="eastSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="eastSeed16Label"/>">
 <bean:message key="eastSeed16Label"/>
</div>

<!-- East Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed16Label"/>-2" >
 <bean:message key="eastSeed16Label"/>
</div>

<!-- East Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="eastSeed16Label"/>-3" >
 <bean:message key="eastSeed16Label"/>
</div>

<!-- East Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed16Label"/>-4" >
  <bean:message key="eastSeed16Label"/>
</div>



<!-- East Region #8 - <bean:message key="eastSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="eastSeed8Label"/>">
 <bean:message key="eastSeed8Label"/>
</div>

<!-- East Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed8Label"/>-2" >
 <bean:message key="eastSeed8Label"/>
</div>

<!-- East Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="eastSeed8Label"/>-3" >
<bean:message key="eastSeed8Label"/>
</div>

<!-- East Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed8Label"/>-4" >
 <bean:message key="eastSeed8Label"/>
</div>


<!-- East Region #9 - <bean:message key="eastSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="eastSeed9Label"/>">
 <bean:message key="eastSeed9Label"/>
</div>

<!-- East Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="eastSeed9Label"/>-2" >
 <bean:message key="eastSeed9Label"/>
</div>

<!-- East Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed9Label"/>-3" >
 <bean:message key="eastSeed9Label"/>
</div>


<!-- East Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed9Label"/>-4" >
 <bean:message key="eastSeed9Label"/>
</div>


<!-- East Region #5 - <bean:message key="eastSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="eastSeed5Label"/>">
 <bean:message key="eastSeed5Label"/>
</div>


<!-- East Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed5Label"/>-2" >
 <bean:message key="eastSeed5Label"/>
</div>


<!-- East Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed5Label"/>-3" >
 <bean:message key="eastSeed5Label"/>
</div>


<!-- East Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed5Label"/>-4" >
<bean:message key="eastSeed5Label"/>
</div>


<!-- East Region #12 - <bean:message key="eastSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="eastSeed12Label"/>" >
 <bean:message key="eastSeed12Label"/>
</div>


<!-- East Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed12Label"/>-2" >
 <bean:message key="eastSeed12Label"/>
</div>


<!-- East Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed12Label"/>-3" >
 <bean:message key="eastSeed12Label"/>
</div>


<!-- East Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed12Label"/>-4" >
 <bean:message key="eastSeed12Label"/>
</div>


<!-- East Region #4 - <bean:message key="eastSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="eastSeed4Label"/>">
 <bean:message key="eastSeed4Label"/>
</div>

<!-- East Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed4Label"/>-2" >
 <bean:message key="eastSeed4Label"/>
</div>

<!-- East Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed4Label"/>-3" >
 <bean:message key="eastSeed4Label"/>
</div>

<!-- East Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed4Label"/>-4" >
 <bean:message key="eastSeed4Label"/>
</div>


<!-- East Region #13 - <bean:message key="eastSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="eastSeed13Label"/>">
 <bean:message key="eastSeed13Label"/>
</div>

<!-- East Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="eastSeed13Label"/>-2" >
 <bean:message key="eastSeed13Label"/>
</div>

<!-- East Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="eastSeed13Label"/>-3" >
 <bean:message key="eastSeed13Label"/>
</div>

<!-- East Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed13Label"/>-4" >
 <bean:message key="eastSeed13Label"/>
</div>


<!-- East Region #6 - <bean:message key="eastSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="eastSeed6Label"/>">
 <bean:message key="eastSeed6Label"/>
</div>

<!-- East Region #6 - <bean:message key="eastSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed6Label"/>-2" >
 <bean:message key="eastSeed6Label"/>
</div>

<!-- East Region #6 - <bean:message key="eastSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed6Label"/>-3" >
 <bean:message key="eastSeed6Label"/>
</div>

<!-- East Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed6Label"/>-4" >
<bean:message key="eastSeed6Label"/>
</div>


<!-- East Region #11 - <bean:message key="eastSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="eastSeed11Label"/>" >
 <bean:message key="eastSeed11Label"/>
</div>

<!-- East Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed11Label"/>-2" >
 <bean:message key="eastSeed11Label"/>
</div>

<!-- East Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed11Label"/>-3" >
 <bean:message key="eastSeed11Label"/>
</div>

<!-- East Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed11Label"/>-4" >
<bean:message key="eastSeed11Label"/>
</div>



<!-- East Region #3 - <bean:message key="eastSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="eastSeed3Label"/>" >
 <bean:message key="eastSeed3Label"/>
</div>

<!-- East Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed3Label"/>-2" >
 <bean:message key="eastSeed3Label"/>
</div>

<!-- East Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed3Label"/>-3" >
 <bean:message key="eastSeed3Label"/>
</div>

<!-- East Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed3Label"/>-4" >
 <bean:message key="eastSeed3Label"/>
</div>


<!-- East Region #14 - <bean:message key="eastSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="eastSeed14Label"/>">
 <bean:message key="eastSeed14Label"/>
</div>

<!-- East Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="eastSeed14Label"/>-2" >
 <bean:message key="eastSeed14Label"/>
</div>

<!-- East Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed14Label"/>-3" >
 <bean:message key="eastSeed14Label"/>
</div>

<!-- East Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed14Label"/>-4" >
 <bean:message key="eastSeed14Label"/>
</div>


<!-- East Region #7 - <bean:message key="eastSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="eastSeed7Label"/>">
 <bean:message key="eastSeed7Label"/>
</div>

<!-- East Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed7Label"/>-2" >
 <bean:message key="eastSeed7Label"/>
</div>

<!-- East Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed7Label"/>-3" >
 <bean:message key="eastSeed7Label"/>
</div>

<!-- East Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed7Label"/>-4" >
 <bean:message key="eastSeed7Label"/>
</div>


<!-- East Region #10 - <bean:message key="eastSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="eastSeed10Label"/>" >
 <bean:message key="eastSeed10Label"/>
</div>

<!-- East Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed10Label"/>-2" >
 <bean:message key="eastSeed10Label"/>
</div>

<!-- East Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed10Label"/>-3" >
 <bean:message key="eastSeed10Label"/>
</div>

<!-- East Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed10Label"/>-4" >
 <bean:message key="eastSeed10Label"/>
</div>


<!-- East Region #2 - <bean:message key="eastSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="eastSeed2Label"/>" >
 <bean:message key="eastSeed2Label"/>
</div>

<!-- East Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed2Label"/>-2" >
 <bean:message key="eastSeed2Label"/>
</div>

<!-- East Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed2Label"/>-3" >
 <bean:message key="eastSeed2Label"/>
</div>

<!-- East Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed2Label"/>-4" >
 <bean:message key="eastSeed2Label"/>
</div>


<!-- East Region #15 - <bean:message key="eastSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="eastSeed15Label"/>" >
 <bean:message key="eastSeed15Label"/>
</div>

<!-- East Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="eastSeed15Label"/>-2" >
 <bean:message key="eastSeed15Label"/>
</div>

<!-- East Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="eastSeed15Label"/>-3" >
 <bean:message key="eastSeed15Label"/>
</div>

<!-- East Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="eastSeed15Label"/>-4" >
 <bean:message key="eastSeed15Label"/>
</div>
</div>

<!- SOUTH Bracket -->
<div id="southBracket" style="display:none">
<!-- south Round 1 matchups -->
<div class="round1Game1Team1">
 <bean:message key="southSeed1Label"/>
</div>
<div class="round1Game1Team2">
 <bean:message key="southSeed16Label"/>
</div>
<div class="round1Game2Team1">
  <bean:message key="southSeed8Label"/>
</div>
<div class="round1Game2Team2">
 <bean:message key="southSeed9Label"/>
</div>
<div class="round1Game3Team1">
 <bean:message key="southSeed5Label"/>
</div>
<div class="round1Game3Team2">
 <bean:message key="southSeed12Label"/>
</div>
<div class="round1Game4Team1">
<bean:message key="southSeed4Label"/>
</div>
<div class="round1Game4Team2">
 <bean:message key="southSeed13Label"/>
</div>
<div class="round1Game5Team1">
 <bean:message key="southSeed6Label"/>
</div>
<div class="round1Game5Team2">
 <bean:message key="southSeed11Label"/>
</div>
<div class="round1Game6Team1">
 <bean:message key="southSeed3Label"/>
</div>
<div class="round1Game6Team2">
 <bean:message key="southSeed14Label"/>
</div>
<div class="round1Game7Team1">
 <bean:message key="southSeed7Label"/>
</div>
<div class="round1Game7Team2"> 
 <bean:message key="southSeed10Label"/>
</div>
<div class="round1Game8Team1">
 <bean:message key="southSeed2Label"/>
</div>
<div class="round1Game8Team2">
 <bean:message key="southSeed15Label"/>
</div>


<!-- south Region #1 - <bean:message key="southSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="southSeed1Label"/>">
 <bean:message key="southSeed1Label"/>
</div>
<!-- south Region #1 - <bean:message key="southSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed1Label"/>-2" >
<bean:message key="southSeed1Label"/>
</div>
<!-- south Region #1 - <bean:message key="southSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed1Label"/>-3" >
 <bean:message key="southSeed1Label"/>
</div>
<!-- south Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed1Label"/>-4">
  <bean:message key="southSeed1Label"/>
</div>


<!-- south Region #16 - <bean:message key="southSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="southSeed16Label"/>">
 <bean:message key="southSeed16Label"/>
</div>

<!-- south Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed16Label"/>-2" >
 <bean:message key="southSeed16Label"/>
</div>

<!-- south Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="southSeed16Label"/>-3" >
 <bean:message key="southSeed16Label"/>
</div>

<!-- south Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed16Label"/>-4" >
  <bean:message key="southSeed16Label"/>
</div>



<!-- south Region #8 - <bean:message key="southSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="southSeed8Label"/>">
 <bean:message key="southSeed8Label"/>
</div>

<!-- south Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed8Label"/>-2" >
 <bean:message key="southSeed8Label"/>
</div>

<!-- south Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="southSeed8Label"/>-3" >
<bean:message key="southSeed8Label"/>
</div>

<!-- south Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed8Label"/>-4" >
 <bean:message key="southSeed8Label"/>
</div>


<!-- south Region #9 - <bean:message key="southSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="southSeed9Label"/>">
 <bean:message key="southSeed9Label"/>
</div>

<!-- south Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="southSeed9Label"/>-2" >
 <bean:message key="southSeed9Label"/>
</div>

<!-- south Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed9Label"/>-3" >
 <bean:message key="southSeed9Label"/>
</div>


<!-- south Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed9Label"/>-4" >
 <bean:message key="southSeed9Label"/>
</div>


<!-- south Region #5 - <bean:message key="southSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="southSeed5Label"/>">
 <bean:message key="southSeed5Label"/>
</div>


<!-- south Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed5Label"/>-2" >
 <bean:message key="southSeed5Label"/>
</div>


<!-- south Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed5Label"/>-3" >
 <bean:message key="southSeed5Label"/>
</div>


<!-- south Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed5Label"/>-4" >
<bean:message key="southSeed5Label"/>
</div>


<!-- south Region #12 - <bean:message key="southSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="southSeed12Label"/>" >
 <bean:message key="southSeed12Label"/>
</div>


<!-- south Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed12Label"/>-2" >
 <bean:message key="southSeed12Label"/>
</div>


<!-- south Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed12Label"/>-3" >
 <bean:message key="southSeed12Label"/>
</div>


<!-- south Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed12Label"/>-4" >
 <bean:message key="southSeed12Label"/>
</div>


<!-- south Region #4 - <bean:message key="southSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="southSeed4Label"/>">
 <bean:message key="southSeed4Label"/>
</div>

<!-- south Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed4Label"/>-2" >
 <bean:message key="southSeed4Label"/>
</div>

<!-- south Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed4Label"/>-3" >
 <bean:message key="southSeed4Label"/>
</div>

<!-- south Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed4Label"/>-4" >
 <bean:message key="southSeed4Label"/>
</div>


<!-- south Region #13 - <bean:message key="southSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="southSeed13Label"/>">
 <bean:message key="southSeed13Label"/>
</div>

<!-- south Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="southSeed13Label"/>-2" >
 <bean:message key="southSeed13Label"/>
</div>

<!-- south Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="southSeed13Label"/>-3" >
 <bean:message key="southSeed13Label"/>
</div>

<!-- south Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed13Label"/>-4" >
 <bean:message key="southSeed13Label"/>
</div>


<!-- south Region #6 - <bean:message key="southSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="southSeed6Label"/>">
 <bean:message key="southSeed6Label"/>
</div>

<!-- south Region #6 - <bean:message key="southSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed6Label"/>-2" >
 <bean:message key="southSeed6Label"/>
</div>

<!-- south Region #6 - <bean:message key="southSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed6Label"/>-3" >
 <bean:message key="southSeed6Label"/>
</div>

<!-- south Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed6Label"/>-4" >
<bean:message key="southSeed6Label"/>
</div>


<!-- south Region #11 - <bean:message key="southSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="southSeed11Label"/>" >
 <bean:message key="southSeed11Label"/>
</div>

<!-- south Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed11Label"/>-2" >
 <bean:message key="southSeed11Label"/>
</div>

<!-- south Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed11Label"/>-3" >
 <bean:message key="southSeed11Label"/>
</div>

<!-- south Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed11Label"/>-4" >
<bean:message key="southSeed11Label"/>
</div>



<!-- south Region #3 - <bean:message key="southSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="southSeed3Label"/>" >
 <bean:message key="southSeed3Label"/>
</div>

<!-- south Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed3Label"/>-2" >
 <bean:message key="southSeed3Label"/>
</div>

<!-- south Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed3Label"/>-3" >
 <bean:message key="southSeed3Label"/>
</div>

<!-- south Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed3Label"/>-4" >
 <bean:message key="southSeed3Label"/>
</div>


<!-- south Region #14 - <bean:message key="southSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="southSeed14Label"/>">
 <bean:message key="southSeed14Label"/>
</div>

<!-- south Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="southSeed14Label"/>-2" >
 <bean:message key="southSeed14Label"/>
</div>

<!-- south Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed14Label"/>-3" >
 <bean:message key="southSeed14Label"/>
</div>

<!-- south Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed14Label"/>-4" >
 <bean:message key="southSeed14Label"/>
</div>


<!-- south Region #7 - <bean:message key="southSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="southSeed7Label"/>">
 <bean:message key="southSeed7Label"/>
</div>

<!-- south Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed7Label"/>-2" >
 <bean:message key="southSeed7Label"/>
</div>

<!-- south Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed7Label"/>-3" >
 <bean:message key="southSeed7Label"/>
</div>

<!-- south Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed7Label"/>-4" >
 <bean:message key="southSeed7Label"/>
</div>


<!-- south Region #10 - <bean:message key="southSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="southSeed10Label"/>" >
 <bean:message key="southSeed10Label"/>
</div>

<!-- south Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed10Label"/>-2" >
 <bean:message key="southSeed10Label"/>
</div>

<!-- south Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed10Label"/>-3" >
 <bean:message key="southSeed10Label"/>
</div>

<!-- south Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed10Label"/>-4" >
 <bean:message key="southSeed10Label"/>
</div>


<!-- south Region #2 - <bean:message key="southSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="southSeed2Label"/>" >
 <bean:message key="southSeed2Label"/>
</div>

<!-- south Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed2Label"/>-2" >
 <bean:message key="southSeed2Label"/>
</div>

<!-- south Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed2Label"/>-3" >
 <bean:message key="southSeed2Label"/>
</div>

<!-- south Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed2Label"/>-4" >
 <bean:message key="southSeed2Label"/>
</div>


<!-- south Region #15 - <bean:message key="southSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="southSeed15Label"/>" >
 <bean:message key="southSeed15Label"/>
</div>

<!-- south Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="southSeed15Label"/>-2" >
 <bean:message key="southSeed15Label"/>
</div>

<!-- south Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="southSeed15Label"/>-3" >
 <bean:message key="southSeed15Label"/>
</div>

<!-- south Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="southSeed15Label"/>-4" >
 <bean:message key="southSeed15Label"/>
</div>
</div>

<div id="midwestBracket" style="display:none">
<!-- midwest Round 1 matchups -->
<div class="round1Game1Team1">
 <bean:message key="midwestSeed1Label"/>
</div>
<div class="round1Game1Team2">
 <bean:message key="midwestSeed16Label"/>
</div>
<div class="round1Game2Team1">
  <bean:message key="midwestSeed8Label"/>
</div>
<div class="round1Game2Team2">
 <bean:message key="midwestSeed9Label"/>
</div>
<div class="round1Game3Team1">
 <bean:message key="midwestSeed5Label"/>
</div>
<div class="round1Game3Team2">
 <bean:message key="midwestSeed12Label"/>
</div>
<div class="round1Game4Team1">
<bean:message key="midwestSeed4Label"/>
</div>
<div class="round1Game4Team2">
 <bean:message key="midwestSeed13Label"/>
</div>
<div class="round1Game5Team1">
 <bean:message key="midwestSeed6Label"/>
</div>
<div class="round1Game5Team2">
 <bean:message key="midwestSeed11Label"/>
</div>
<div class="round1Game6Team1">
 <bean:message key="midwestSeed3Label"/>
</div>
<div class="round1Game6Team2">
 <bean:message key="midwestSeed14Label"/>
</div>
<div class="round1Game7Team1">
 <bean:message key="midwestSeed7Label"/>
</div>
<div class="round1Game7Team2"> 
 <bean:message key="midwestSeed10Label"/>
</div>
<div class="round1Game8Team1">
 <bean:message key="midwestSeed2Label"/>
</div>
<div class="round1Game8Team2">
 <bean:message key="midwestSeed15Label"/>
</div>


<!-- midwest Region #1 - <bean:message key="midwestSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="midwestSeed1Label"/>">
 <bean:message key="midwestSeed1Label"/>
</div>
<!-- midwest Region #1 - <bean:message key="midwestSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed1Label"/>-2" >
<bean:message key="midwestSeed1Label"/>
</div>
<!-- midwest Region #1 - <bean:message key="midwestSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed1Label"/>-3" >
 <bean:message key="midwestSeed1Label"/>
</div>
<!-- midwest Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed1Label"/>-4">
  <bean:message key="midwestSeed1Label"/>
</div>


<!-- midwest Region #16 - <bean:message key="midwestSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="midwestSeed16Label"/>">
 <bean:message key="midwestSeed16Label"/>
</div>

<!-- midwest Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed16Label"/>-2" >
 <bean:message key="midwestSeed16Label"/>
</div>

<!-- midwest Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed16Label"/>-3" >
 <bean:message key="midwestSeed16Label"/>
</div>

<!-- midwest Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed16Label"/>-4" >
  <bean:message key="midwestSeed16Label"/>
</div>



<!-- midwest Region #8 - <bean:message key="midwestSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="midwestSeed8Label"/>">
 <bean:message key="midwestSeed8Label"/>
</div>

<!-- midwest Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed8Label"/>-2" >
 <bean:message key="midwestSeed8Label"/>
</div>

<!-- midwest Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed8Label"/>-3" >
<bean:message key="midwestSeed8Label"/>
</div>

<!-- midwest Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed8Label"/>-4" >
 <bean:message key="midwestSeed8Label"/>
</div>


<!-- midwest Region #9 - <bean:message key="midwestSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="midwestSeed9Label"/>">
 <bean:message key="midwestSeed9Label"/>
</div>

<!-- midwest Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="midwestSeed9Label"/>-2" >
 <bean:message key="midwestSeed9Label"/>
</div>

<!-- midwest Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed9Label"/>-3" >
 <bean:message key="midwestSeed9Label"/>
</div>


<!-- midwest Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed9Label"/>-4" >
 <bean:message key="midwestSeed9Label"/>
</div>


<!-- midwest Region #5 - <bean:message key="midwestSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="midwestSeed5Label"/>">
 <bean:message key="midwestSeed5Label"/>
</div>


<!-- midwest Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed5Label"/>-2" >
 <bean:message key="midwestSeed5Label"/>
</div>


<!-- midwest Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed5Label"/>-3" >
 <bean:message key="midwestSeed5Label"/>
</div>


<!-- midwest Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed5Label"/>-4" >
<bean:message key="midwestSeed5Label"/>
</div>


<!-- midwest Region #12 - <bean:message key="midwestSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="midwestSeed12Label"/>" >
 <bean:message key="midwestSeed12Label"/>
</div>


<!-- midwest Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed12Label"/>-2" >
 <bean:message key="midwestSeed12Label"/>
</div>


<!-- midwest Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed12Label"/>-3" >
 <bean:message key="midwestSeed12Label"/>
</div>


<!-- midwest Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed12Label"/>-4" >
 <bean:message key="midwestSeed12Label"/>
</div>


<!-- midwest Region #4 - <bean:message key="midwestSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="midwestSeed4Label"/>">
 <bean:message key="midwestSeed4Label"/>
</div>

<!-- midwest Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed4Label"/>-2" >
 <bean:message key="midwestSeed4Label"/>
</div>

<!-- midwest Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed4Label"/>-3" >
 <bean:message key="midwestSeed4Label"/>
</div>

<!-- midwest Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed4Label"/>-4" >
 <bean:message key="midwestSeed4Label"/>
</div>


<!-- midwest Region #13 - <bean:message key="midwestSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="midwestSeed13Label"/>">
 <bean:message key="midwestSeed13Label"/>
</div>

<!-- midwest Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="midwestSeed13Label"/>-2" >
 <bean:message key="midwestSeed13Label"/>
</div>

<!-- midwest Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="midwestSeed13Label"/>-3" >
 <bean:message key="midwestSeed13Label"/>
</div>

<!-- midwest Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed13Label"/>-4" >
 <bean:message key="midwestSeed13Label"/>
</div>


<!-- midwest Region #6 - <bean:message key="midwestSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="midwestSeed6Label"/>">
 <bean:message key="midwestSeed6Label"/>
</div>

<!-- midwest Region #6 - <bean:message key="midwestSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed6Label"/>-2" >
 <bean:message key="midwestSeed6Label"/>
</div>

<!-- midwest Region #6 - <bean:message key="midwestSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed6Label"/>-3" >
 <bean:message key="midwestSeed6Label"/>
</div>

<!-- midwest Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed6Label"/>-4" >
<bean:message key="midwestSeed6Label"/>
</div>


<!-- midwest Region #11 - <bean:message key="midwestSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="midwestSeed11Label"/>" >
 <bean:message key="midwestSeed11Label"/>
</div>

<!-- midwest Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed11Label"/>-2" >
 <bean:message key="midwestSeed11Label"/>
</div>

<!-- midwest Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed11Label"/>-3" >
 <bean:message key="midwestSeed11Label"/>
</div>

<!-- midwest Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed11Label"/>-4" >
<bean:message key="midwestSeed11Label"/>
</div>



<!-- midwest Region #3 - <bean:message key="midwestSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="midwestSeed3Label"/>" >
 <bean:message key="midwestSeed3Label"/>
</div>

<!-- midwest Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed3Label"/>-2" >
 <bean:message key="midwestSeed3Label"/>
</div>

<!-- midwest Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed3Label"/>-3" >
 <bean:message key="midwestSeed3Label"/>
</div>

<!-- midwest Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed3Label"/>-4" >
 <bean:message key="midwestSeed3Label"/>
</div>


<!-- midwest Region #14 - <bean:message key="midwestSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="midwestSeed14Label"/>">
 <bean:message key="midwestSeed14Label"/>
</div>

<!-- midwest Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="midwestSeed14Label"/>-2" >
 <bean:message key="midwestSeed14Label"/>
</div>

<!-- midwest Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed14Label"/>-3" >
 <bean:message key="midwestSeed14Label"/>
</div>

<!-- midwest Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed14Label"/>-4" >
 <bean:message key="midwestSeed14Label"/>
</div>


<!-- midwest Region #7 - <bean:message key="midwestSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="midwestSeed7Label"/>">
 <bean:message key="midwestSeed7Label"/>
</div>

<!-- midwest Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed7Label"/>-2" >
 <bean:message key="midwestSeed7Label"/>
</div>

<!-- midwest Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed7Label"/>-3" >
 <bean:message key="midwestSeed7Label"/>
</div>

<!-- midwest Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed7Label"/>-4" >
 <bean:message key="midwestSeed7Label"/>
</div>


<!-- midwest Region #10 - <bean:message key="midwestSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="midwestSeed10Label"/>" >
 <bean:message key="midwestSeed10Label"/>
</div>

<!-- midwest Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed10Label"/>-2" >
 <bean:message key="midwestSeed10Label"/>
</div>

<!-- midwest Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed10Label"/>-3" >
 <bean:message key="midwestSeed10Label"/>
</div>

<!-- midwest Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed10Label"/>-4" >
 <bean:message key="midwestSeed10Label"/>
</div>


<!-- midwest Region #2 - <bean:message key="midwestSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="midwestSeed2Label"/>" >
 <bean:message key="midwestSeed2Label"/>
</div>

<!-- midwest Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed2Label"/>-2" >
 <bean:message key="midwestSeed2Label"/>
</div>

<!-- midwest Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed2Label"/>-3" >
 <bean:message key="midwestSeed2Label"/>
</div>

<!-- midwest Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed2Label"/>-4" >
 <bean:message key="midwestSeed2Label"/>
</div>


<!-- midwest Region #15 - <bean:message key="midwestSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="midwestSeed15Label"/>" >
 <bean:message key="midwestSeed15Label"/>
</div>

<!-- midwest Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="midwestSeed15Label"/>-2" >
 <bean:message key="midwestSeed15Label"/>
</div>

<!-- midwest Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="midwestSeed15Label"/>-3" >
 <bean:message key="midwestSeed15Label"/>
</div>

<!-- midwest Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="midwestSeed15Label"/>-4" >
 <bean:message key="midwestSeed15Label"/>
</div>
</div>

<div id="westBracket" style="display:none">
<!-- west Round 1 matchups -->
<div class="round1Game1Team1">
 <bean:message key="westSeed1Label"/>
</div>
<div class="round1Game1Team2">
 <bean:message key="westSeed16Label"/>
</div>
<div class="round1Game2Team1">
  <bean:message key="westSeed8Label"/>
</div>
<div class="round1Game2Team2">
 <bean:message key="westSeed9Label"/>
</div>
<div class="round1Game3Team1">
 <bean:message key="westSeed5Label"/>
</div>
<div class="round1Game3Team2">
 <bean:message key="westSeed12Label"/>
</div>
<div class="round1Game4Team1">
<bean:message key="westSeed4Label"/>
</div>
<div class="round1Game4Team2">
 <bean:message key="westSeed13Label"/>
</div>
<div class="round1Game5Team1">
 <bean:message key="westSeed6Label"/>
</div>
<div class="round1Game5Team2">
 <bean:message key="westSeed11Label"/>
</div>
<div class="round1Game6Team1">
 <bean:message key="westSeed3Label"/>
</div>
<div class="round1Game6Team2">
 <bean:message key="westSeed14Label"/>
</div>
<div class="round1Game7Team1">
 <bean:message key="westSeed7Label"/>
</div>
<div class="round1Game7Team2"> 
 <bean:message key="westSeed10Label"/>
</div>
<div class="round1Game8Team1">
 <bean:message key="westSeed2Label"/>
</div>
<div class="round1Game8Team2">
 <bean:message key="westSeed15Label"/>
</div>


<!-- west Region #1 - <bean:message key="westSeed1Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="westSeed1Label"/>">
 <bean:message key="westSeed1Label"/>
</div>
<!-- west Region #1 - <bean:message key="westSeed1Label"/> Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed1Label"/>-2" >
<bean:message key="westSeed1Label"/>
</div>
<!-- west Region #1 - <bean:message key="westSeed1Label"/> Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed1Label"/>-3" >
 <bean:message key="westSeed1Label"/>
</div>
<!-- west Region #1 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed1Label"/>-4">
  <bean:message key="westSeed1Label"/>
</div>


<!-- west Region #16 - <bean:message key="westSeed16Label"/> Round 2 -->
<div class="round2Game1" ID="<bean:message key="westSeed16Label"/>">
 <bean:message key="westSeed16Label"/>
</div>

<!-- west Region #16 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed16Label"/>-2" >
 <bean:message key="westSeed16Label"/>
</div>

<!-- west Region #16 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="westSeed16Label"/>-3" >
 <bean:message key="westSeed16Label"/>
</div>

<!-- west Region #16 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed16Label"/>-4" >
  <bean:message key="westSeed16Label"/>
</div>



<!-- west Region #8 - <bean:message key="westSeed8Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="westSeed8Label"/>">
 <bean:message key="westSeed8Label"/>
</div>

<!-- west Region #8 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed8Label"/>-2" >
 <bean:message key="westSeed8Label"/>
</div>

<!-- west Region #8 - Elite Eight -->
<div class="elite8Game1" ID="<bean:message key="westSeed8Label"/>-3" >
<bean:message key="westSeed8Label"/>
</div>

<!-- west Region #8 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed8Label"/>-4" >
 <bean:message key="westSeed8Label"/>
</div>


<!-- west Region #9 - <bean:message key="westSeed9Label"/> Round 2 -->
<div class="round2Game2" ID="<bean:message key="westSeed9Label"/>">
 <bean:message key="westSeed9Label"/>
</div>

<!-- west Region #9 - Sweet Sixteen -->
<div class="round3Game1" ID="<bean:message key="westSeed9Label"/>-2" >
 <bean:message key="westSeed9Label"/>
</div>

<!-- west Region #9 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed9Label"/>-3" >
 <bean:message key="westSeed9Label"/>
</div>


<!-- west Region #9 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed9Label"/>-4" >
 <bean:message key="westSeed9Label"/>
</div>


<!-- west Region #5 - <bean:message key="westSeed5Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="westSeed5Label"/>">
 <bean:message key="westSeed5Label"/>
</div>


<!-- west Region #5 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed5Label"/>-2" >
 <bean:message key="westSeed5Label"/>
</div>


<!-- west Region #5 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed5Label"/>-3" >
 <bean:message key="westSeed5Label"/>
</div>


<!-- west Region #5 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed5Label"/>-4" >
<bean:message key="westSeed5Label"/>
</div>


<!-- west Region #12 - <bean:message key="westSeed12Label"/> Round 2 -->
<div class="round2Game3" ID="<bean:message key="westSeed12Label"/>" >
 <bean:message key="westSeed12Label"/>
</div>


<!-- west Region #12 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed12Label"/>-2" >
 <bean:message key="westSeed12Label"/>
</div>


<!-- west Region #12 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed12Label"/>-3" >
 <bean:message key="westSeed12Label"/>
</div>


<!-- west Region #12 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed12Label"/>-4" >
 <bean:message key="westSeed12Label"/>
</div>


<!-- west Region #4 - <bean:message key="westSeed4Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="westSeed4Label"/>">
 <bean:message key="westSeed4Label"/>
</div>

<!-- west Region #4 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed4Label"/>-2" >
 <bean:message key="westSeed4Label"/>
</div>

<!-- west Region #4 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed4Label"/>-3" >
 <bean:message key="westSeed4Label"/>
</div>

<!-- west Region #4 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed4Label"/>-4" >
 <bean:message key="westSeed4Label"/>
</div>


<!-- west Region #13 - <bean:message key="westSeed13Label"/> Round 2 -->
<div class="round2Game4" ID="<bean:message key="westSeed13Label"/>">
 <bean:message key="westSeed13Label"/>
</div>

<!-- west Region #13 - Sweet Sixteen -->
<div class="round3Game2" ID="<bean:message key="westSeed13Label"/>-2" >
 <bean:message key="westSeed13Label"/>
</div>

<!-- west Region #13 - Elite 8 -->
<div class="elite8Game1" ID="<bean:message key="westSeed13Label"/>-3" >
 <bean:message key="westSeed13Label"/>
</div>

<!-- west Region #13 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed13Label"/>-4" >
 <bean:message key="westSeed13Label"/>
</div>


<!-- west Region #6 - <bean:message key="westSeed6Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="westSeed6Label"/>">
 <bean:message key="westSeed6Label"/>
</div>

<!-- west Region #6 - <bean:message key="westSeed6Label"/> Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed6Label"/>-2" >
 <bean:message key="westSeed6Label"/>
</div>

<!-- west Region #6 - <bean:message key="westSeed6Label"/> Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed6Label"/>-3" >
 <bean:message key="westSeed6Label"/>
</div>

<!-- west Region #6 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed6Label"/>-4" >
<bean:message key="westSeed6Label"/>
</div>


<!-- west Region #11 - <bean:message key="westSeed11Label"/> Round 2 -->
<div class="round2Game5" ID="<bean:message key="westSeed11Label"/>" >
 <bean:message key="westSeed11Label"/>
</div>

<!-- west Region #11 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed11Label"/>-2" >
 <bean:message key="westSeed11Label"/>
</div>

<!-- west Region #11 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed11Label"/>-3" >
 <bean:message key="westSeed11Label"/>
</div>

<!-- west Region #11 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed11Label"/>-4" >
<bean:message key="westSeed11Label"/>
</div>



<!-- west Region #3 - <bean:message key="westSeed3Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="westSeed3Label"/>" >
 <bean:message key="westSeed3Label"/>
</div>

<!-- west Region #3 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed3Label"/>-2" >
 <bean:message key="westSeed3Label"/>
</div>

<!-- west Region #3 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed3Label"/>-3" >
 <bean:message key="westSeed3Label"/>
</div>

<!-- west Region #3 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed3Label"/>-4" >
 <bean:message key="westSeed3Label"/>
</div>


<!-- west Region #14 - <bean:message key="westSeed14Label"/> Round 2 -->
<div class="round2Game6" ID="<bean:message key="westSeed14Label"/>">
 <bean:message key="westSeed14Label"/>
</div>

<!-- west Region #14 - Sweet Sixteen -->
<div class="round3Game3" ID="<bean:message key="westSeed14Label"/>-2" >
 <bean:message key="westSeed14Label"/>
</div>

<!-- west Region #14 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed14Label"/>-3" >
 <bean:message key="westSeed14Label"/>
</div>

<!-- west Region #14 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed14Label"/>-4" >
 <bean:message key="westSeed14Label"/>
</div>


<!-- west Region #7 - <bean:message key="westSeed7Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="westSeed7Label"/>">
 <bean:message key="westSeed7Label"/>
</div>

<!-- west Region #7 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed7Label"/>-2" >
 <bean:message key="westSeed7Label"/>
</div>

<!-- west Region #7 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed7Label"/>-3" >
 <bean:message key="westSeed7Label"/>
</div>

<!-- west Region #7 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed7Label"/>-4" >
 <bean:message key="westSeed7Label"/>
</div>


<!-- west Region #10 - <bean:message key="westSeed10Label"/> Round 2 -->
<div class="round2Game7" ID="<bean:message key="westSeed10Label"/>" >
 <bean:message key="westSeed10Label"/>
</div>

<!-- west Region #10 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed10Label"/>-2" >
 <bean:message key="westSeed10Label"/>
</div>

<!-- west Region #10 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed10Label"/>-3" >
 <bean:message key="westSeed10Label"/>
</div>

<!-- west Region #10 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed10Label"/>-4" >
 <bean:message key="westSeed10Label"/>
</div>


<!-- west Region #2 - <bean:message key="westSeed2Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="westSeed2Label"/>" >
 <bean:message key="westSeed2Label"/>
</div>

<!-- west Region #2 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed2Label"/>-2" >
 <bean:message key="westSeed2Label"/>
</div>

<!-- west Region #2 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed2Label"/>-3" >
 <bean:message key="westSeed2Label"/>
</div>

<!-- west Region #2 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed2Label"/>-4" >
 <bean:message key="westSeed2Label"/>
</div>


<!-- west Region #15 - <bean:message key="westSeed15Label"/> Round 2 -->
<div class="round2Game8" ID="<bean:message key="westSeed15Label"/>" >
 <bean:message key="westSeed15Label"/>
</div>

<!-- west Region #15 - Sweet Sixteen -->
<div class="round3Game4" ID="<bean:message key="westSeed15Label"/>-2" >
 <bean:message key="westSeed15Label"/>
</div>

<!-- west Region #15 - Elite 8 -->
<div class="elite8Game2" ID="<bean:message key="westSeed15Label"/>-3" >
 <bean:message key="westSeed15Label"/>
</div>

<!-- west Region #15 - Final Four -->
<div class="finalFour" ID="<bean:message key="westSeed15Label"/>-4" >
 <bean:message key="westSeed15Label"/>
</div>
</div>

<div id="ffBracket" style="display:none">
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
<div id="eastWinner"></div>
</div>
<div class="semisGame1Team2">
<div id="southWinner"></div>
</div>
<div class="semisGame2Team1">
<div id="midwestWinner"></div>
</div>
<div class="semisGame2Team2">
<div id="westWinner"></div>
</div>

<!-- Finalist 1 -->
<div class="finalsTeam1" ID="<%= session.getAttribute("eastFFLabel") %>-FF">
 <div id="finalist1"></div>
</div>
<!-- Finalist 2 -->
<div class="finalsTeam2" ID="<%= session.getAttribute("southFFLabel") %>">
<div id="finalist2"></div>
</div>
<!-- Champion -->
<div class="champion" ID="<%= session.getAttribute("eastFFLabel") %>-champion" >
<div id="champion"></div>
</div>
<!--  NO COMMENTS
<div class="commentFormLabel">Polite Comments</div>
<div class="errorLabel">
<font color="red">
<% String errorCode = (String)request.getAttribute("errorCode");if(errorCode != null){ %><%=errorCode%><%}%></font></div>
<div class="commentForm">
  <form name="submitCommentForm" action="addcomment.do" method="POST">
    <table><tr><td class="commentField">Name:</td><td><select name="author" size="1"><option value="">[Choose your name]</option>    
    <% String[] bracketNames = (String[])session.getAttribute("bracketnames");
       for(int i=0; i<bracketNames.length; i++)
       {
    %>
    	<option value="<%=bracketNames[i]%>"><%=bracketNames[i] %></option>
    <% } %>
    </select></td></tr>
     <tr><td class="commentField">Comment:</td><td><input type="text" name="comment" value="" maxlength="40" size="30"/></td></tr></table>
	 <tr><td width="60">&#160;</td><td align="right"><input type="submit" name="submit" value="Talk Trash"/></td></tr></table>
  </form>
</div>
</div>
<div class="scrollcomments" align="left">
  <script language="JavaScript">document.write('<table align="left" border="2"><tr><td width='+wwidth+'px>');if(document.getElementById || document.all){document.write('<span style="width:'+wwidth+'px;"><div style="position:relative;overflow:hidden;width:'+wwidth+'px;height:'+wheight+'px;clip:rect(0 '+wwidth+'px '+wheight+'px 0);background-color:'+wbcolor+';" onMouseover="sspeed=0;" onMouseout="sspeed=restart">');if(operbr!=-1)document.write('<div id="operaslider" style="position:absolute;visibility:hidden;"></div>');document.write('<div id="wslider" style="position:absolute;height:'+wheight+'px;"></div></div></span>')}</script>
  <ilayer width=&{wwidth}; height=&{wheight}; name="wslider1" bgcolor=&{wbcolor};><layer name="wslider2" width=&{wwidth}; height=&{wheight}; onMouseover="sspeed=0;" onMouseout="sspeed=restart"></layer></ilayer>
</div>
END NO COMMENTS -->
</body>
</html>
