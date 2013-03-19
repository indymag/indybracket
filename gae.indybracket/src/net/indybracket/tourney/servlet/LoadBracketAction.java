package net.indybracket.tourney.servlet;

import static net.indybracket.tourney.common.OfyService.ofy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.indybracket.tourney.common.Bracket;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/*
********************************************************************************
* Class: LoadBracketAction
********************************************************************************
*/ /**
*
*/
public class LoadBracketAction
    extends BaseAction
{
    /*
    ****************************************************************************
    * doExecute()
    ****************************************************************************
    */ /**
    *
    */
    public ActionForward doExecute(
        ActionMapping oMapping, ActionForm oActionForm,
        HttpServletRequest oRequest, HttpServletResponse oResponse)
    {
//    	if (true) throw new RuntimeException("No!");
        String oReturnCode = FORWARD_RETURN_SUCCESS;
        InitUtil.setupTeams(getResources(oRequest));

        String bracketName = oRequest.getParameter("name");
        bracketName = (bracketName == null) ? "" : bracketName.trim();
        bracketName = bracketName.replaceAll(" ", "");
        
        // validate Bracket Name
        if (!bracketName.matches(Bracket.BRACKET_NAME_REGEX))
        {
            oReturnCode = FORWARD_RETURN_FAILURE;
        }
        else
        {
            try
            {         
            	Bracket b = readBracket(bracketName, getEmail(), false);
                oSession.setAttribute("loadedBracketName", bracketName);
                
                String eastWinners = b.getRegion1();
                String southWinners = b.getRegion2();;
                String midwestWinners = b.getRegion3();;
                String westWinners = b.getRegion4();;
                String ffWinners = b.getFF();

                oSession.setAttribute("ffWinners", ffWinners);
                oSession.setAttribute("eastWinners", eastWinners);
                oSession.setAttribute("southWinners", southWinners);
                oSession.setAttribute("midwestWinners", midwestWinners);
                oSession.setAttribute("westWinners", westWinners);
            }
            catch (Exception e)
            {
                oReturnCode = FORWARD_RETURN_FAILURE;
                System.out.println("Error Loading Bracket: " + e.getMessage());
            }
        }

        if (oReturnCode.equals(FORWARD_RETURN_FAILURE))
        {
            addError(oRequest, "invalid.bracket.name");
        }

        return oMapping.findForward(oReturnCode);

    } // doExecute()

} // Class: LoadBracketAction
