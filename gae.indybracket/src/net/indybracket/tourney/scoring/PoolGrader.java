package net.indybracket.tourney.scoring;

import java.util.Arrays;

import net.indybracket.tourney.common.BeatenTable;
import net.indybracket.tourney.common.Bracket;

public class PoolGrader {
  Bracket moMaster;
  Scorer moScorer;

  public PoolGrader(Scorer oScorer, Bracket oMaster) {
    moScorer = oScorer;
    moMaster = oMaster;
  }

  public PoolStandings gradePool(Bracket[] oEntries, BeatenTable oBeatenBy, String sSortBy,
      String sAsc, boolean bCheckNewBeatenBy) {
    Grader oGrader = new Grader(moScorer, moMaster);
    BracketResult[] oResults = new BracketResult[oEntries.length];
    for (int i = 0; i < oEntries.length; i++) {
      try {
        oResults[i] = oGrader.grade(oEntries[i]);
      } catch (Exception oEx) {
        throw new RuntimeException("Failure to grade " + oEntries[i].getName(), oEx);
      }
    }

    if (bCheckNewBeatenBy) {
      fillInBetterBrackets(oResults, oBeatenBy);
    }
    Arrays.sort(oResults, BracketResult.comparator(sSortBy, Boolean.parseBoolean(sAsc), oBeatenBy));

    return new PoolStandings(oResults);
  }

  private void fillInBetterBrackets(BracketResult[] oResults, BeatenTable oBeatenBy) {
    Arrays.sort(oResults, BracketResult.comparator("score", false, oBeatenBy));
    for (int i = 0; i < oResults.length; i++) {
      BracketResult oResult = oResults[i];

      // Don't calculate beaten by for celebrity entries.
      if (oResult.getBracket().isCelebrity()) {
        continue;
      }

      // Skip this bracket because we already have a beaten by entry.
      if (oBeatenBy.get(oResult.getBracket().getName()).length() > 0) {
        continue;
      }

      Bracket oBestBracket = Grader.getBest(moMaster, oResult.getBracket());
      Grader oGrader = new Grader(moScorer, oBestBracket);
      for (int j = 0; j < oResults.length; j++) {
        // this one is useless if he can't beat our current score
        if (oResults[j].getMax() < oResult.getScore()) {
          continue;
        }

        // A celebrity bracket cannot beat a real bracket.
        if (oResults[j].getBracket().isCelebrity()) {
          continue;
        }
        // if our best can't beat this guy, we are cooked
        if (oGrader.grade(oResults[j].getBracket()).getScore() > oResult.getMax()) {
          // oBracket.setBetterBracket(oResults[j].getBracket());
          oBeatenBy.addBeaten(oResult.getBracket().getName(), oResults[j].getBracket().getName());
          break;
        }
      }
    }

  }

}
