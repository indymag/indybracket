package net.indybracket.tourney.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ListMySavedBracketsAction extends BaseAction {

	@Override
	public ActionForward doExecute(ActionMapping oMapping,
			ActionForm oActionForm, HttpServletRequest oRequest,
			HttpServletResponse oResponse) throws Exception {
		return oMapping.findForward(FORWARD_RETURN_SUCCESS);
	}

}
