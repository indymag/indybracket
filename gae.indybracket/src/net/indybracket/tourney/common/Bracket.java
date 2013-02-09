package net.indybracket.tourney.common;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.LinkedList;
import java.util.Vector;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Bracket
{
    public static final int snNumRound = 6;
    
    @Id private String msId;
    private Match moChampionship;
    private Match moBases[];
    private String msName;
    private String msPassword;
    
    public static Bracket newInstance()
    {
        Bracket bracket = new Bracket();
        return bracket;
    }
    
    public static Bracket newDbInstance(String id)
    {
        Bracket bracket = new Bracket();
        bracket.msId = id;
        return bracket;
    }
    
    public static Bracket createCopy(Bracket oOrig)
    {
        Bracket oBracket = new Bracket();
        oBracket.getChampionship().copysheet(oOrig.getChampionship());
        return oBracket;
    }
    
    public String getPassword()
    {
        return msPassword;
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
    
    public void importFromWebapp(String sPassword, int iTotalComments, String s1, String s2, 
    		String s3, String s4, String sFF, boolean bIsMaster, boolean bStrict)    		
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
        String[] oParts = sFF.substring(0, sFF.length()).split(",");
        oPicks[5].add(oParts[0].trim());
        oPicks[5].add(oParts[1].trim());
        oPicks[6].add(oParts[2].trim());
        
        importFromPicks(oPicks, bStrict);
        msPassword = sPassword;
    }
    
    public void readRegion(Vector oPicks[], String sData)
    {
        // remove the newline
        String[] oParts = sData.substring(0, sData.length()).split(",");
        for (int i=0; i < oParts.length; i++)
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
            
            oPicks[nRound].add(oParts[i].trim());
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
    
    public void importCSV(InputStream oIn, boolean bStrict)
    {
        String sName = "";
        BufferedReader oReader = new BufferedReader(new InputStreamReader(oIn));
        Vector oPicks[] = new Vector[7];
        for (int i=0; i < oPicks.length; i++)
        {
            oPicks[i] = new Vector();
        }
        
        try
        {
            sName = oReader.readLine();
            // get to the first line
            while (oReader.ready())
            {
                String sLine = oReader.readLine();
                if (sLine.startsWith("Region"))
                {
                    break;
                }
            }
            
            // read in the picks
            int nLine = 1;
            while (nLine <= 64)
            {
                String sLine = oReader.readLine();
                String[] oParts = sLine.split(",");
                for (int i=2; i < oParts.length; i++)
                {
                    oPicks[i-2].add(oParts[i]);
                }
                nLine++;                
            }                       
            
            importFromPicks(oPicks, bStrict);
        }
        catch (Exception e)
        {
            System.out.println("Invalid import" + e);
            e.printStackTrace();
        }
    }
    
    
    public void importFromPicks(Vector oPicks[], boolean bStrict)
    {
        // make sure we have the right number of picks
        if  ( 
                (oPicks[0].size() != 64) ||
                (oPicks[1].size() != 32) ||
                (oPicks[2].size() != 16) ||
                (oPicks[3].size() != 8) ||
                (oPicks[4].size() != 4) ||
                (oPicks[5].size() != 2) ||
                (oPicks[6].size() != 1))
        {
            System.out.println("Improper Size");
            throw new RuntimeException("Bad size");
        }
        
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
                    if (bStrict)
                    {
                        throw new RuntimeException("Empty selection");
                    }
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
                    if (bStrict)
                    {
                        throw new RuntimeException("Inconsistent selection");
                    }
                }
            }
            
            oCurrentRound = oNextRound;
            mnRound++;
        }
    }
    
    public String getName()
    {
        return msName;
    }
    
    public void setName(String name)
    {
        msName = name;
    }    
    
}
