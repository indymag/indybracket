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
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;


/*
********************************************************************************
* Class: SaveBracketAction
********************************************************************************
*/ /**
*
*/
public class SaveBracketAction
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

        String eastWinnersRequest = oRequest.getParameter("eastWinners");
        String midwestWinnersRequest = oRequest.getParameter("midwestWinners");
        String southWinnersRequest = oRequest.getParameter("southWinners");
        String westWinnersRequest = oRequest.getParameter("westWinners");
        String ffWinnersRequest = oRequest.getParameter("ffWinners");
        
        eastWinnersRequest = (eastWinnersRequest != null) ? eastWinnersRequest.replace("\'", "\\\'") : eastWinnersRequest;       
        midwestWinnersRequest = (midwestWinnersRequest != null) ? midwestWinnersRequest.replace("\'", "\\\'") : midwestWinnersRequest;        
        southWinnersRequest = (southWinnersRequest != null) ? southWinnersRequest.replace("\'", "\\\'") : southWinnersRequest;       
        westWinnersRequest = (westWinnersRequest != null) ? westWinnersRequest.replace("\'", "\\\'") : westWinnersRequest;        
        ffWinnersRequest = (ffWinnersRequest != null) ? ffWinnersRequest.replace("\'", "\\\'") : ffWinnersRequest;
        
        oSession.setAttribute("ffWinners", ffWinnersRequest);
        oSession.setAttribute("eastWinners", eastWinnersRequest);
        oSession.setAttribute("midwestWinners", midwestWinnersRequest);
        oSession.setAttribute("southWinners", southWinnersRequest);
        oSession.setAttribute("westWinners", westWinnersRequest);

        String loadedBracketName =
            (String) oSession.getAttribute("loadedBracketName");
        loadedBracketName =
            (loadedBracketName == null) ? "" : loadedBracketName;

        String bracketName = oRequest.getParameter("bracketName");
        String password = oRequest.getParameter("password");
        String confirmPassword = oRequest.getParameter("confirmPassword");

        bracketName = (bracketName == null) ? "" : bracketName.trim();
        bracketName = bracketName.replaceAll(" ", "");
        if (bracketName != null)
        {
            if (
                (bracketName.indexOf("/") > -1) ||
                (bracketName.indexOf(".") > -1) ||
                (bracketName.indexOf(" ") > -1))
            {
                addError(oRequest, "invalid.character");
                oReturnCode = FORWARD_RETURN_FAILURE;
                return oMapping.findForward(oReturnCode);
            }
        }

        password = (password == null) ? "" : password.trim();
        confirmPassword =
            (confirmPassword == null) ? "" : confirmPassword.trim();

        boolean fileInUse = fileInUseCheck(bracketName);

        if ((bracketName.equals("")) || (password.equals("")))
        {
            oRequest.setAttribute("errorCode", "Empty Field");
            oReturnCode = FORWARD_RETURN_FAILURE;
        }
        else if (fileInUse && (!(loadedBracketName.equals(bracketName))))
        {
            oRequest.setAttribute("errorCode", "Bracket Name in use");
            oReturnCode = FORWARD_RETURN_FAILURE;
        }
        else if (!(password.equals(confirmPassword)))
        {
            oRequest.setAttribute("errorCode", "Passwords do not match");
            oReturnCode = FORWARD_RETURN_FAILURE;
        }
        else
        {
            try
            {
                BufferedWriter out =
                    new BufferedWriter(
                        new FileWriter(
                            BRACKET_FILE_PATH + bracketName + ".txt"));

                String ffWinners = (String) oSession.getAttribute("ffWinners");
                String eastWinners =
                    (String) oSession.getAttribute("eastWinners");
                String southWinners =
                    (String) oSession.getAttribute("southWinners");
                String midwestWinners =
                    (String) oSession.getAttribute("midwestWinners");
                String westWinners =
                    (String) oSession.getAttribute("westWinners");

                out.write(password + "\n");
                out.write(ffWinners + "\n");
                out.write(eastWinners + "\n");
                out.write(southWinners + "\n");
                out.write(midwestWinners + "\n");
                out.write(westWinners + "\n");

                out.close();

                ActionMessages messages = new ActionMessages();
                ActionMessage message = new ActionMessage("success.saved");
                messages.add(ActionMessages.GLOBAL_MESSAGE, message);
                saveMessages(oRequest, messages);
            }
            catch (Exception e)
            {
                System.out.println("Exception: " + e.toString());

                oRequest.setAttribute("errorCode", "Failed to save. Check bracket root directory");
                oReturnCode = FORWARD_RETURN_FAILURE;
            }
        }


        return oMapping.findForward(oReturnCode);

    } // doExecute()

    /*
    ****************************************************************************
    * fileInUseCheck()
    ****************************************************************************
    */ /**
    *
    */
    private boolean fileInUseCheck(String bracketName)
    {
        boolean returnVal = false;
        try
        {
            File f = new File(BRACKET_FILE_PATH + bracketName + ".txt");
            returnVal = f.exists();
        }
        catch (Exception e) {}

        return returnVal;

    } // fileInUseCheck()

} // Class: SaveBracketAction
