package net.indybracket.tourney.common;


public class FirstMatch extends Match
{
    public Team moTeam1;
    public Team moTeam2;
    
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
