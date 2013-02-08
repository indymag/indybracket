package net.indybracket.tourney.scoring;
/**
 * @author Indian Magic
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class BlazerScorer2 extends Scorer
{  
    public long scoreWin(Match oGame)
    {
        long roundXer = -2000;
        if (oGame.getRound() == 1)
        {
            roundXer = 2;
        }
        else if (oGame.getRound() == 2)
        {
            roundXer = 4;
        }
        else if (oGame.getRound() == 3)
        {
            roundXer = 8;
        }
        else if (oGame.getRound() == 4)
        {
            roundXer = 16;
        }
        else if (oGame.getRound() == 5)
        {
            roundXer = 28;
        }
        else if (oGame.getRound() == 6)
        {
            roundXer = 50;
        }

        return (oGame.getWinner().getSeed() + 4) * roundXer;
    }
    
    public String getDescription()
    {
        /* 
        Round 1: 2
        Round 2: 4
        Round 3: 8
        Round 4: 16
        Round 5: 28
        Round 6: 50
        */
        
        return "The (seed+4) * (round multiplier) system";   
    }

}
