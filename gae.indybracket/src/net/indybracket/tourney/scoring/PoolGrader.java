package net.indybracket.tourney.scoring;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Vector;

import net.indybracket.tourney.common.BeatenTable;
import net.indybracket.tourney.common.Bracket;
import net.indybracket.tourney.common.BracketResult;

public class PoolGrader 
{
	Bracket moMaster;
	Scorer  moScorer;
	
	public PoolGrader (Scorer oScorer, Bracket oMaster)
	{
		moScorer = oScorer;
		moMaster = oMaster;
	}
	
	public PoolStandings gradePool(File oDir) throws IOException
	{
		String oFiles[] = oDir.list();
		Vector oEntries = new Vector();
		for (int i = 0; i < oFiles.length; i++)
		{
			String sFile = oFiles[i];
			if (!sFile.endsWith(".csv"))
			{
				continue;
			}
			
			// read a bracket
			FileInputStream oCSV = new FileInputStream(oDir.toString()+ "/" + sFile);
			Bracket oBracket = Bracket.newInstance();
			oBracket = Bracket.newInstance();
			oBracket.importCSV(oCSV, true);
			oCSV.close();
			oBracket.setName(sFile);
			oEntries.add(oBracket);
		}
		
		return gradePool((Bracket[]) oEntries.toArray(new Bracket[oEntries.size()]),
                new BeatenTable(), "score","desc");
	}
	
	public PoolStandings gradePool(Bracket[] oEntries, BeatenTable oBeatenBy, String sSortBy, String sAsc)
	{
		Grader oGrader = new Grader(moScorer, moMaster);
		BracketResult[] oResults = new BracketResult[oEntries.length];
		for (int i = 0; i < oEntries.length; i++)
		{
			try
			{
				oResults[i] = oGrader.grade(oEntries[i]);
			}
			catch (Exception oEx)
			{
				throw new RuntimeException("Failure to grade " + oEntries[i].getName(), oEx);
			}
		}
	          
		fillInBetterBrackets(oResults, oBeatenBy);		
		Arrays.sort(oResults, BracketResult.comparator(sSortBy,Boolean.parseBoolean(sAsc)));
		
		return new PoolStandings(oResults);
	}

	private void fillInBetterBrackets(BracketResult[] oResults, BeatenTable oBeatenBy) 
	{
		Arrays.sort(oResults, BracketResult.comparator("score",false));
		for (int i=0; i < oResults.length; i++)
		{
			BracketResult oResult = oResults[i];
            
            // skip this bracket, don't need the info
            if (oBeatenBy.get(oResult.getBracket().getName()).length() > 0)
            {
                continue;
            }
            
			Bracket oBestBracket = Grader.getBest(moMaster, oResult.getBracket());
			Grader oGrader = new Grader(moScorer, oBestBracket);
			for (int j=0; j < oResults.length; j++)
			{
				// this one is useless if he can't beat our current score
				if (oResults[j].getMax() < oResult.getScore())
				{
					continue;
				}
				if(oResults[j].getBracket().getName().startsWith("Celebrity", 0))
				{
					continue;
				}
				// if our best can't beat this guy, we are cooked
				if (oGrader.grade(oResults[j].getBracket()).getScore() > oResult.getMax())
				{
					// oBracket.setBetterBracket(oResults[j].getBracket());
                    oBeatenBy.addBeaten(oResult.getBracket().getName(), oResults[j].getBracket().getName());
					break;
				}
			}
		}
		
		
	}         
	
}
