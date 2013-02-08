package scoring;

/**
 * @author Indian Magic
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class FirstMatch extends Match
{
    protected Team moTeam1;
    protected Team moTeam2;
    
    public FirstMatch (Team t1, Team t2) 
    {
        super();
        moTeam1 = t1;
        moTeam2 = t2;
    }
    
    public Team getWinner()
    {
        if (mnStatus == 1) {
            return moTeam1;
        }
        else if (mnStatus == 2) {
            return moTeam2;
        }
        
        return null;        
    }
    
    public int getRound()
    {
        return 1;
    }
    
}
