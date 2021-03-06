/*
 * Created on Mar 16, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package net.indybracket.tourney.servlet;

import java.io.Serializable;

/*
 ********************************************************************************
 * Class: DisplayBracketBean
 ********************************************************************************
 *//**
 * @author Scott Mennealy
 *
 */
public class DisplayBracketBean implements Serializable {
  private static final long serialVersionUID = -7424345373301996667L;
  private String name = "";
  private String score = "";
  private String maxScore = "";
  private String winner = "";
  private String whoIsBetter = "";
  private int totalComments = 0;
  private String rank = "";
  private int numFinalFourTeams = 0;
  private boolean isChampionAlive = true;
  private boolean isValid = false;
  private boolean isCelebrity = false;

  /*
   * ***************************************************************************
   * Constructor()
   * ***************************************************************************
   *//**
   *
   */
  public DisplayBracketBean() {

  } // Constructor()

  /*
   * ***************************************************************************
   * getName()
   * ***************************************************************************
   *//**
   * @return Returns the name.
   */
  public String getName() {
    return name;

  } // getName()

  /*
   * ***************************************************************************
   * setName()
   * ***************************************************************************
   *//**
   * @param name
   *          The name to set.
   */
  public void setName(String name) {
    this.name = name;

  } // setName()

  /*
   * ***************************************************************************
   * getScore()
   * ***************************************************************************
   *//**
   * @return Returns the score.
   */
  public String getScore() {
    return score;

  } // getScore()

  /*
   * ***************************************************************************
   * setScore()
   * ***************************************************************************
   *//**
   * @param score
   *          The score to set.
   */
  public void setScore(String score) {
    this.score = score;

  } // setScore()

  /*
   * ***************************************************************************
   * getMaxScore()
   * ***************************************************************************
   *//**
   * @return Returns the score.
   */
  public String getMaxScore() {
    return maxScore;

  } // getMaxScore()

  /*
   * ***************************************************************************
   * setMaxScore()
   * ***************************************************************************
   *//**
   * @param score
   *          The score to set.
   */
  public void setMaxScore(String score) {
    this.maxScore = score;

  } // setMaxScore()

  /*
   * ***************************************************************************
   * getWinner()
   * ***************************************************************************
   *//**
   * @return Returns the winner.
   */
  public String getWinner() {
    return winner;

  } // getWinner()

  /*
   * ***************************************************************************
   * setWinner()
   * ***************************************************************************
   *//**
   * @param winner
   *          The winner to set.
   */
  public void setWinner(String winner) {
    this.winner = winner;

  } // setWinner()

  /*
   * ***************************************************************************
   * getWhoIsBetter()
   * ***************************************************************************
   *//**
   * @return Returns the winner.
   */
  public String getWhoIsBetter() {
    return whoIsBetter;

  } // getWhoIsBetter()

  /*
   * ***************************************************************************
   * setWhoIsBetter()
   * ***************************************************************************
   *//**
   * @param winner
   *          The winner to set.
   */
  public void setWhoIsBetter(String whoIsBetter) {
    this.whoIsBetter = whoIsBetter;

  } // setWhoIsBetter()

  /*
   * ***************************************************************************
   * isChampionAlive()
   * ***************************************************************************
   *//**
   *
   */
  public boolean isChampionAlive() {
    return isChampionAlive;

  } // isChampionAlive()

  /*
   * ***************************************************************************
   * setChampionAlive()
   * ***************************************************************************
   *//**
   *
   */
  public void setChampionAlive(boolean isChampionAlive) {
    this.isChampionAlive = isChampionAlive;

  } // setChampionAlive()

  /*
   * ***************************************************************************
   * isValid()
   * ***************************************************************************
   *//**
   *
   */
  public boolean isValid() {
    return isValid;

  } // isValid()

  /*
   * ***************************************************************************
   * setIsValid()
   * ***************************************************************************
   *//**
   *
   */
  public void setIsValid(boolean isValid) {
    this.isValid = isValid;

  } // setIsValid()

  /*
   * ***************************************************************************
   * getNumFinalFourTeams()
   * ***************************************************************************
   *//**
   *
   */
  public int getNumFinalFourTeams() {
    return numFinalFourTeams;

  } // getNumFinalFourTeams()

  /*
   * ***************************************************************************
   * setNumFinalFourTeams()
   * ***************************************************************************
   *//**
   *
   */
  public void setNumFinalFourTeams(int numFinalFourTeams) {
    this.numFinalFourTeams = numFinalFourTeams;

  } // setNumFinalFourTeams()

  /*
   * ***************************************************************************
   * getRank()
   * ***************************************************************************
   *//**
   *
   */
  public String getRank() {
    return rank;

  } // getRank()

  /*
   * ***************************************************************************
   * setRank()
   * ***************************************************************************
   *//**
   *
   */
  public void setRank(String rank) {
    this.rank = rank;

  } // setRank()

  public int getTotalComments() {
    return totalComments;
  }

  public void setTotalComments(int totalComments) {
    this.totalComments = totalComments;
  }

  /*
   * ***************************************************************************
   * isValid()
   * ***************************************************************************
   *//**
   *
   */
  public boolean isCelebrity() {
    return isCelebrity;

  } // isValid()

  /*
   * ***************************************************************************
   * setIsValid()
   * ***************************************************************************
   *//**
   *
   */
  public void setIsCelebrity(boolean val) {
    this.isCelebrity = val;

  } // setIsValid()

} // Class: DisplayBracketBean
