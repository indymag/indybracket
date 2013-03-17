
// JavaScript Document
<!--
	// Default
 	var bracketViewing = new BracketViewing("east", 1);
	
	var winners = new Array(15);
	var east_winners = new Array(15);
	var south_winners = new Array(15);
	var midwest_winners = new Array(15);
	var west_winners = new Array(15);
	var ffWinners = new Array(3);	
	
	function BracketViewing(oName,oId)
	{
		this.name = oName;
		this.id = oId;
	}
	function GameStatus(oTeam, oType, oPoints)
	{
		this.team = oTeam;
		this.type = oType;
		this.points = oPoints;
	}

	function goRegion(home,destination){
		var form = document.winnersForm;
		form.hRegion.value = home;
		form.dRegion.value = destination;
		form.winners.value = (home == "ff") ? ffWinners : winners;
		form.submit();		
	}


	function getGameStatus(oTeam, oGame)
	{
		var statusLoss = oTeam.split("#");
		var statusWin = oTeam.split("$");
		var statusUnknown = oTeam.split("@");

		if(statusLoss.length > 1)
		{
			var oTeam = statusLoss[0];
			if(oGame)
			{
				oTeam += "-" + oGame;
			}
			return new GameStatus(oTeam, "loss", statusLoss[1]);
		}
		else if(statusWin.length > 1)
		{			
			var oTeam = statusWin[0];
			if(oGame)
			{
				oTeam += "-" + oGame;
			}
			return new GameStatus(oTeam, "win", statusWin[1]);
		}
		else if(statusUnknown.length > 1)
		{				
			var oTeam = statusUnknown[0];
			if(oGame)
			{
				oTeam += "-" + oGame;
			}
			return new GameStatus(oTeam, "unknown", statusUnknown[1]);
		}
		return null;
	}

	function setFFParticipantsStatus(east,south,midwest,west)
	{
		var eastStatus = getGameStatus(east);		
		var southStatus = getGameStatus(south);
		var midwestStatus = getGameStatus(midwest);
		var westStatus = getGameStatus(west);

		setScoringStatus(document.getElementById("eastWinner"), eastStatus);
		setScoringStatus(document.getElementById("southWinner"), southStatus);
		setScoringStatus(document.getElementById("midwestWinner"), midwestStatus);
		setScoringStatus(document.getElementById("westWinner"), westStatus);
	}
	function setScoringStatus(winId,oGameStatus)
	{
		var oPoints = oGameStatus.points;
		var oTeam = oGameStatus.team;
		
		winId.innerHTML = takeOffDash(oTeam) + " ("+oPoints+")";		

		setStatusColor(winId,oGameStatus.type);
	}
	function setStatusColor(winId,type)
	{
		if(type == "loss")
		{
			winId.style.textDecoration="line-through";
			winId.style.color = "red";
		}
		else if(type == "win")
		{
			winId.style.color = "green";
		}
		else if(type == "unknown")
		{
			winId.style.color = "blue";
		}				
	}

	function populateRegions(eastW,southW,midwestW,westW,ffW,bScoring,eastFF,southFF,midwestFF,westFF)
	{		
		populate(eastW,bScoring,1);	
		populate(southW,bScoring,2);	
		populate(midwestW,bScoring,3);	
		populate(westW,bScoring,4);
		populateFF(ffW,eastFF,southFF,midwestFF,westFF,bScoring)
	}
	function populate(winners,bScoring,regionId){
	
  	  if(winners != "null"){

	    var splitWinners = winners.split(",");

	    if(splitWinners){
		//set 2nd round games
		for(var i =0; i<8; i++){
		   if(splitWinners[i]){
			if(splitWinners[i] != ""){
			  if(bScoring == true)
			  {
				var oGameStatus = getGameStatus(splitWinners[i]);
				setWinner(oGameStatus, i+1,true,regionId);
			  }
			  else
			  {
				setWinner(splitWinners[i],i+1,false,regionId);
			  }
			 }
		    }
		}
		
		//set sweet sixteen games	
		for(var j=8; j<12; j++){
		   if(splitWinners[j]){
			if(splitWinners[j] != ""){
			  if(bScoring == true)
			  {
				var oGameStatus = getGameStatus(splitWinners[j],2);
				setWinner(oGameStatus,j+1,true,regionId);
			  }
			  else
			  {
				  setWinner(splitWinners[j]+"-2",j+1,false,regionId);
			  }
			 }
		    }
		}

		//set elite 8 games	
		for(var k=12; k<14; k++){
		   if(splitWinners[k]){
			if(splitWinners[k] != ""){
			 if(bScoring == true)
			 {
			   var oGameStatus = getGameStatus(splitWinners[k],3);
			   setWinner(oGameStatus,k+1,true,regionId);
		     }
			 else
			 {
				setWinner(splitWinners[k]+"-3",k+1,false,regionId); 
			 }
		    }
		   }
		}
		// set region winner
	  	  if(splitWinners[14]){
			if(splitWinners[14] != ""){		
			 if(bScoring == true)
			 {
			   var oGameStatus = getGameStatus(splitWinners[14],4);
			   setWinner(oGameStatus,15,true,regionId);
		     }
			 else
			 {
				setWinner(splitWinners[14]+"-4",15,false,regionId);	 
			 }
			}
	 	  }
	    }
	  }
	}
	function populateFF(winners,east,south,midwest,west,bScoring){
	 if(bScoring == true)
	 {
		 setFFParticipantsStatus(east,south,midwest,west);
  	 }
	 if((winners != "null") && (winners != "")){
		var splitFFWinners = winners.split(",");
		if(splitFFWinners){
			if(splitFFWinners[0]){
				if(splitFFWinners[0] != "")
				{
				 if(bScoring == true)
				 {
					var oGameStatus = getGameStatus(splitFFWinners[0]);
					setFFWinner(oGameStatus,1,true);
				 }
				 else
				 {
					setFFWinner(splitFFWinners[0],1,false);
				 }
				}
			 }
			if(splitFFWinners[1] != ""){
				if(splitFFWinners[1] != ""){
				 if(bScoring == true)
				 {
					var oGameStatus = getGameStatus(splitFFWinners[1]);
					setFFWinner(oGameStatus,2,true);
				 }
				 else
				 {
					setFFWinner(splitFFWinners[1],2,false);
				 }
				}
			 }
			if(splitFFWinners[2] != ""){
				if(splitFFWinners[2] != ""){
				 if(bScoring == true)
				 {
					var oGameStatus = getGameStatus(splitFFWinners[2]);
					setChamp(oGameStatus,true);
				 }
				 else
				 {
					setChamp(splitFFWinners[2],false);
				 }
				}
			 }
		}
	   }	
	}
	function setWinner(oGameStatus,game,bScoring,regionId)
	{
		// setting winner, must validate again
		var validatedNode = document.getElementById("validated");
		if(validatedNode)
		{
			validatedNode.style.display="none";
		}
		
		var regionName = (regionId) ? findName(regionId) : bracketViewing.name;
		var findWinnersByThisId = (regionId) ? regionId : bracketViewing.id;
		var winnersList = findWinnersList(findWinnersByThisId);
		var oTeam = (bScoring == true) ? oGameStatus.team : oGameStatus;
		var winId = document.getElementById(oTeam);		
		if(winId){
			winId.style.visibility="visible";
			if(bScoring == true)
			{
				setScoringStatus(winId,oGameStatus);		
			}
		}
		oWinner = takeOffDash(oTeam);
		var prevWinner;
		prevWinner = winnersList[game-1];
		winnersList[game-1] = oWinner;

		removeLoser(prevWinner,oWinner,game);
		
		// Going to Final Four ?
		if(game == "15")
		{
			document.getElementById(regionName + "Winner").innerHTML = escapeHTML(oWinner);	
		}
	}
	function escapeHTML(someText) {
 	 var div = document.createElement('div');
  	var text = document.createTextNode(someText);
  	div.appendChild(text);
  	return div.innerHTML;
	}
	function setFFWinner(gameStatus,game,bScoring,region){
		// setting winner, must validate again
		var validatedNode = document.getElementById("validated");
		if(validatedNode)
		{
			validatedNode.style.display="none";
		}
		var oTeam;
		if(!region)
		{	
			oTeam = (bScoring == true) ? gameStatus.team : gameStatus;
	}
		else
		{
			oTeam = document.getElementById(region+"Winner").innerHTML;
			oTeam = stripLinkTag(oTeam);
	}
		
	var winId = document.getElementById("finalist"+game);
	if(winId){
			winId.style.visibility="visible";
			winId.innerHTML = escapeHTML(oTeam);
			if(bScoring == true)
			{
			//	setStatusColor(winId,gameStatus.type);
				setScoringStatus(winId,gameStatus);
			}
		}	

		var prevWinner;
		prevWinner = ffWinners[game-1];
		ffWinners[game-1] = oTeam;

	//	removeLoser(prevWinner,oTeam,game);
		if(prevWinner == ffWinners[2]){
			removeChamp(ffWinners[2],oTeam);
		}
		
	}
	function setChamp(winner,bScoring,id){
		var game = 3;		
		var oTeam;
		var winId;
		
		if(winner)	
		{
			oTeam = (bScoring == true) ? winner.team : winner;
		}
		else
		{
			oTeam = document.getElementById("finalist"+id).innerHTML;
			oTeam = stripLinkTag(oTeam);
		}
		var winId = document.getElementById("champion");
		if(winId){
			winId.style.visibility="visible";
			winId.innerHTML = escapeHTML(oTeam) + " CHAMPION";
			
			if(bScoring == true)
			{
			//	setStatusColor(winId,winner.type);		
				setScoringStatus(winId,winner);
			}
		}	
		
		var prevWinner;
		prevWinner = ffWinners[game-1];

		ffWinners[game-1] = oTeam;

	}
	function goFinalFour(home,view){
		var form = document.ffForm;
		form.winners.value = winners;
		form.hRegion.value = home;
		form.view.value = view;
		form.submit();
	 }
	
	function validatePicks(){
		var form = document.validateForm;
		form.eastWinners.value = east_winners;
		form.midwestWinners.value = midwest_winners;
		form.southWinners.value = south_winners;
		form.westWinners.value = west_winners;
		form.ffWinners.value = ffWinners;
		form.submit();
	}
	function savePicks(){
		var form = document.saveForm;
		form.eastWinners.value = east_winners;
		form.midwestWinners.value = midwest_winners;
		form.southWinners.value = south_winners;
		form.westWinners.value = west_winners;
		form.ffWinners.value = ffWinners;
		form.submit();
	}

	function removeChamp(prevWinner,winner){	
		if(prevWinner){
			if(prevWinner != winner){
				loseId = document.getElementById("champion");
				if(loseId){
					loseId.style.visibility="hidden";}
				ffWinners[2] = "";
			}
		}
	}
	function removeLoser(prevWinner,winner,game){
	 if(prevWinner){
	    // winner is changing for this game, so remove tree
			if(prevWinner != winner){
				removeTree(prevWinner,game);
			}
		}	
	}
	function removeTree(loser, game){
		var loseId;
		var winnersList = findWinnersList(bracketViewing.id);

		// Remove from Champion
		if (winnersList.length == 3)
		{
			ffWinners[2] = "";
			document.getElementById("champion").innerHTML = "";
			return;			
		}
		if(game == 15){
			loseId = document.getElementById(loser+"-4");
			loseId.style.visibility="hidden";
		}
		else if((game == 13) || (game == 14)){
			 loseId = document.getElementById(loser+"-3");
			 loseId.style.visibility="hidden";
			if(winnersList[14] == loser){
			 loseId = document.getElementById(loser+"-4");
			 loseId.style.visibility="hidden";
			 winnersList[14] = "";}
		 }
		 else if((game == 11) || (game == 12)){
		 	// current game
			loseId = document.getElementById(loser+"-2");
			loseId.style.visibility="hidden";
			// now remove tree
			if(winnersList[13] == loser){
			 loseId = document.getElementById(loser+"-3");
			 loseId.style.visibility="hidden";
			 winnersList[13] = "";}
			if(winnersList[14] == loser){
			 loseId = document.getElementById(loser+"-4");
			 loseId.style.visibility="hidden";
			 winnersList[14] = "";}
		 }
		 else if((game == 9) || (game == 10)){
		 	// current game
			loseId = document.getElementById(loser+"-2");
			loseId.style.visibility="hidden";
			// now remove tree
			if(winnersList[12] == loser){
			 loseId = document.getElementById(loser+"-3");
			 loseId.style.visibility="hidden";
			 winnersList[12] = "";}
			if(winnersList[14] == loser){
			 loseId = document.getElementById(loser+"-4");
			 loseId.style.visibility="hidden";
			 winnersList[14] = "";}
		 }
		 else if((game >= 1) && (game <= 4)){
			// current game
			loseId = document.getElementById(loser);
			loseId.style.visibility="hidden";
			// now remove tree
			if((winnersList[8] == loser)&&((game == 1) || (game == 2))){
			 loseId = document.getElementById(loser+"-2");
			 loseId.style.visibility="hidden";
			 winnersList[8] = "";}
			else if((winnersList[9] == loser)&&((game == 3) || (game == 4))){
			 loseId = document.getElementById(loser+"-2");
			 loseId.style.visibility="hidden";
			 winnersList[9] = "";} 			 
			if(winnersList[12] == loser){
			 loseId = document.getElementById(loser+"-3");
			 loseId.style.visibility="hidden";
			 winnersList[12] = "";}
			if(winnersList[14] == loser){
			 loseId = document.getElementById(loser+"-4");
			 loseId.style.visibility="hidden";
			 winnersList[14] = "";}
		 }
		 else if((game >= 5) && (game <= 8)){
			// current game
			loseId = document.getElementById(loser);
			loseId.style.visibility="hidden";
			// now remove tree

			if((winnersList[10] == loser)&&((game == 5) || (game == 6))){
			 loseId = document.getElementById(loser+"-2");
			 loseId.style.visibility="hidden";
			 winnersList[10] = "";}
			else if((winnersList[11] == loser)&&((game == 7) || (game == 8))){
			 loseId = document.getElementById(loser+"-2");
			 loseId.style.visibility="hidden";
			 winnersList[11] = "";} 			 
			if(winnersList[13] == loser){
			 loseId = document.getElementById(loser+"-3");
			 loseId.style.visibility="hidden";
			 winnersList[13] = "";}
			if(winnersList[14] == loser){
			 loseId = document.getElementById(loser+"-4");
			 loseId.style.visibility="hidden";
			 winnersList[14] = "";}
		}
		// Check FF
		removeFromFF(loser);
	}
	function removeFromFF(loser)
	{
		// Check FF participancy
		var ffTeamId = document.getElementById(bracketViewing.name + "Winner");
		var ffTeam = stripLinkTag(ffTeamId.innerHTML);
		
		if(ffTeam == loser)
		{
			ffTeamId.innerHTML = "";
		}
		else
		{
			return;
		}
		
		// Check FF winners
		if(ffWinners[0] == loser)
		{
			ffWinners[0] = "";
			document.getElementById("finalist1").innerHTML = "";
		}
		else if(ffWinners[1] == loser)
		{		
			ffWinners[1] = "";
			document.getElementById("finalist2").innerHTML = "";
		}
		else
		{
			return;
		}
		// Check FF Champion
		if(ffWinners[2] == loser)
		{
			ffWinners[2] = "";
			document.getElementById("champion").innerHTML = "";
		}
	}
	
	function takeOffDash(name){
		if(!name)
			return;
		// strip number off of name
		var splitName;
		var returnName;
		var dashIndex = name.indexOf("-");
		if(dashIndex > -1){
		  splitName = name.split("-");
	      returnName = splitName[0];
		}
		else{
			returnName = name;		
		}
		return returnName;
	}  

	 // sMissingRegion exists if Validate failed on a region
	 // sErrorCode exists if Save failed
	  function viewBracket(region,id, sMissingRegion, sErrorCode, bGoodValidate)
	  {	  	   
	  	var sRegion = region;
	  	var sId = id;
	  	
	  	// Validate failed - go to missing region
	  	if(sMissingRegion && (sMissingRegion != "null") && (sMissingRegion != ""))
	  	{
	  		sRegion = sMissingRegion;
	  		sId = findId(sRegion);
	  	}
	  	// Save failed
		else if(sErrorCode && ((sErrorCode != "null") && (sErrorCode != "")) || (bGoodValidate == "true"))
	  	{
	  		sRegion = "ff";
	  		sId = 5;	  		
	  	}
	  	
		deSelect(bracketViewing.name);
		select(sRegion);
			
		bracketViewing.name = sRegion;
		bracketViewing.id = sId;
		
		// Validate failed - alert error message
		if(sMissingRegion && (sMissingRegion != "null") && (sMissingRegion != ""))
	  	{
	  		var sMissing = sRegion;
	  		if(sRegion == "ff")
	  		{
	  			sMissing = "Final Four";
	  		}
	  		alert("Missing picks in " + sMissing);
		}
		else if(sErrorCode && (sErrorCode != "null") && (sErrorCode != ""))
	  	{
	  		alert(sErrorCode);
	  	}
	  	else if(bGoodValidate == "true")
	  	{
	  		document.getElementById("validated").style.display="block";
		}		
	  }
	
		function KeyCheck(e)
		{
	   		var KeyID = (window.event) ? event.keyCode : e.keyCode;
	
		   switch(KeyID)
		   {
			
	       case 37:
		     goLeft();
		     break;
		      
	      case 39:
	      	goRight();
			break;
	   	  }
		}

function gup( name )
{
      name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
      var regexS = "[\\?&]"+name+"=([^&#]*)";
      var regex = new RegExp( regexS );
      var results = regex.exec( window.location.href );
      if( results == null )
         return "";
      else
         return results[1];
}

		function deSelect(name)
		{
			document.getElementById(name + "Bracket").style.display = "none";
			var tabStyle = document.getElementById("_" + name + "Tab").style;
			tabStyle.backgroundColor= "#cccccc";      
            tabStyle.borderBottomColor = "#0066cc";
            if (document.getElementById("bracketname") != null) {
              document.getElementById("bracketname").innerHTML= gup("name");
            }
            
            if(name == "ff"){
            	document.getElementById("bracketBars").style.display = "block";
          	// document.getElementById("trashtalklink").style.display = "block";
            }
		}
		function select(name)
		{			
			document.getElementById(name + "Bracket").style.display = "block";
			var tabStyle = document.getElementById("_" + name + "Tab").style;
			tabStyle.backgroundColor= "#ccccf0";      
            tabStyle.borderBottomColor = "#ccccf0";
            
            if(name == "ff"){
            	document.getElementById("bracketBars").style.display = "none";
            	// document.getElementById("trashtalklink").style.display = "none";
            	 // document.forms[0].comment.focus();
           	}
		}
		
		function goLeft()
		{
			var newRegionId = (bracketViewing.id) - 1;
			newRegionId = (newRegionId == 0) ? 5 : newRegionId;
			viewBracket(findName(newRegionId), newRegionId);
		}
		function goRight()
		{	
			var newRegionId = (bracketViewing.id) + 1;
			newRegionId = (newRegionId == 6) ? 1 : newRegionId;
			viewBracket(findName(newRegionId), newRegionId);
		}
		function findName(id)
		{
			switch(id)
			{
				case 1:
				return "east";

				case 2:
				return "south";

				case 3:
				return "midwest";

				case 4:
				return "west";
				
				case 5:
				return "ff";
			}
		}
		function findId(name)
		{
			switch(name)
			{
				case "east":
				return 1;

				case "south":
				return 2;

				case "midwest":
				return 3;

				case "west":
				return 4;
				
				case "ff":
				return 5;
			}
		}
		function findWinnersList(id)
		{
			switch(id)
			{
				case 1:
				return east_winners;

				case 2:
				return south_winners;

				case 3:
				return midwest_winners;

				case 4:
				return west_winners;
				
				case 5:
				return ffWinners;
				
			}
		}
		function stripLinkTag(team)
		{
			var strippedTeam = team;
			
			if(team)
			{
if(team.charAt(0) == "<")
{	
    var start=0;
    for (start=0; team.charAt(start) !== ">"; start++)
    {
    }
    strippedTeam = team.substring(start+1,team.length - 4);
}
strippedTeam = strippedTeam.replace("amp;","");
			}
			
			return strippedTeam;
		}	
		function randomizer()
		{
			var region = bracketViewing.name;
			var bracketDiv = document.getElementById(region+"Bracket");
			var allDivs = document.getElementsByTagName("div");
			var matchup = new Array(2);
			resetMatchup(matchup);
			var gameCounter = 0;
			
			// Round 1
			for(var i=0; i < allDivs.length; i++)
			{
				//Search with divs starting with 'round1';
				var className = allDivs[i].className;
				if(className.substr(0,6) == "round1")
				{
					gameCounter++;
					var val = allDivs[i].textContent;
					var team = val.replace(/\n/g, "");
					team = team.match(/^\s*(.*\S)\s*$/);
					team = (team !== null && team.length === 2) ? team[1] : team;
					var bTimeToSelect = addToMatchup(matchup,team);
					if(bTimeToSelect)
					{
						randomlySelect(matchup,gameCounter/2);
					}
				}
			}
			gameCounter = 0;
			resetMatchup(matchup);
			
			// Round 2
			for(var i=0; i < allDivs.length; i++)
			{
				//Search with divs starting with 'round2';
				var className = allDivs[i].className;
				if(className.substr(0,6) == "round2")
				{
					if(allDivs[i].style.visibility == "visible")
					{
						gameCounter++;
						var val = allDivs[i].textContent;
						var team = val.replace(/\n/g, "");
						team = team.match(/^\s*(.*\S)\s*$/);
						team = (team !== null && team.length === 2) ? team[1] : team;
						var bTimeToSelect = addToMatchup(matchup,team);
						if(bTimeToSelect)
						{
							randomlySelect(matchup,(gameCounter/2) + 8, 2);
						}
					}
				}
			}
			gameCounter = 0;
			resetMatchup(matchup);
		
			// Round 3
			for(var i=0; i < allDivs.length; i++)
			{
				//Search with divs starting with 'round3';
				var className = allDivs[i].className;
				if(className.substr(0,6) == "round3")
				{
					if(allDivs[i].style.visibility == "visible")
					{
						gameCounter++;
						var val = allDivs[i].textContent;
						var team = val.replace(/\n/g, "");
						team = team.match(/^\s*(.*\S)\s*$/);
						team = (team !== null && team.length === 2) ? team[1] : team;
						var bTimeToSelect = addToMatchup(matchup,team);
						if(bTimeToSelect)
						{
							randomlySelect(matchup,(gameCounter/2) + 12, 3);
						}
					}
				}
			}		
			// Round 4
			for(var i=0; i < allDivs.length; i++)
			{
				//Search with divs starting with 'round3';
				var className = allDivs[i].className;
				if(className.substr(0,6) == "elite8")
				{
					if(allDivs[i].style.visibility == "visible")
					{
						gameCounter++;
						var val = allDivs[i].textContent;
						var team = val.replace(/\n/g, "");
						team = team.match(/^\s*(.*\S)\s*$/);
						team = (team !== null && team.length === 2) ? team[1] : team;
						var bTimeToSelect = addToMatchup(matchup,team);
						if(bTimeToSelect)
						{
							randomlySelect(matchup,(gameCounter/2) + 14, 4);
						}
					}
				}
			}
		}
		function randomlySelect(matchup, game, round, regionId)
		{
			var roundAddition = (round) ? "-" + round : "";
			// randomize
			var i = Math.round(100*Math.random());
			setWinner((i<50) ? matchup[0] + roundAddition : matchup[1] + roundAddition, game, false, regionId);
		}
		function addToMatchup(matchup,team)
		{
			if(!matchup[0])
			{
				matchup[0] = team;
			}
			else if(!matchup[1])
			{
				matchup[1] = team;
				return true;
			}
			else
			{
				resetMatchup(matchup);
				matchup[0] = team;
			}			
		}
		function resetMatchup(matchup)
		{
			matchup[0] = null;
			matchup[1] = null;
		}
	//-->
