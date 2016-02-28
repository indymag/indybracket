package net.indybracket.tourney.common;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class BeatenEntry {
  @Id
  private String msLoser;
  private String msBeater;

  public BeatenEntry() {
  }

  public BeatenEntry(String sBracket, String sBeatenBy) {
    msLoser = sBracket;
    msBeater = sBeatenBy;
  }

  public String getLoser() {
    return msLoser;
  }

  public String getBeater() {
    return msBeater;
  }
}
