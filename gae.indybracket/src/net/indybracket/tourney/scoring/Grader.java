package net.indybracket.tourney.scoring;

import net.indybracket.tourney.common.Bracket;
import net.indybracket.tourney.common.FirstMatch;
import net.indybracket.tourney.common.Match;
import net.indybracket.tourney.common.Team;

public class Grader
{
    Bracket moMaster;
    Scorer  moScorer;
    
    public Grader (Scorer oScorer, Bracket oMaster)
    {
        moScorer = oScorer;
        moMaster = oMaster;
    }
    
    public BracketResult grade(Bracket oSubject)
    {        
    	// create a copy for ourselves
		BracketResult oResult = new BracketResult();
		oResult.getChampionship().copysheet(oSubject.getChampionship());
		
    	long score = gradeTree(moMaster.getChampionship(), oResult.getChampionship());
		long max = findMax(Bracket.createCopy(oSubject));
		
		// build basic results

		oResult.setScore(score);
		oResult.setMax(max);
		oResult.setBracket(oSubject);
		oResult.setTotalComments(oSubject.getTotalComments());
        return oResult;
    }
    
    public long findMax(Bracket oSubject)
    {
        return gradeTree(getBest(moMaster, oSubject).getChampionship(), oSubject.getChampionship());
    }
    
    public static Bracket getBest(Bracket oMaster, Bracket oSubject)
    {
        Bracket oBest = Bracket.createCopy(oMaster);
        fillBest(oBest.getChampionship(), oSubject.getChampionship());
        return oBest;
    }
    
    private static void fillBest(Match oBest, Match oSubject)
    {
        if (oBest.getWinner() != null)
        {
            return;
        }
        
        if (oBest.getRound() != 1)
        {
            fillBest(oBest.getPreMatch1(), oSubject.getPreMatch1());
            fillBest(oBest.getPreMatch2(), oSubject.getPreMatch2());
        }
        
        Team oSubjectWinner = oSubject.getWinner();
        if (oBest instanceof FirstMatch)
        {
            FirstMatch oFirstBest = (FirstMatch) oBest;
            if (oSubjectWinner == oFirstBest.moTeam1)
            {
                oBest.setStatus(1);
            }
            else if (oSubjectWinner == oFirstBest.moTeam2)
            {
                oBest.setStatus(2);
            }
        }
        else
        {
            if (oSubjectWinner == oBest.getPreMatch1().getWinner())
            {
                oBest.setStatus(1);
            }
            else if (oSubjectWinner == oBest.getPreMatch2().getWinner())
            {
                oBest.setStatus(2);
            }
        }
    }
    
    private long gradeTree(Match oMaster, Match oSubject)
    {
        long score = 0;
        
        try
        {
        	long nPotentialWin = moScorer.scoreWin(oSubject);

        	if (oMaster.getWinner() != null)
        	{
        		if (oMaster.getWinner() == oSubject.getWinner())
        		{
        			score += nPotentialWin;
        			oSubject.setScoringData("$" + nPotentialWin);
        		}
        		else
        		{
        			oSubject.setScoringData("#" + nPotentialWin);
        		}
        	}
        	else // winner has not been decided
        	{
        		// could still be a * if team has lost
        		if (canWin(oMaster, oSubject))
        		{
        			oSubject.setScoringData("@" + nPotentialWin);
        		}
        		else
        		{
        			oSubject.setScoringData("#" + nPotentialWin);
        		}

        	}
        }
        catch (Exception oEx)
        {
        	throw new RuntimeException("Error grading round " + oMaster.getRound());
        }
        
        if (oMaster.getRound() != 1)
        {
            score += gradeTree(oMaster.getPreMatch1(), oSubject.getPreMatch1());
            score += gradeTree(oMaster.getPreMatch2(), oSubject.getPreMatch2());
        }
        
        return score;
        
    }

	private boolean canWin(Match oMaster, Match oSubject) 
	{
		Team oSubjectWinner = oSubject.getWinner();
		
		// if a winner has been set for the master, return if true if there is a match
		if (oMaster.getWinner() != null)
		{
			return oMaster.getWinner() == oSubjectWinner;
		}
		
		// if the master is unset and is first round match, of course the team has a chance
		if (oMaster instanceof FirstMatch)
		{
			return true;
		}
		
        if (oSubjectWinner == oSubject.getPreMatch1().getWinner())
        {
            return canWin(oMaster.getPreMatch1(), oSubject.getPreMatch1());
        }
        else if (oSubjectWinner == oSubject.getPreMatch2().getWinner())
        {
        	return canWin(oMaster.getPreMatch2(), oSubject.getPreMatch2());
        }
        
        throw new RuntimeException("Really really unexpected.");
	}

}
