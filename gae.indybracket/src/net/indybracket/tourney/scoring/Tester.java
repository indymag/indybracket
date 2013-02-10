package net.indybracket.tourney.scoring;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import net.indybracket.tourney.common.Bracket;
import net.indybracket.tourney.common.Team;

public class Tester
{

    public static void main(String[] args)
    {

        Team oTeams[] = Team.getTeams();
        for (int i = 0; i < oTeams.length; i++)
        {
            oTeams[i] = new Team();
            oTeams[i].setID(i);
        }
        
        oTeams[0].setSeed(1);
        oTeams[0].setName("Kentucky");
        oTeams[1].setSeed(16);
        oTeams[1].setName("Lehigh/Florida A&M");
        oTeams[2].setSeed(8);
        oTeams[2].setName("Washington");
        oTeams[3].setSeed(9);
        oTeams[3].setName("UAB");
        oTeams[4].setSeed(4);
        oTeams[4].setName("Kansas");
        oTeams[5].setSeed(13);
        oTeams[5].setName("UIC");
        oTeams[6].setSeed(5);
        oTeams[6].setName("Providence");
        oTeams[7].setSeed(12);
        oTeams[7].setName("Pacific");
        oTeams[8].setSeed(2);
        oTeams[8].setName("Gonzaga");
        oTeams[9].setSeed(15);
        oTeams[9].setName("Valparaiso");
        oTeams[10].setSeed(7);
        oTeams[10].setName("Michigan St.");
        oTeams[11].setSeed(10);
        oTeams[11].setName("Nevada");
        oTeams[12].setSeed(3);
        oTeams[12].setName("G. Tech");
        oTeams[13].setSeed(14);
        oTeams[13].setName("Northern Iowa");
        oTeams[14].setSeed(6);
        oTeams[14].setName("Boston College");
        oTeams[15].setSeed(11);
        oTeams[15].setName("Utah");
        
        oTeams[16].setSeed(1);
        oTeams[16].setName("St. Joes");
        oTeams[17].setSeed(16);
        oTeams[17].setName("Liberty");
        oTeams[18].setSeed(8);
        oTeams[18].setName("Texas Tech");
        oTeams[19].setSeed(9);
        oTeams[19].setName("Charlotte");
        oTeams[20].setSeed(4);
        oTeams[20].setName("Wake");
        oTeams[21].setSeed(13);
        oTeams[21].setName("VCU");
        oTeams[22].setSeed(5);
        oTeams[22].setName("Florida");
        oTeams[23].setSeed(12);
        oTeams[23].setName("Manhattan");
        oTeams[24].setSeed(2);
        oTeams[24].setName("Ok St.");
        oTeams[25].setSeed(15);
        oTeams[25].setName("E. Wash");
        oTeams[26].setSeed(7);
        oTeams[26].setName("Memphis");
        oTeams[27].setSeed(10);
        oTeams[27].setName("South Carolina");
        oTeams[28].setSeed(3);
        oTeams[28].setName("Pitt");
        oTeams[29].setSeed(14);
        oTeams[29].setName("C. Florida");
        oTeams[30].setSeed(6);
        oTeams[30].setName("Wisconsin");
        oTeams[31].setSeed(11);
        oTeams[31].setName("Richmond");    
        
        oTeams[32].setSeed(1);
        oTeams[32].setName("Duke");
        oTeams[33].setSeed(16);
        oTeams[33].setName("Alabama St.");
        oTeams[34].setSeed(8);
        oTeams[34].setName("Seton Hall");
        oTeams[35].setSeed(9);
        oTeams[35].setName("Arizona");
        oTeams[36].setSeed(4);
        oTeams[36].setName("Cincy");
        oTeams[37].setSeed(13);
        oTeams[37].setName("E. Tenn. St.");
        oTeams[38].setSeed(5);
        oTeams[38].setName("Illinois");
        oTeams[39].setSeed(12);
        oTeams[39].setName("Murray St.");
        oTeams[40].setSeed(2);
        oTeams[40].setName("Mississippi St.");
        oTeams[41].setSeed(15);
        oTeams[41].setName("Monmouth");
        oTeams[42].setSeed(7);
        oTeams[42].setName("Xavier");
        oTeams[43].setSeed(10);
        oTeams[43].setName("Louisville");
        oTeams[44].setSeed(3);
        oTeams[44].setName("Texas");
        oTeams[45].setSeed(14);
        oTeams[45].setName("Princeton");
        oTeams[46].setSeed(6);
        oTeams[46].setName("UNC");
        oTeams[47].setSeed(11);
        oTeams[47].setName("Air Force");  
        
        oTeams[48].setSeed(1);
        oTeams[48].setName("Stanford");
        oTeams[49].setSeed(16);
        oTeams[49].setName("UTSA");
        oTeams[50].setSeed(8);
        oTeams[50].setName("Alabama");
        oTeams[51].setSeed(9);
        oTeams[51].setName("SIU");
        oTeams[52].setSeed(4);
        oTeams[52].setName("Maryland");
        oTeams[53].setSeed(13);
        oTeams[53].setName("UTEP");
        oTeams[54].setSeed(5);
        oTeams[54].setName("Syracuse");
        oTeams[55].setSeed(12);
        oTeams[55].setName("BYU");
        oTeams[56].setSeed(2);
        oTeams[56].setName("UConn");
        oTeams[57].setSeed(15);
        oTeams[57].setName("Vermont");
        oTeams[58].setSeed(7);
        oTeams[58].setName("DePaul");
        oTeams[59].setSeed(10);
        oTeams[59].setName("Dayton");
        oTeams[60].setSeed(3);
        oTeams[60].setName("NC St.");
        oTeams[61].setSeed(14);
        oTeams[61].setName("La. Lafayette");
        oTeams[62].setSeed(6);
        oTeams[62].setName("Vanderbilt");
        oTeams[63].setSeed(11);
        oTeams[63].setName("W. Michigan");   
                
        try
        {
            // build the master sheet
            Bracket oMaster = Bracket.newTransientInstance();
            FileInputStream oMasterCSV = new FileInputStream("c:/ncaa/2005/master.csv");
//            oMaster.importCSV(oMasterCSV, true);
            
            // grade it
            Grader oGrader = new Grader(new BlazerScorer(), oMaster);
            long score = oGrader.grade(oMaster).getScore();
            System.out.println("Perfect Score = " + score);     

            StringBuffer o1 = new StringBuffer();
            StringBuffer o2 = new StringBuffer();
            StringBuffer o3 = new StringBuffer();
            StringBuffer o4 = new StringBuffer();
            StringBuffer oFF = new StringBuffer();
            oMaster.toWebAppStrings(o1, o2, o3, o4, oFF);
            System.out.print(o1.toString());
            System.out.print(o2.toString());
            System.out.print(o3.toString());
            System.out.print(o4.toString());
            System.out.print(oFF.toString());
            
            Bracket oMasterDup = Bracket.newTransientInstance();
            oMasterDup.importFromWebapp("", 0, o1.toString(), o2.toString(), o3.toString(), o4.toString(), oFF.toString(), false);
            
            // manipulate the master, clear out final four
            oMasterDup.getChampionship().setStatus(0);
            oMasterDup.getChampionship().getPreMatch1().setStatus(0);
            oMasterDup.getChampionship().getPreMatch1().getPreMatch1().setStatus(0);
            oMasterDup.getChampionship().getPreMatch1().getPreMatch2().setStatus(0);
            oMasterDup.getChampionship().getPreMatch2().setStatus(0);
            oMasterDup.getChampionship().getPreMatch2().getPreMatch1().setStatus(0);
            oMasterDup.getChampionship().getPreMatch2().getPreMatch2().setStatus(0);            
            
            // grade it
            oGrader = new Grader(new BlazerScorer(), oMasterDup);
            BracketResult oResult = oGrader.grade(oMaster);
            System.out.println("NO FF Perfect Score = " + score);  
            
            o1 = new StringBuffer();
            o2 = new StringBuffer();
            o3 = new StringBuffer();
            o4 = new StringBuffer();
            oFF = new StringBuffer();
            oResult.toWebAppStrings(o1, o2, o3, o4, oFF);
            System.out.print(o1.toString());
            System.out.print(o2.toString());
            System.out.print(o3.toString());
            System.out.print(o4.toString());
            System.out.print(oFF.toString());                        
            
            // read the entries
            File oDir = new File("c:/ncaa/2005/ui");
            PoolGrader oPoolGrader = new PoolGrader(new BlazerScorer(), oMasterDup);
            PoolStandings oStandings = oPoolGrader.gradePool(oDir);
            oStandings.printStandings();
            
        }
        catch (IOException oEx)
        {
            System.out.println(oEx);
        }
        
        System.out.println("Finished");

    }
}
