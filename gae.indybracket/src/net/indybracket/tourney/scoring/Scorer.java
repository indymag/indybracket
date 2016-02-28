package net.indybracket.tourney.scoring;

import net.indybracket.tourney.common.Match;

public abstract class Scorer {
  public abstract long scoreWin(Match oGame);

  public abstract String getDescription();
}
