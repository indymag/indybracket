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
public class Match
{
    private Match moPreMatch1 = null;
    private Match moPreMatch2 = null;
    private Match moNext = null;
        
    protected String msData = "";
    protected int mnStatus = 0;
       
    protected Match()
    {
    }   
    
    public void setData(String sVal)
    {
    	msData = sVal;
    }
        
    public Match(Match m1, Match m2)
    {
        moPreMatch1 = m1;
        moPreMatch2 = m2;
        moPreMatch1.setNext(this);
        moPreMatch2.setNext(this);
    }
    
    private void setNext(Match next)
    {
        moNext = next;
    }

    /**
     * @return
     */
    public Team getWinner()
    {
        if (mnStatus == 1) {
            return moPreMatch1.getWinner();
        }
        else if (mnStatus == 2) {
            return moPreMatch2.getWinner();
        }
        
        return null;        
    }
    
    /**
     * @return
     */
    public String printWinner()
    {
    	Team oTeam = getWinner();
        if (oTeam == null) 
        {
        	return " ";
        }                
    	
        return oTeam.getName() + msData;        
    }
    
    public int getRound()
    {
        return moPreMatch1.getRound() + 1;
    }
    
    public void setStatus(int status)
    {
        mnStatus = status;
    }
    
    public void persist(OutputStream oOut)throws IOException
    {
        StreamString.writeInt(oOut, mnStatus);
        if (moPreMatch1 != null) {
            moPreMatch1.persist(oOut);
        }
        if (moPreMatch2 != null) {
            moPreMatch2.persist(oOut);
        }
    }
    
    public void desist(InputStream oIn)throws IOException
    {
        mnStatus = StreamString.readInt(oIn);
        if (moPreMatch1 != null) {
            moPreMatch1.desist(oIn);
        }
        if (moPreMatch2 != null) {
            moPreMatch2.desist(oIn);
        }
        
    }
    
    public void copysheet (Match oOrig)
    {
        mnStatus = oOrig.mnStatus;
        if (moPreMatch1 != null) {
            moPreMatch1.copysheet(oOrig.moPreMatch1);
        }
        if (moPreMatch2 != null) {
            moPreMatch2.copysheet(oOrig.moPreMatch2);
        }              
    }

    /**
     * @return
     */
    public Match getNext()
    {
        return moNext;
    }

    /**
     * @return
     */
    public Match getPreMatch1()
    {
        return moPreMatch1;
    }

    /**
     * @return
     */
    public Match getPreMatch2()
    {
        return moPreMatch2;
    }

}
