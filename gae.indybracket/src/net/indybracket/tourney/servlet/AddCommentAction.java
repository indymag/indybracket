package net.indybracket.tourney.servlet;

import java.io.BufferedWriter;
import java.io.FileWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class AddCommentAction
	extends BaseAction{

	public ActionForward doExecute(
			ActionMapping oMapping, ActionForm oActionForm, 
			HttpServletRequest oRequest, HttpServletResponse oResponse){
		
		String oReturnCode = FORWARD_RETURN_SUCCESS;
		String sBracketName = (String)oSession.getAttribute("viewingBracket");
		
		String sAuthor = oRequest.getParameter("author");		
		String sComment = oRequest.getParameter("comment");
		
		if(StringUtils.isEmpty(sAuthor))
		{
			oRequest.setAttribute("errorCode", "Chooose a Name");
            oReturnCode = FORWARD_RETURN_FAILURE;
		}
		else
		{
			try
			{	
				// TODO write out comment
			}       
			catch (Exception e)
	        {
	            System.out.println("Exception: " + e.toString());
	
	            oRequest.setAttribute("errorCode", "Failed to save comment. Complain to Scott or Chetan");
	            oReturnCode = FORWARD_RETURN_FAILURE;
	        }
		}
		return oMapping.findForward(oReturnCode);
	}

}
