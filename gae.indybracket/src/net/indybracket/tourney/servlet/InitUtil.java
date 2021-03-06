package net.indybracket.tourney.servlet;

import net.indybracket.tourney.common.Team;

import org.apache.struts.util.MessageResources;

public class InitUtil {

  private static boolean initialized = false;

  public static synchronized void setupTeams(MessageResources oResources) {
    if (!initialized) {
      Team[] oTeams = Team.getTeams();
      for (int i = 0; i < oTeams.length; i++) {
        oTeams[i] = new Team();
        oTeams[i].setID(i);
      }

      oTeams[0].setSeed(1);
      oTeams[0].setName(oResources.getMessage("eastSeed1Value"));
      oTeams[1].setSeed(16);
      oTeams[1].setName(oResources.getMessage("eastSeed16Value"));
      oTeams[2].setSeed(8);
      oTeams[2].setName(oResources.getMessage("eastSeed8Value"));
      oTeams[3].setSeed(9);
      oTeams[3].setName(oResources.getMessage("eastSeed9Value"));
      oTeams[4].setSeed(5);
      oTeams[4].setName(oResources.getMessage("eastSeed5Value"));
      oTeams[5].setSeed(12);
      oTeams[5].setName(oResources.getMessage("eastSeed12Value"));
      oTeams[6].setSeed(4);
      oTeams[6].setName(oResources.getMessage("eastSeed4Value"));
      oTeams[7].setSeed(13);
      oTeams[7].setName(oResources.getMessage("eastSeed13Value"));
      oTeams[8].setSeed(6);
      oTeams[8].setName(oResources.getMessage("eastSeed6Value"));
      oTeams[9].setSeed(11);
      oTeams[9].setName(oResources.getMessage("eastSeed11Value"));
      oTeams[10].setSeed(3);
      oTeams[10].setName(oResources.getMessage("eastSeed3Value"));
      oTeams[11].setSeed(14);
      oTeams[11].setName(oResources.getMessage("eastSeed14Value"));
      oTeams[12].setSeed(7);
      oTeams[12].setName(oResources.getMessage("eastSeed7Value"));
      oTeams[13].setSeed(10);
      oTeams[13].setName(oResources.getMessage("eastSeed10Value"));
      oTeams[14].setSeed(2);
      oTeams[14].setName(oResources.getMessage("eastSeed2Value"));
      oTeams[15].setSeed(15);
      oTeams[15].setName(oResources.getMessage("eastSeed15Value"));

      oTeams[16].setSeed(1);
      oTeams[16].setName(oResources.getMessage("southSeed1Value"));
      oTeams[17].setSeed(16);
      oTeams[17].setName(oResources.getMessage("southSeed16Value"));
      oTeams[18].setSeed(8);
      oTeams[18].setName(oResources.getMessage("southSeed8Value"));
      oTeams[19].setSeed(9);
      oTeams[19].setName(oResources.getMessage("southSeed9Value"));
      oTeams[20].setSeed(5);
      oTeams[20].setName(oResources.getMessage("southSeed5Value"));
      oTeams[21].setSeed(12);
      oTeams[21].setName(oResources.getMessage("southSeed12Value"));
      oTeams[22].setSeed(4);
      oTeams[22].setName(oResources.getMessage("southSeed4Value"));
      oTeams[23].setSeed(13);
      oTeams[23].setName(oResources.getMessage("southSeed13Value"));
      oTeams[24].setSeed(6);
      oTeams[24].setName(oResources.getMessage("southSeed6Value"));
      oTeams[25].setSeed(11);
      oTeams[25].setName(oResources.getMessage("southSeed11Value"));
      oTeams[26].setSeed(3);
      oTeams[26].setName(oResources.getMessage("southSeed3Value"));
      oTeams[27].setSeed(14);
      oTeams[27].setName(oResources.getMessage("southSeed14Value"));
      oTeams[28].setSeed(7);
      oTeams[28].setName(oResources.getMessage("southSeed7Value"));
      oTeams[29].setSeed(10);
      oTeams[29].setName(oResources.getMessage("southSeed10Value"));
      oTeams[30].setSeed(2);
      oTeams[30].setName(oResources.getMessage("southSeed2Value"));
      oTeams[31].setSeed(15);
      oTeams[31].setName(oResources.getMessage("southSeed15Value"));

      oTeams[32].setSeed(1);
      oTeams[32].setName(oResources.getMessage("midwestSeed1Value"));
      oTeams[33].setSeed(16);
      oTeams[33].setName(oResources.getMessage("midwestSeed16Value"));
      oTeams[34].setSeed(8);
      oTeams[34].setName(oResources.getMessage("midwestSeed8Value"));
      oTeams[35].setSeed(9);
      oTeams[35].setName(oResources.getMessage("midwestSeed9Value"));
      oTeams[36].setSeed(5);
      oTeams[36].setName(oResources.getMessage("midwestSeed5Value"));
      oTeams[37].setSeed(12);
      oTeams[37].setName(oResources.getMessage("midwestSeed12Value"));
      oTeams[38].setSeed(4);
      oTeams[38].setName(oResources.getMessage("midwestSeed4Value"));
      oTeams[39].setSeed(13);
      oTeams[39].setName(oResources.getMessage("midwestSeed13Value"));
      oTeams[40].setSeed(6);
      oTeams[40].setName(oResources.getMessage("midwestSeed6Value"));
      oTeams[41].setSeed(11);
      oTeams[41].setName(oResources.getMessage("midwestSeed11Value"));
      oTeams[42].setSeed(3);
      oTeams[42].setName(oResources.getMessage("midwestSeed3Value"));
      oTeams[43].setSeed(14);
      oTeams[43].setName(oResources.getMessage("midwestSeed14Value"));
      oTeams[44].setSeed(7);
      oTeams[44].setName(oResources.getMessage("midwestSeed7Value"));
      oTeams[45].setSeed(10);
      oTeams[45].setName(oResources.getMessage("midwestSeed10Value"));
      oTeams[46].setSeed(2);
      oTeams[46].setName(oResources.getMessage("midwestSeed2Value"));
      oTeams[47].setSeed(15);
      oTeams[47].setName(oResources.getMessage("midwestSeed15Value"));

      oTeams[48].setSeed(1);
      oTeams[48].setName(oResources.getMessage("westSeed1Value"));
      oTeams[49].setSeed(16);
      oTeams[49].setName(oResources.getMessage("westSeed16Value"));
      oTeams[50].setSeed(8);
      oTeams[50].setName(oResources.getMessage("westSeed8Value"));
      oTeams[51].setSeed(9);
      oTeams[51].setName(oResources.getMessage("westSeed9Value"));
      oTeams[52].setSeed(5);
      oTeams[52].setName(oResources.getMessage("westSeed5Value"));
      oTeams[53].setSeed(12);
      oTeams[53].setName(oResources.getMessage("westSeed12Value"));
      oTeams[54].setSeed(4);
      oTeams[54].setName(oResources.getMessage("westSeed4Value"));
      oTeams[55].setSeed(13);
      oTeams[55].setName(oResources.getMessage("westSeed13Value"));
      oTeams[56].setSeed(6);
      oTeams[56].setName(oResources.getMessage("westSeed6Value"));
      oTeams[57].setSeed(11);
      oTeams[57].setName(oResources.getMessage("westSeed11Value"));
      oTeams[58].setSeed(3);
      oTeams[58].setName(oResources.getMessage("westSeed3Value"));
      oTeams[59].setSeed(14);
      oTeams[59].setName(oResources.getMessage("westSeed14Value"));
      oTeams[60].setSeed(7);
      oTeams[60].setName(oResources.getMessage("westSeed7Value"));
      oTeams[61].setSeed(10);
      oTeams[61].setName(oResources.getMessage("westSeed10Value"));
      oTeams[62].setSeed(2);
      oTeams[62].setName(oResources.getMessage("westSeed2Value"));
      oTeams[63].setSeed(15);
      oTeams[63].setName(oResources.getMessage("westSeed15Value"));

      initialized = true;
    }
  }
}
