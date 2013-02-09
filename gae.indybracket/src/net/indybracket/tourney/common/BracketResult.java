package net.indybracket.tourney.common;

import java.util.Comparator;


public class BracketResult extends Bracket 
{
    private long mnScore = 0;
    private long mnMax = 0;
    private Bracket moBracket;
    private Bracket moBetterBracket;
    
    public long getScore()
    {
        return mnScore;
    }
    
    public void setScore(long score)
    {
        mnScore = score;
    }
    
    public long getMax()
    {
        return mnMax;
    }
    
    public void setMax(long val)
    {
    	mnMax = val;
    }
    
    public boolean isChampionAlive()
    {
    	Match oChampionship = this.getChampionship();
    	return oChampionship.msData.indexOf('#') == -1;
    }
    public String getChampion()
    {
    	Match oChampionship = this.getChampionship();
    	return oChampionship.getWinner().getName();
    }
    public int getNumFinalFourAlive()
    {
    	Match oChampionship = this.getChampionship();
    	Match oFF1 = oChampionship.getPreMatch1().getPreMatch1();
    	Match oFF2 = oChampionship.getPreMatch1().getPreMatch2();
    	Match oFF3 = oChampionship.getPreMatch2().getPreMatch1();
    	Match oFF4 = oChampionship.getPreMatch2().getPreMatch2();
    	int num = 0;
    	
    	if (oFF1.msData.indexOf('#') == -1)
    	{
    		num++;
    	}
    	if (oFF2.msData.indexOf('#') == -1)
    	{
    		num++;
    	}
    	if (oFF3.msData.indexOf('#') == -1)
    	{
    		num++;
    	}
    	if (oFF4.msData.indexOf('#') == -1)
    	{
    		num++;
    	}
    	
    	
    	return num;
    }
    
    public Bracket getBracket()
    {
        return moBracket;
    }
    
    public void setBracket(Bracket val)
    {
    	moBracket = val;
    }
    
    public Bracket getBetterBracket()
    {
        return moBetterBracket;
    }
    
    public void setBetterBracket(Bracket val)
    {
    	moBetterBracket = val;
    }
    public static Comparator comparator(String sSortBy, boolean bAsc)
    {
        return new BracketResult().new BracketResultComparator(sSortBy, bAsc);
    }

    public class BracketResultComparator implements Comparator
    {
        private String msSortBy = "score";
        private boolean mbAscending = false;
        public BracketResultComparator(String sSortBy, boolean bAsc)
        {
        	msSortBy = sSortBy;
            mbAscending = bAsc;
        }
        public int compare(Object arg0, Object arg1)
        {
        	int returnVal = 0;;
        	
        	BracketResult oOne = (BracketResult) arg0;
        	BracketResult oTwo = (BracketResult) arg1;
        	if(msSortBy.equals("ff"))
        	{
	        	if (oOne.getNumFinalFourAlive() > oTwo.getNumFinalFourAlive()) {
	                returnVal = -1;
	            }
	            else if (oOne.getNumFinalFourAlive() < oTwo.getNumFinalFourAlive()) {
	                returnVal = 1;
	            }
        	}
        	else if(msSortBy.equals("winner"))
        	{
        		boolean bIsOneAlive = oOne.isChampionAlive();
        		boolean bIsTwoAlive = oTwo.isChampionAlive();
        		if(bIsOneAlive && !bIsTwoAlive)
        		{
        			returnVal = -1;
        		}
        		else if(!bIsOneAlive && bIsTwoAlive)
        		{
        			returnVal = 1;
        		}
        		else
        		{
        			returnVal = oOne.getChampion().compareTo(oTwo.getChampion());
        		}
        	}
        	else if(msSortBy.equals("better"))
        	{
        		Bracket oBetterBracket1 = oOne.getBetterBracket();
        		Bracket oBetterBracket2 = oTwo.getBetterBracket();
        		if((oBetterBracket1 != null) && (oBetterBracket2 == null))
        		{
        			returnVal = -1;
        		}
        		else if((oBetterBracket1 == null) && (oBetterBracket2 != null))
        		{
        			returnVal = 1;
        		}
        		else
        		{
        			returnVal = 0;
        		}
        	}	        		
        	else if(msSortBy.equals("max"))
        	{
        		if (oOne.getMax() > oTwo.getMax()) {
        			returnVal = -1;
        		}
        	
        		else if (oOne.getMax() < oTwo.getMax()) {
        			returnVal = 1;
        		}
        	}
        	else
        	{
	        	if (oOne.getScore() > oTwo.getScore()) {
	                returnVal = -1;
	            }
	            else if (oOne.getScore() < oTwo.getScore()) {
	                returnVal = 1;
	            }
        	}

            if(mbAscending)
            {
                returnVal = -(returnVal);
            }	
            
            return returnVal;
        }
        
    }
}
