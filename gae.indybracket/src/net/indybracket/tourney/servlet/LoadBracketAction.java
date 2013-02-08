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
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        String password = oRequest.getParameter("password");
        bracketName = (bracketName == null) ? "" : bracketName.trim();
        bracketName = bracketName.replaceAll(" ", "");
        password = (password == null) ? "" : password.trim();

        String eastWinners = "";
        String southWinners = "";
        String midwestWinners = "";
        String westWinners = "";
        String ffWinners = "";
        String verifyPassword = "";
        
        // validate Bracket Name
        if ((bracketName == null) || (bracketName.equals("")))
        {
            oReturnCode = FORWARD_RETURN_FAILURE;
        }
        else
        {
            // verify if File by name of BracketName actually exists
            try
            {
                FileInputStream fstream =
                    new FileInputStream(BRACKET_FILE_PATH + bracketName + ".txt");
                BufferedReader d =
                    new BufferedReader(new InputStreamReader(fstream));
                verifyPassword = d.readLine();
                ffWinners = d.readLine();
                eastWinners = d.readLine();
                southWinners = d.readLine();
                midwestWinners = d.readLine();
                westWinners = d.readLine();
                
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
        else
        {
            // Bracket name OK, now validate Password		
            if (
                (password == null) || (password.equals("")) ||
                (!password.equals(verifyPassword)))
            {
                oReturnCode = FORWARD_RETURN_FAILURE;
                addError(oRequest, "invalid.password");
            }
        }

        return oMapping.findForward(oReturnCode);

    } // doExecute()

} // Class: LoadBracketAction
