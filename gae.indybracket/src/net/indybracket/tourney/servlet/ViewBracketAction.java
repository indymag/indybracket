package net.indybracket.tourney.servlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import net.indybracket.tourney.scoring.BlazerScorer2;
import net.indybracket.tourney.scoring.Bracket;
import net.indybracket.tourney.scoring.BracketResult;
import net.indybracket.tourney.scoring.Grader;


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

        String bracketName = oRequest.getParameter("name");
        // might be coming from add comment
        if(bracketName == null)
        {
        	bracketName = (String)oSession.getAttribute("viewingBracket");
        }

        String eastWinners = "";
        String southWinners = "";
        String midwestWinners = "";
        String westWinners = "";
        String ffWinners = "";
        String curcomment = "";
        String comments = "";
        
        // verify if File by name of BracketName actually exists
        BufferedReader d = null;
        try {
            FileInputStream fstream = new FileInputStream(BRACKET_COMPLETED_PATH +
                    bracketName + ".txt");
            d = new BufferedReader(new InputStreamReader(fstream));
            String sPassword = d.readLine();
            ffWinners = d.readLine();
            eastWinners = d.readLine();
            southWinners = d.readLine();
            midwestWinners = d.readLine();
            westWinners = d.readLine();
            
            Vector oComments = new Vector();
            
            while((curcomment = d.readLine()) != null)
            {
            	oComments.add(curcomment);
            }
            int iTotalComments = oComments.capacity();
            if(!oComments.isEmpty())
            {
   	            for(int i=0; i< MAX_COMMENTS; i++)
   	            {
   	            	String sCurComment = (String)oComments.lastElement();
   	            	comments+= sCurComment + "&#160;&#160;&#160;&#160;";
   	            	oComments.remove(sCurComment);
   	            	if(oComments.isEmpty())
   	            	{
   	            		i = MAX_COMMENTS;
   	            	}
   	            }
            }        
            
            Bracket oBracket = Bracket.newInstance();
            oBracket.importFromWebapp(sPassword, iTotalComments, eastWinners, southWinners, midwestWinners, 
            		westWinners, ffWinners, false, false);

            Bracket oMaster = readBracket(BRACKET_ROOT + "PERFECT.txt", true, false);

            Grader oGrader = new Grader(new BlazerScorer2(), oMaster);
            BracketResult oResult = oGrader.grade(oBracket);

            StringBuffer o1 = new StringBuffer();
            StringBuffer o2 = new StringBuffer();
            StringBuffer o3 = new StringBuffer();
            StringBuffer o4 = new StringBuffer();
            StringBuffer oFF = new StringBuffer();
            oResult.toWebAppStrings(o1, o2, o3, o4, oFF);
            ffWinners = oFF.toString().trim();
            eastWinners = o1.toString().trim();            
            southWinners = o2.toString().trim();
            midwestWinners = o3.toString().trim();
            westWinners = o4.toString().trim();

            oSession.setAttribute("viewingBracket", bracketName);
            
            oSession.setAttribute("ffWinners", ffWinners);

            oSession.setAttribute("eastWinners", eastWinners);
            oSession.setAttribute("southWinners", southWinners);
            oSession.setAttribute("midwestWinners", midwestWinners);
            oSession.setAttribute("westWinners", westWinners);
            oSession.setAttribute("comments",comments);

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
        finally
        {
            try {
                d.close();
            } catch (IOException e) {
            }
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
