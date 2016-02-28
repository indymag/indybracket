package net.indybracket.tourney.scoring;

import java.util.Comparator;

import net.indybracket.tourney.common.BeatenTable;
import net.indybracket.tourney.common.Bracket;
import net.indybracket.tourney.common.Match;

public class BracketResult extends Bracket {
  private long mnScore = 0;
  private long mnMax = 0;
  private Bracket moBracket;
  private Bracket moBetterBracket;

  public long getScore() {
    return mnScore;
  }

  public void setScore(long score) {
    mnScore = score;
  }

  public long getMax() {
    return mnMax;
  }

  public void setMax(long val) {
    mnMax = val;
  }

  public boolean isChampionAlive() {
    Match oChampionship = this.getChampionship();
    return oChampionship.getScoringData().indexOf('#') == -1;
  }

  public String getChampion() {
    Match oChampionship = this.getChampionship();
    return oChampionship.getWinner().getName();
  }

  public int getNumFinalFourAlive() {
    Match oChampionship = this.getChampionship();
    Match oFF1 = oChampionship.getPreMatch1().getPreMatch1();
    Match oFF2 = oChampionship.getPreMatch1().getPreMatch2();
    Match oFF3 = oChampionship.getPreMatch2().getPreMatch1();
    Match oFF4 = oChampionship.getPreMatch2().getPreMatch2();
    int num = 0;

    if (oFF1.getScoringData().indexOf('#') == -1) {
      num++;
    }
    if (oFF2.getScoringData().indexOf('#') == -1) {
      num++;
    }
    if (oFF3.getScoringData().indexOf('#') == -1) {
      num++;
    }
    if (oFF4.getScoringData().indexOf('#') == -1) {
      num++;
    }

    return num;
  }

  public Bracket getBracket() {
    return moBracket;
  }

  public void setBracket(Bracket val) {
    moBracket = val;
  }

  public Bracket getBetterBracket() {
    return moBetterBracket;
  }

  public void setBetterBracket(Bracket val) {
    moBetterBracket = val;
  }

  public static Comparator<BracketResult> comparator(String sSortBy,
      boolean bAsc, BeatenTable oBeatenBy) {
    return new BracketResult().new BracketResultComparator(sSortBy, bAsc,
        oBeatenBy);
  }

  public class BracketResultComparator implements Comparator<BracketResult> {
    private String msSortBy = "score";
    private boolean mbAscending = false;
    private BeatenTable moBeatenBy = null;

    public BracketResultComparator(String sSortBy, boolean bAsc,
        BeatenTable oBeatenBy) {
      msSortBy = sSortBy;
      mbAscending = bAsc;
      moBeatenBy = oBeatenBy;
    }

    public int compare(BracketResult oOne, BracketResult oTwo) {
      int returnVal = 0;
      boolean doDefault = false;
      if (msSortBy.equals("ff")) {
        if (oOne.getNumFinalFourAlive() > oTwo.getNumFinalFourAlive()) {
          returnVal = -1;
        } else if (oOne.getNumFinalFourAlive() < oTwo.getNumFinalFourAlive()) {
          returnVal = 1;
        } else {
          doDefault = true;
        }
      } else if (msSortBy.equals("winner")) {
        boolean bIsOneAlive = oOne.isChampionAlive();
        boolean bIsTwoAlive = oTwo.isChampionAlive();
        if (bIsOneAlive && !bIsTwoAlive) {
          returnVal = -1;
        } else if (!bIsOneAlive && bIsTwoAlive) {
          returnVal = 1;
        } else {
          returnVal = oOne.getChampion().compareTo(oTwo.getChampion());
        }
      } else if (msSortBy.equals("better")) {
        String better1 = moBeatenBy.get(oOne.getBracket().getName());
        String better2 = moBeatenBy.get(oTwo.getBracket().getName());
        if ((better1 != null) && (better2 == null)) {
          returnVal = -1;
        } else if ((better1 == null) && (better2 != null)) {
          returnVal = 1;
        } else if ((better1 == null) && (better2 == null)) {
          doDefault = true;
        } else {
          returnVal = better1.compareTo(better2);
        }
      } else if (msSortBy.equals("max")) {
        if (oOne.getMax() > oTwo.getMax()) {
          returnVal = -1;
        }

        else if (oOne.getMax() < oTwo.getMax()) {
          returnVal = 1;
        } else {
          doDefault = true;
        }
      } else {
        doDefault = true;
      }

      if (doDefault) {
        if (oOne.getScore() > oTwo.getScore()) {
          returnVal = -1;
        } else if (oOne.getScore() < oTwo.getScore()) {
          returnVal = 1;
        }
      }

      if (mbAscending) {
        returnVal = -(returnVal);
      }

      return returnVal;
    }
  }
}
