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
        String oReturnCode = FORWARD_RETURN_SUCCESS;

        String bracketName = oRequest.getParameter("name");
        bracketName = (bracketName == null) ? "" : bracketName.trim();
        bracketName = bracketName.replaceAll(" ", "");

        String eastWinners = "";
        String southWinners = "";
        String midwestWinners = "";
        String westWinners = "";
        String ffWinners = "";
        
        // validate Bracket Name
        if (!bracketName.matches(Bracket.BRACKET_NAME_REGEX))
        {
            oReturnCode = FORWARD_RETURN_FAILURE;
        }
        else
        {
            try
            {
                
                oSession.setAttribute("loadedBracketName", bracketName);
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
