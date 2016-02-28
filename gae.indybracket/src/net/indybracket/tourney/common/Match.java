package net.indybracket.tourney.common;

public class Match {
  private Match moPreMatch1 = null;
  private Match moPreMatch2 = null;
  private Match moNext = null;
  protected transient String msScoringData = "";
  protected transient int mnStatus = 0;

  protected Match() {
  }

  public String getScoringData() {
    return msScoringData;
  }

  public void setScoringData(String sVal) {
    msScoringData = sVal;
  }

  public Match(Match m1, Match m2) {
    moPreMatch1 = m1;
    moPreMatch2 = m2;
    moPreMatch1.setNext(this);
    moPreMatch2.setNext(this);
  }

  private void setNext(Match next) {
    moNext = next;
  }

  /**
   * @return
   */
  public Team getWinner() {
    if (mnStatus == 1) {
      return moPreMatch1.getWinner();
    } else if (mnStatus == 2) {
      return moPreMatch2.getWinner();
    }

    return null;
  }

  /**
   * @return
   */
  public String printWinner() {
    Team oTeam = getWinner();
    if (oTeam == null) {
      return " ";
    }

    return oTeam.getName() + msScoringData;
  }

  public int getRound() {
    return moPreMatch1.getRound() + 1;
  }

  public void setStatus(int status) {
    mnStatus = status;
  }

  public void copysheet(Match oOrig) {
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
  public Match getNext() {
    return moNext;
  }

  /**
   * @return
   */
  public Match getPreMatch1() {
    return moPreMatch1;
  }

  /**
   * @return
   */
  public Match getPreMatch2() {
    return moPreMatch2;
  }

}
