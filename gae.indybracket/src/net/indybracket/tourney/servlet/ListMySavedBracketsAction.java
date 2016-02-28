package net.indybracket.tourney.servlet;

import static net.indybracket.tourney.common.OfyService.ofy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.indybracket.tourney.common.Bracket;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.common.base.Function;
import com.google.common.base.Predicate;
import com.google.common.collect.FluentIterable;

public class ListMySavedBracketsAction extends BaseAction {

  @Override
  public ActionForward doExecute(ActionMapping oMapping,
      ActionForm oActionForm, HttpServletRequest oRequest,
      HttpServletResponse oResponse) throws Exception {
    List<DisplayBracketBean> myBrackets = getMyEntries();
    oSession.setAttribute("myBrackets", myBrackets);
    return oMapping.findForward(FORWARD_RETURN_SUCCESS);
  }

  private List<DisplayBracketBean> getMyEntries() {
    // Objectify doesn't want to work properly for filtering on msPrincipalName,
    // even after re-saving a bracket.
    // ** Jobu, I do it myself.
    FluentIterable<Bracket> entries = FluentIterable.from(ofy().load().type(
        Bracket.class));
    final String principal = getEmail();

    return entries.filter(new Predicate<Bracket>() {
      @Override
      public boolean apply(Bracket bracket) {
        return bracket.getPrincipalName() != null
            && bracket.getPrincipalName().equals(principal);
      }
    }).transform(new Function<Bracket, DisplayBracketBean>() {
      @Override
      public DisplayBracketBean apply(Bracket bracket) {
        DisplayBracketBean oBean = new DisplayBracketBean();
        oBean.setName(bracket.getEntryName());
        oBean.setIsValid(bracket.isComplete());
        return oBean;
      }
    }).toList();
  }
}
