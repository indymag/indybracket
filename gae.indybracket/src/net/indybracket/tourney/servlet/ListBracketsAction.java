package net.indybracket.tourney.servlet;

import static net.indybracket.tourney.common.OfyService.ofy;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.common.base.Predicate;
import com.google.common.collect.FluentIterable;

import net.indybracket.tourney.common.BeatenTable;
import net.indybracket.tourney.common.Bracket;
import net.indybracket.tourney.scoring.BlazerScorer2;
import net.indybracket.tourney.scoring.BracketResult;
import net.indybracket.tourney.scoring.PoolGrader;
import net.indybracket.tourney.scoring.PoolStandings;

/**
 * @author Scott Mennealy
 */

/*
 ********************************************************************************
 * Class: ListBracketsAction
 ********************************************************************************
 *//**
   *
   */
public class ListBracketsAction extends BaseAction {
  /*
   * ***************************************************************************
   * doExecute()
   * ***************************************************************************
   *//**
    *
    */
  public ActionForward doExecute(ActionMapping oMapping, ActionForm oActionForm,
      HttpServletRequest oRequest, HttpServletResponse oResponse) {

    String oReturnCode = FORWARD_RETURN_SUCCESS;
    String sSortBy = oRequest.getParameter("sortBy");
    String sAsc = oRequest.getParameter("asc");
    String sEvalAll = oRequest.getParameter("evalAll");
    try {
      assertActionAllowed(ACTION_AUTHZ.VIEW_OTHER);
      Bracket oMaster = readMaster();
      if (oMaster == null) {
        throw new RuntimeException("Unable to read master");
      }

      PoolGrader oGrader = new PoolGrader(new BlazerScorer2(), oMaster);

      List<Bracket> oBrackets = getEntries();
      String[] oBracketNames = new String[oBrackets.size()];

      int i = 0;
      for (Bracket oBracket : oBrackets) {
        oBracketNames[i++] = oBracket.getName();
      }

      oSession.setAttribute("bracketnames", oBracketNames);

      // Set default sort
      sSortBy = ((sSortBy == null) || (sSortBy.equals(""))) ? "score" : sSortBy;
      sAsc = ((sAsc == null) || (sAsc.equals(""))) ? "false" : sAsc;
      boolean bCheckNewBeatenBy = ((sEvalAll == null) || (sEvalAll.equals(""))) ? false : true;

      BeatenTable oBeatenBy = new BeatenTable();
      PoolStandings oStandings = oGrader.gradePool(oBrackets.toArray(new Bracket[oBrackets.size()]),
          oBeatenBy, sSortBy, sAsc, bCheckNewBeatenBy);
      oBeatenBy.persist();

      Vector oScores = convertStandings(oStandings, oBeatenBy);

      oSession.setAttribute("bracketscores", oScores);
    } catch (Exception e) {
      e.printStackTrace();
      oReturnCode = FORWARD_RETURN_FAILURE;
    }

    return oMapping.findForward(oReturnCode);

  } // doExecute()

  private List<Bracket> getEntries() {
    FluentIterable<Bracket> entries = FluentIterable
        .from(ofy().load().type(Bracket.class).filter("msId !=", Bracket.PERFECT_ID));
    entries = entries.filter(new Predicate<Bracket>() {
      @Override
      public boolean apply(Bracket b) {
        b.init();
        return b.isComplete();
      }
    });
    return entries.toList();
  }

  /*
   * ***************************************************************************
   * convertStandings()
   * ***************************************************************************
   *//**
    *
    */
  private Vector convertStandings(PoolStandings oStandings, BeatenTable oBeatenBy) {
    Vector oScores = new Vector();
    BracketResult[] oResults = oStandings.moResults;

    int nextRank = 1;
    for (int i = 0; i < oResults.length; i++) {
      Bracket b = oResults[i].getBracket();
      String sScore = Long.toString(oResults[i].getScore());
      String sMaxScore = Long.toString(oResults[i].getMax());
      String sWhoIsBetter = oBeatenBy.get(b.getName());

      DisplayBracketBean oBean = new DisplayBracketBean();
      oBean.setName(b.getName());
      oBean.setScore(sScore);
      oBean.setMaxScore(sMaxScore);
      oBean.setChampionAlive(oResults[i].isChampionAlive());
      oBean.setNumFinalFourTeams(oResults[i].getNumFinalFourAlive());
      oBean.setWhoIsBetter(sWhoIsBetter);
      oBean.setTotalComments(0);
      oBean.setWinner(b.getChampionship().getWinner().getName());
      oBean.setIsCelebrity(b.isCelebrity());

      if (b.isCelebrity()) {
        oBean.setRank("");
      } else {
        oBean.setRank(Long.toString(nextRank));
        nextRank++;
      }

      oScores.add(oBean);
    }

    return oScores;

  } // convertStandings()

} // Class: ListBracketsAction
