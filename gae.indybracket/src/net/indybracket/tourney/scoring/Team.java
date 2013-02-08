package net.indybracket.tourney.scoring;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author Indian Magic
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
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
    
    public void persistID(OutputStream oOut) throws IOException
    {
        StreamString.writeInt(oOut, mnID);
    }
    
    public static Team desistID(InputStream oIn) throws IOException
    {
        int ID = StreamString.readInt(oIn);
        return soTeams[ID];
    }
    
    public void persist(OutputStream oOut) throws IOException
    {
        StreamString.writeInt(oOut, mnSeed);
        StreamString.serialize(oOut, msName.getBytes());
        StreamString.serialize(oOut, msConference.getBytes());
        StreamString.writeInt(oOut, mnWins);
        StreamString.writeInt(oOut, mnLosses);                
    }
    
    public void desist(InputStream oIn) throws IOException
    {
        mnSeed = StreamString.readInt(oIn);
        msName = new String(StreamString.deserialize(oIn));
        msConference = new String(StreamString.deserialize(oIn));
        mnWins = StreamString.readInt(oIn);
        mnLosses = StreamString.readInt(oIn);        
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
