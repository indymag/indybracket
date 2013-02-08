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

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/*
********************************************************************************
* Class: ValidatePicksAction
********************************************************************************
*/ /**
*
*/
public class ValidatePicksAction
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
        String oErrorCode = FORWARD_RETURN_SUCCESS;

        String eastWinners = oRequest.getParameter("eastWinners");
        String southWinners = oRequest.getParameter("southWinners");
        String midwestWinners = oRequest.getParameter("midwestWinners");
        String westWinners = oRequest.getParameter("westWinners");
        String ffWinners = oRequest.getParameter("ffWinners");

        eastWinners = StringEscapeUtils.escapeJavaScript(eastWinners);
        southWinners = StringEscapeUtils.escapeJavaScript(southWinners);
        midwestWinners = StringEscapeUtils.escapeJavaScript(midwestWinners);
        westWinners = StringEscapeUtils.escapeJavaScript(westWinners);
        ffWinners = StringEscapeUtils.escapeJavaScript(ffWinners);
        
        oSession.setAttribute("eastWinners", eastWinners);
        oSession.setAttribute("southWinners", southWinners);
        oSession.setAttribute("midwestWinners", midwestWinners);
        oSession.setAttribute("westWinners", westWinners);
        oSession.setAttribute("ffWinners", ffWinners);

        oErrorCode = validateRegion(eastWinners,15,oErrorCode,"east");
        oErrorCode = validateRegion(southWinners,15,oErrorCode,"south");
        oErrorCode = validateRegion(midwestWinners,15,oErrorCode,"midwest");
        oErrorCode = validateRegion(westWinners,15,oErrorCode,"west");
        oErrorCode = validateRegion(ffWinners,3,oErrorCode,"ff");
        
        if(!oErrorCode.equals(FORWARD_RETURN_SUCCESS))
        {
        	oRequest.setAttribute("missingRegion", oErrorCode);
        }
        else
        {
        	oRequest.setAttribute("goodValidate", "true");
        }
        
        return oMapping.findForward(FORWARD_RETURN_SUCCESS);

    } // doExecute()

    /*
    ****************************************************************************
    * validateRegion()
    ****************************************************************************
    */ /**
    *
    */
    private String validateRegion(String sWinners, int iExpectedLength, 
    							String sCurrentReturnCode, String sRegion)
    {
    	if(!(sCurrentReturnCode.equals(FORWARD_RETURN_SUCCESS)))
    	{
    		return sCurrentReturnCode;
    	}
    	
        String sReturnCode = FORWARD_RETURN_SUCCESS;
        if (sWinners != null)
        {
            String[] splitMe = sWinners.split(",");
            if (splitMe.length < iExpectedLength)
            {
                sReturnCode = sRegion;
            }
            else
            {
                for (int i = 0; i < splitMe.length; i++)
                {
                    if (splitMe[i].equals(""))
                    {
                        sReturnCode = sRegion;
                        break;
                    }
                }
            }
        }
        return sReturnCode;

    } // validateRegion()

} // Class: ValidatePicksAction
