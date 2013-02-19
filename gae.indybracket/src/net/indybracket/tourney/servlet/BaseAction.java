package net.indybracket.tourney.servlet;

import static net.indybracket.tourney.common.OfyService.ofy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.indybracket.tourney.common.Bracket;

import org.apache.struts.Globals;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;


/*
********************************************************************************
* Class: BaseAction
********************************************************************************
*/ /**
*
*/
public abstract class BaseAction
    extends Action
{
	public final String FORWARD_RETURN_SUCCESS = "success";
	public final String FORWARD_RETURN_FAILURE = "failure";
	
    public String BRACKET_ROOT = "";
    public String BRACKET_FILE_PATH = "";
    public String BRACKET_COMPLETED_PATH = "";
	public final int MAX_COMMENTS = 20;

    public HttpSession oSession;
    
    /*
    ****************************************************************************
    * Constructor()
    ****************************************************************************
    */ /**
    *
    */
    public BaseAction()
    {
        super();

    } // Constructor()

    /*
    ****************************************************************************
    * execute()
    ****************************************************************************
    */ /**
    *
    */
    public ActionForward execute(
        ActionMapping oMapping, ActionForm oActionForm,
        HttpServletRequest oRequest, HttpServletResponse oResponse)
        throws Exception
    {
    	ActionForward oReturn = null;
        try
        {
	    	oSession = oRequest.getSession(false);
	     
	        setBracketPath();
	        oReturn = doExecute(oMapping, oActionForm, oRequest, oResponse);
        }
        catch(Exception e)
        {
        	oReturn = oMapping.findForward(FORWARD_RETURN_FAILURE);
        }
        
        return oReturn;
    } // execute()

    /*
    ****************************************************************************
    * addError()
    ****************************************************************************
    */ /**
    *
    */
    protected void addError(HttpServletRequest oRequest, String sKey)
    {
        ActionMessages oMessages = new ActionMessages();
        ActionMessage oMessage = new ActionMessage(sKey);

        oMessages.add(Globals.ERROR_KEY, oMessage);

        saveErrors(oRequest, oMessages);

    } // addError()

    /*
    ****************************************************************************
    * setBracketPath()
    ****************************************************************************
    */ /**
    *
    */
    private void setBracketPath() throws NullPointerException
    {
        try
        {
            BRACKET_ROOT = getServlet().getInitParameter("bracket-root");
            BRACKET_FILE_PATH = BRACKET_ROOT + "brackets/";
            BRACKET_COMPLETED_PATH = BRACKET_ROOT + "completed/";
        }
        catch (NullPointerException e)
        {
            System.out.print("Error setting bracket path: " + e);
            throw e;
        }

    } // setBracketPath()
    /*
     ****************************************************************************
     * readBracket()
     ****************************************************************************
     */ /**
     *
     */
     public Bracket readBracket(String bracketId, boolean bComplete)
     {
     	Bracket oEntry = ofy().load().type(Bracket.class).id(bracketId).get();
     	oEntry.validate(bComplete);
     	return oEntry;
     } // readBracket()
    /*
    ****************************************************************************
    * doExecute()
    ****************************************************************************
    */ /**
    *
    */
    public abstract ActionForward doExecute(
        ActionMapping oMapping, ActionForm oActionForm,
        HttpServletRequest oRequest, HttpServletResponse oResponse)
        throws Exception;

} // Class: BaseAction
