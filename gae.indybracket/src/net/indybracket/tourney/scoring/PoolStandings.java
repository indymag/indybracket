package net.indybracket.tourney.scoring;


public class PoolStandings 
{
	public BracketResult[] moResults;
	
	public PoolStandings(BracketResult[] oResults)
	{
		moResults = oResults;
	}


	public void printStandings()
	{
        for (int i=0; i < moResults.length; i++)
        {
            BracketResult oResult = (BracketResult) moResults[i];
            String sBetterName = oResult.getBetterBracket() == null ? "no one" : oResult.getBetterBracket().getName();
            System.out.println(( i+1) + " Entry: " + oResult.getBracket().getName() +
                    ";\t\t Champion = " + oResult.getBracket().getChampionship().getWinner().getName() + 
                    ";\t score = " + oResult.getScore() +
                    ";\t max = " + oResult.getMax() +
                    ";\t eliminated by = " + sBetterName
                    ); 
        }
	}
}
