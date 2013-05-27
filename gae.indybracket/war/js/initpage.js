function initPage()
{
	document.onkeyup = KeyCheck;
	var eastW = document.getElementById("eastWinnersSession").innerHTML;
	var southW = document.getElementById("southWinnersSession").innerHTML;
	var midwestW = document.getElementById("midwestWinnersSession").innerHTML;
	var westW = document.getElementById("westWinnersSession").innerHTML;
	var ffW = document.getElementById("ffWinnersSession").innerHTML;
	populateRegions(eastW,southW,midwestW,westW,ffW,false);

	var sErrorCode = document.getElementById("sErrorCode").innerHTML;
	var sMissingRegion = document.getElementById("sMissingRegion").innerHTML;
	var bGoodValidate = document.getElementById("bGoodValidate").innerHTML;

	viewBracket("east",1, sMissingRegion, sErrorCode, bGoodValidate);		
}  