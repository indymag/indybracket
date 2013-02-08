package net.indybracket.tourney.scoring;

/**
 * @author Indian Magic
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class BlazerScorer extends Scorer
{
    
    public long scoreWin(Match oGame)
    {
        long roundXer = (long) Math.pow(2, oGame.getRound());
        return (oGame.getWinner().getSeed() + 4) * roundXer;
    }
    
    public String getDescription()
    {
        return "The well established (seed+4)*2^round system";   
    }

}
