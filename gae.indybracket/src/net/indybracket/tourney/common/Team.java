package net.indybracket.tourney.common;

import com.googlecode.objectify.annotation.Entity;

@Entity
public class Team
{
    public static final int snNumTeams = 64;    
    private static Team[] soTeams = new Team[snNumTeams];

    private String msName = "";
    private String msConference = "";
    private int mnWins;
    private int mnLosses;
    private int mnSeed;
    private int mnID;


    public static Team[] getTeams()
    {
        return soTeams;
    }
    
    /**
     * @return
     */
    public int getLosses()
    {
        return mnLosses;
    }

    /**
     * @return
     */
    public int getSeed()
    {
        return mnSeed;
    }

    /**
     * @return
     */
    public int getWins()
    {
        return mnWins;
    }
    
    public int getID()
    {
        return mnID;
    }

    /**
     * @return
     */
    public String getConference()
    {
        return msConference;
    }

    /**
     * @return
     */
    public String getName()
    {
        return msName;
    }

    /**
     * @param i
     */
    public void setLosses(int i)
    {
        mnLosses = i;
    }

    /**
     * @param i
     */
    public void setSeed(int i)
    {
        mnSeed = i;
    }
    
    public void setID(int i)
    {
        mnID = i;
    }

    /**
     * @param i
     */
    public void setWins(int i)
    {
        mnWins = i;
    }

    /**
     * @param string
     */
    public void setConference(String string)
    {
        msConference = string;
    }

    /**
     * @param string
     */
    public void setName(String string)
    {
        msName = string;
    }

}
