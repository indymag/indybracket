package net.indybracket.tourney.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.indybracket.tourney.common.Bracket;
import net.indybracket.tourney.scoring.BlazerScorer2;
import net.indybracket.tourney.scoring.BracketResult;
import net.indybracket.tourney.scoring.Grader;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/*
********************************************************************************
* Class: ViewBracketAction
********************************************************************************
*/ /**
*
*/
public class ViewBracketAction extends BaseAction {

	/*
    ****************************************************************************
    * doExecute()
    ****************************************************************************
    */ /**
    *
    */
    public ActionForward doExecute(ActionMapping oMapping,
        ActionForm oActionForm, HttpServletRequest oRequest,
        HttpServletResponse oResponse) {
        String oErrorCode = FORWARD_RETURN_SUCCESS;

        String fullName = oRequest.getParameter("name");
        // might be coming from add comment
        if(fullName == null)
        {
        	fullName = (String)oSession.getAttribute("viewingBracket");
        }

        
        try {
        	String id = fullNameToBracketId(fullName);
            Bracket oBracket = readBracket(id, false);
            Bracket oMaster = readBracket(Bracket.PERFECT_ID, false);

            Grader oGrader = new Grader(new BlazerScorer2(), oMaster);
            BracketResult oResult = oGrader.grade(oBracket);

            StringBuffer o1 = new StringBuffer();
            StringBuffer o2 = new StringBuffer();
            StringBuffer o3 = new StringBuffer();
            StringBuffer o4 = new StringBuffer();
            StringBuffer oFF = new StringBuffer();
            oResult.toWebAppStrings(o1, o2, o3, o4, oFF);
            String ffWinners = oFF.toString().trim();
            String eastWinners = o1.toString().trim();            
            String southWinners = o2.toString().trim();
            String midwestWinners = o3.toString().trim();
            String westWinners = o4.toString().trim();

            oSession.setAttribute("viewingBracket", fullName);
            
            oSession.setAttribute("ffWinners", ffWinners);

            oSession.setAttribute("eastWinners", eastWinners);
            oSession.setAttribute("southWinners", southWinners);
            oSession.setAttribute("midwestWinners", midwestWinners);
            oSession.setAttribute("westWinners", westWinners);
            oSession.setAttribute("comments","");

            String eastFF = findWinner(eastWinners);
            String midwestFF = findWinner(midwestWinners);
            String southFF = findWinner(southWinners);
            String westFF = findWinner(westWinners);

            String unescapedEastFF = eastFF.replace("\\\'", "\'");
            String unescapedSouthFF = southFF.replace("\\\'", "\'");
            String unescapedMidwestFF = midwestFF.replace("\\\'", "\'");
            String unescapedWestFF = westFF.replace("\\\'", "\'");

            oSession.setAttribute("eastFFLabel", setGameStatus(unescapedEastFF, false));
            oSession.setAttribute("southFFLabel", setGameStatus(unescapedSouthFF, false));
            oSession.setAttribute("midwestFFLabel", setGameStatus(unescapedMidwestFF, false));
            oSession.setAttribute("westFFLabel", setGameStatus(unescapedWestFF, false));
            
            oSession.setAttribute("eastFFLabelStatus", setGameStatus(unescapedEastFF, true));
            oSession.setAttribute("southFFLabelStatus", setGameStatus(unescapedSouthFF, true));
            oSession.setAttribute("midwestFFLabelStatus", setGameStatus(unescapedMidwestFF, true));
            oSession.setAttribute("westFFLabelStatus", setGameStatus(unescapedWestFF, true));
            
            oSession.setAttribute("eastFF", eastFF);
            oSession.setAttribute("southFF", southFF);
            oSession.setAttribute("midwestFF", midwestFF);
            oSession.setAttribute("westFF", westFF);
        } catch (Exception e) {
            oErrorCode = FORWARD_RETURN_FAILURE;
            addError(oRequest, "invalid.bracket.name");
        }

        return oMapping.findForward(oErrorCode);

    } // doExecute()

    /*
    ****************************************************************************
    * setGameStatus()
    ****************************************************************************
    */ /**
    *
    */
    private String setGameStatus(String oString, boolean bShowAll) {
    	String oModified = "";
    	String sPoints = "";
    	
        String[] oStatusLoss = oString.split("#");
        String[] oStatusWin = oString.split("\\$");
        String[] oStatusUnknown = oString.split("@");
        if(oStatusLoss.length > 1)
        {
        	oModified = oStatusLoss[0];
        	sPoints = " ("+oStatusLoss[1]+")";
        }
        else if(oStatusWin.length > 1)
        {
        	oModified = oStatusWin[0];
        	sPoints = " ("+oStatusWin[1]+")";
        }       
        else if(oStatusUnknown.length > 1)
        {
        	oModified = oStatusUnknown[0];
        	sPoints = " ("+oStatusUnknown[1]+")";
        }
        
        if(bShowAll)
        {
        	oModified += sPoints;
        }
        
        return oModified;

    } // setGameStatus()

    /*
    ****************************************************************************
    * findWinner()
    ****************************************************************************
    */ /**
    *
    */
    public String findWinner(String winners) {
        String winner = " ";

        if (winners != null) {
            String[] splitWinners = winners.split(",");

            if (splitWinners.length == 15) {
                winner = splitWinners[splitWinners.length - 1];
            }
        }

        return winner;

    } // findWinner()

} // Class: ViewBracketAction
