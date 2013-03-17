package net.indybracket.tourney.common;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import com.google.appengine.labs.repackaged.com.google.common.base.Splitter;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Bracket
{
    public static final int snNumRound = 6;
	public static final String PERFECT_ID = "MASTER";
	public static final String DEFAULT_REGION = " , , , , , , , , , , , , , , ";
	public static final String DEFAULT_FF = " , , ";
	public static final String BRACKET_NAME_REGEX = "^[a-zA-Z0-9_]+$";
    
    private @Id String msId;
    // Properties that are peristed
    private String msUserEmail;
    private String msUserNickname;
    private String msPrincipalName;
    private String msEntryName = "";
    private String msRegion1;
    private String msRegion2;
    private String msRegion3;
    private String msRegion4;
    private String msFF;

    // Constructed, not persisted.
    private final Match moChampionship;
    private final Match moBases[];
    
    /**
     * Use this for brackets that will never be persisted.
     */
    public static Bracket newTransientInstance()
    {
        Bracket bracket = new Bracket();
        return bracket;
    }

    /**
     * Use this for brackets that will be persisted.
     */
    public static Bracket newDbInstance(String id)
    {
        Bracket bracket = new Bracket();
        bracket.msId = id;
        return bracket;
    }
    
    public static Bracket createTransientCopy(Bracket oOrig)
    {
        Bracket oBracket = new Bracket();
        oBracket.getChampionship().copysheet(oOrig.getChampionship());
        return oBracket;
    }
    
    protected Bracket()
    {
        // create the base matches
        Team oTeams[] = Team.getTeams();
        moBases = new Match[oTeams.length / 2];
        for (int i = 0; i < moBases.length; i++)
        {
            moBases[i] = new FirstMatch(oTeams[i * 2], oTeams[i * 2 + 1]);
        }
        
        // create the remaining matches
        Match oPrevRound[] = moBases;
        while (oPrevRound.length != 1)
        {
            Match oRound[] = new Match[oPrevRound.length / 2];
            for (int i = 0; i < oRound.length; i++)
            {
                oRound[i] = new Match(oPrevRound[i * 2], oPrevRound[i * 2 + 1]);
            }
            
            oPrevRound = oRound;
        }
        
        moChampionship = oPrevRound[0];
        importFromWebapp(DEFAULT_REGION, DEFAULT_REGION, DEFAULT_REGION, DEFAULT_REGION, DEFAULT_FF);
    }
        
    /**
     * @return
     */
    public Match[] getBaseMatches()
    {
        return moBases;
    }
    
    /**
     * @return
     */
    public Match getChampionship()
    {
        return moChampionship;
    }
    
    public String toString()
    {
        String sReturn = null;
        try
        {
            ByteArrayOutputStream oOut = new ByteArrayOutputStream();
            prettyPrint(oOut);
            sReturn = oOut.toString();
        }
        catch(IOException oEx) 
        {            
        }
        
        return sReturn;
    }
    
    public void init() {
    	// Used when loading from data store.
    	importFromWebapp(msRegion1, msRegion2, msRegion3, msRegion4, msFF);
    }
    
    public void importFromWebapp(String s1, String s2, String s3, String s4, String sFF)    		
    {
        Vector oPicks[] = new Vector[7];
        for (int i=0; i < oPicks.length; i++)
        {
            oPicks[i] = new Vector();
        }
        
        Team[] oTeams = Team.getTeams();
        for (int i=0; i < oTeams.length; i++)
        {
            oPicks[0].add(oTeams[i].getName());
        }
        
        readRegion(oPicks, s1);
        readRegion(oPicks, s2);
        readRegion(oPicks, s3);
        readRegion(oPicks, s4);
                
        // remove the newline
        Iterator<String> oParts = Splitter.on(',').split(sFF).iterator();
        oPicks[5].add(oParts.next().trim());
        oPicks[5].add(oParts.next().trim());
        oPicks[6].add(oParts.next().trim());
        if (oParts.hasNext()) {
        	throw new RuntimeException("Invalid FF string");
        }
        
        importFromPicks(oPicks);
        
        // We want to persist the CSV strings as well for now
        msRegion1 = s1;
        msRegion2 = s2;
        msRegion3 = s3;
        msRegion4 = s4;
        msFF = sFF;
    }
    
    public void readRegion(Vector oPicks[], String sData)
    {
        // remove the newline
        List<String> oParts = Splitter.on(',').splitToList(sData);
        for (int i=0; i < oParts.size(); i++)
        {
            int nRound;
            if (i < 8)
                nRound = 1;
            else if (i < 12)
                nRound = 2;
            else if (i < 14)
                nRound = 3;
            else
                nRound = 4;
            
            oPicks[nRound].add(oParts.get(i).trim());
        }               
    }
    
    public void toWebAppStrings(StringBuffer o1, StringBuffer o2, StringBuffer o3, StringBuffer o4, StringBuffer oFF)
    {                    
        printRegion(o1, 0, 7);
        printRegion(o2, 8, 15);
        printRegion(o3, 16, 23);
        printRegion(o4, 24, 31);
        printFinalFour(oFF);        
    }    
    
    public void printFinalFour (StringBuffer oBuffer)
    {
        Match oFF1 = moChampionship.getPreMatch1();
        Match oFF2 = moChampionship.getPreMatch2();
        oBuffer.append(oFF1.printWinner());
        oBuffer.append(',');
        oBuffer.append(oFF2.printWinner());
        oBuffer.append(',');
        oBuffer.append(moChampionship.printWinner());      
        
        oBuffer.append('\n');
    }
    
    public void printRegion (StringBuffer oBuffer, int nLow, int nHigh)
    {
        // now set the data structures
        int mnRound = 1;
        Vector oCurrentRound = new Vector();
        for (int i=nLow; i <= nHigh; i++)
        {
            oCurrentRound.add(moBases[i]);
        }
        
        while (mnRound <=4)
        {
            // construct the vector to process the next set of matches
            Vector oNextRound = new Vector();
            for (int i=0; i < oCurrentRound.size(); i++)
            {
                Match oMatch = (Match) oCurrentRound.elementAt(i);
                oBuffer.append(oMatch.printWinner());
                
                if (mnRound != 4)
                {
                    oBuffer.append(',');
                }
                
                // add the next match to be processed in the next iteration
                if ( (i % 2) == 1)
                {
                    oNextRound.add(oMatch.getNext());
                }                    
            }
            
            oCurrentRound = oNextRound;
            mnRound++;
        }
        oBuffer.append('\n');
    }
    
    public void prettyPrint(OutputStream oOut) throws IOException
    {
        LinkedList oList = new LinkedList();
        oList.add(moChampionship);
        
        while (!oList.isEmpty())
        {
            Match oMatch = (Match)oList.removeFirst();
            if (oMatch.getPreMatch1() != null)
            {
                oList.add(oMatch.getPreMatch1());
            }
            if (oMatch.getPreMatch2() != null)
            {
                oList.add(oMatch.getPreMatch2());
            }
            String sWinner = "Not Set";
            Team oTeam = oMatch.getWinner();
            if (oTeam != null)
            {
                sWinner = oTeam.getName() + "(" + oTeam.getSeed() + ")";
            }
            String sLine =
                "Round " + Integer.toString(oMatch.getRound()) + ": " + sWinner;
            
            oOut.write(sLine.getBytes());
            oOut.write('\n');
        }
    }    
    
    private void importFromPicks(Vector oPicks[])
    {        
        // now set the data structures
        int mnRound = 1;
        Vector oCurrentRound = new Vector();
        for (int i=0; i < moBases.length; i++)
        {
            oCurrentRound.add(moBases[i]);
        }
        
        while (oCurrentRound.size() > 0)
        {
            // construct the vector to process the next set of matches
            Vector oNextRound = new Vector();
            for (int i=0; i < oCurrentRound.size(); i++)
            {
                Match oMatch = (Match) oCurrentRound.elementAt(i);
                
                // add the next match to be processed in the next iteration
                if ( (i % 2) == 1)
                {
                    oNextRound.add(oMatch.getNext());
                }
                
                String sPick = (String) oPicks[mnRound].elementAt(i);
                String sPre1 = (String) oPicks[mnRound-1].elementAt(i*2);
                String sPre2 = (String) oPicks[mnRound-1].elementAt(i*2+1);
                if (sPick.equals(""))
                {
                	// Empty selection
                }                
                else if (sPick.equals(sPre1))
                {
                    oMatch.setStatus(1);
                }
                else if (sPick.equals(sPre2))
                {
                    oMatch.setStatus(2);
                }
                else 
                {
                	throw new RuntimeException("Inconsistent selection");
                }
            }
            
            oCurrentRound = oNextRound;
            mnRound++;
        }
    }
    
    public String getEntryName()
    {
        return msEntryName;
    }
    
    public void setEntryName(String name)
    {
    	msEntryName = name;
    }
    
    public String getPrincipalName()
    {
        return msPrincipalName;
    }
    
    public void setPrincipalName(String name)
    {
    	msPrincipalName = name;
    }
    
    public String getUserNickname()
    {
        return msUserNickname;
    }
    
    public void setUserNickname(String name)
    {
    	msUserNickname = name;
    }

    public String getName() {
    	return msUserNickname + " - " + msEntryName;
    }
    
    public String getUserEmail()
    {
        return msUserEmail;
    }
    
    public String getRegion1() {
    	return msRegion1;
    }
    
    public String getRegion2() {
    	return msRegion2;
    }
    
    public String getRegion3() {
    	return msRegion3;
    }
    
    public String getRegion4() {
    	return msRegion4;
    }
    
    public String getFF() {
    	return msFF;
    }

    
    public void setUserEmail(String email)
    {
    	msUserEmail = email;
    }


	public void validate(boolean bComplete) {
		if (bComplete) {
			confirmStatusSet(moChampionship);
		}		
	}

	private void confirmStatusSet(Match oMatch) {
		if (oMatch != null) {
			if (oMatch.mnStatus == 0) {
				throw new RuntimeException("Match not set: " + oMatch.getRound());
			}
			confirmStatusSet(oMatch.getPreMatch1());
			confirmStatusSet(oMatch.getPreMatch2());
		}
	}

	public boolean isComplete() {
		try {
			validate(true);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}    
    
}
