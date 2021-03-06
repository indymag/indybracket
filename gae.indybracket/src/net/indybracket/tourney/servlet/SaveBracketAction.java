package net.indybracket.tourney.servlet;

/*
 * Created on Feb 15, 2005
 */
import static net.indybracket.tourney.common.OfyService.ofy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.indybracket.tourney.common.Bracket;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/*
 ********************************************************************************
 * Class: SaveBracketAction
 ********************************************************************************
 *//**
*
*/
public class SaveBracketAction extends BaseAction {
  /*
   * ***************************************************************************
   * doExecute()
   * ***************************************************************************
   *//**
    *
    */
  public ActionForward doExecute(ActionMapping oMapping, ActionForm oActionForm,
      HttpServletRequest oRequest, HttpServletResponse oResponse) {
    try {
      assertActionAllowed(ACTION_AUTHZ.MODIFY_SELF);
    } catch (RuntimeException ex) {
      return oMapping.findForward(FORWARD_RETURN_FAILURE);
    }

    String oReturnCode = FORWARD_RETURN_SUCCESS;
    InitUtil.setupTeams(getResources(oRequest));

    String eastWinnersRequest = oRequest.getParameter("eastWinners");
    String midwestWinnersRequest = oRequest.getParameter("midwestWinners");
    String southWinnersRequest = oRequest.getParameter("southWinners");
    String westWinnersRequest = oRequest.getParameter("westWinners");
    String ffWinnersRequest = oRequest.getParameter("ffWinners");

    eastWinnersRequest = (eastWinnersRequest != null) ? eastWinnersRequest.replace("\'", "\\\'")
        : eastWinnersRequest;
    midwestWinnersRequest = (midwestWinnersRequest != null) ? midwestWinnersRequest.replace("\'",
        "\\\'") : midwestWinnersRequest;
    southWinnersRequest = (southWinnersRequest != null) ? southWinnersRequest.replace("\'", "\\\'")
        : southWinnersRequest;
    westWinnersRequest = (westWinnersRequest != null) ? westWinnersRequest.replace("\'", "\\\'")
        : westWinnersRequest;
    ffWinnersRequest = (ffWinnersRequest != null) ? ffWinnersRequest.replace("\'", "\\\'")
        : ffWinnersRequest;

    oSession.setAttribute("ffWinners", ffWinnersRequest);
    oSession.setAttribute("eastWinners", eastWinnersRequest);
    oSession.setAttribute("midwestWinners", midwestWinnersRequest);
    oSession.setAttribute("southWinners", southWinnersRequest);
    oSession.setAttribute("westWinners", westWinnersRequest);

    String loadedBracketName = (String) oSession.getAttribute("loadedBracketName");
    loadedBracketName = (loadedBracketName == null) ? "" : loadedBracketName;

    String bracketName = oRequest.getParameter("bracketName");

    bracketName = (bracketName == null) ? "" : bracketName.trim();
    bracketName = bracketName.replaceAll(" ", "");
    if (!bracketName.matches(Bracket.BRACKET_NAME_REGEX)) {
      addError(oRequest, "invalid.character in bracket name");
      oReturnCode = FORWARD_RETURN_FAILURE;
      return oMapping.findForward(oReturnCode);
    }

    if (bracketName.equals("")) {
      oRequest.setAttribute("errorCode", "Bracket name cannot be empty");
      oReturnCode = FORWARD_RETURN_FAILURE;
      return oMapping.findForward(oReturnCode);
    }

    String email = getEmail();
    Bracket existing = readBracket(bracketName, null, false);
    if (existing != null) {
      if (!email.equals(existing.getUserEmail())) {
        oRequest.setAttribute("errorCode", "Another bracket with this name already exists");
        oReturnCode = FORWARD_RETURN_FAILURE;
        return oMapping.findForward(oReturnCode);
      }
    }

    try {
      String ffWinners = (String) oSession.getAttribute("ffWinners");
      String eastWinners = (String) oSession.getAttribute("eastWinners");
      String southWinners = (String) oSession.getAttribute("southWinners");
      String midwestWinners = (String) oSession.getAttribute("midwestWinners");
      String westWinners = (String) oSession.getAttribute("westWinners");
      if (oRequest.getUserPrincipal() != null) {
        String principal = oRequest.getUserPrincipal().getName();
        String nickname = getNickname();
        String id = email + "/" + bracketName;
        Bracket b = Bracket.newDbInstance(id);
        b.setEntryName(bracketName);
        b.setUserEmail(email);
        b.setUserNickname(nickname);
        b.setPrincipalName(principal);
        b.importFromWebapp(eastWinners, southWinners, midwestWinners, westWinners, ffWinners);
        ofy().save().entity(b).now();
        ActionMessages messages = new ActionMessages();
        ActionMessage message = new ActionMessage("success.saved");
        messages.add(ActionMessages.GLOBAL_MESSAGE, message);
        saveMessages(oRequest, messages);
      } else {
        throw new RuntimeException("User not logged in");
      }

    } catch (Exception e) {
      e.printStackTrace();
      oRequest.setAttribute("errorCode", "Failed to save. Check bracket root directory");
      oReturnCode = FORWARD_RETURN_FAILURE;
    }

    return oMapping.findForward(oReturnCode);

  } // doExecute()
} // Class: SaveBracketAction
