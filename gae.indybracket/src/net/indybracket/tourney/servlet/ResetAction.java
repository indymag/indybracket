package net.indybracket.tourney.servlet;

/*
 * Created on Feb 15, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */

/**
 * @author Scott Mennealy
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/*
 ********************************************************************************
 * Class: ResetAction
 ********************************************************************************
 *//**
*
*/
public class ResetAction extends BaseAction {
  /*
   * ***************************************************************************
   * doExecute()
   * ***************************************************************************
   *//**
    *
    */
  public ActionForward doExecute(ActionMapping oMapping,
      ActionForm oActionForm, HttpServletRequest oRequest,
      HttpServletResponse oResponse) {
    oSession.setAttribute("ffWinners", "");
    oSession.setAttribute("eastWinners", "");
    oSession.setAttribute("southWinners", "");
    oSession.setAttribute("midwestWinners", "");
    oSession.setAttribute("westWinners", "");
    oSession.setAttribute("loadedBracketName", "");
    oSession.setAttribute("eastFFLabel", "");
    oSession.setAttribute("southFFLabel", "");
    oSession.setAttribute("midwestFFLabel", "");
    oSession.setAttribute("westFFLabel", "");
    oSession.setAttribute("eastFF", "");
    oSession.setAttribute("southFF", "");
    oSession.setAttribute("midwestFF", "");
    oSession.setAttribute("westFF", "");

    return oMapping.findForward(FORWARD_RETURN_SUCCESS);

  } // doExecute()

} // Class: ResetAction
