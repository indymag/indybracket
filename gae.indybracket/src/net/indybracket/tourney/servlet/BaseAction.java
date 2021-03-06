package net.indybracket.tourney.servlet;

import static net.indybracket.tourney.common.OfyService.ofy;

import javax.servlet.ServletContext;
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

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.common.base.Predicate;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.Lists;

/*
 ********************************************************************************
 * Class: BaseAction
 ********************************************************************************
 *//**
*
*/
public abstract class BaseAction extends Action {
  private static UserService userService = UserServiceFactory.getUserService();

  public final String FORWARD_RETURN_SUCCESS = "success";
  public final String FORWARD_RETURN_FAILURE = "failure";

  public String BRACKET_ROOT = "";
  public String BRACKET_FILE_PATH = "";
  public String BRACKET_COMPLETED_PATH = "";
  public final int MAX_COMMENTS = 20;

  public HttpSession oSession;

  public enum ACTION_AUTHZ {
    VIEW_OTHER("viewOther"), MODIFY_SELF("modifySelf");

    ACTION_AUTHZ(String value) {
      this.value = value;
    }

    private String value;
  }

  /*
   * ***************************************************************************
   * Constructor()
   * ***************************************************************************
   *//**
    *
    */
  public BaseAction() {
    super();

  } // Constructor()

  protected void assertActionAllowed(ACTION_AUTHZ action) {
    ServletContext context = oSession.getServletContext();
    String allowed = context.getInitParameter("actionsAllowed");
    for (String x : allowed.split(",")) {
      if (x.equalsIgnoreCase(action.value)) {
        return;
      }
    }

    throw new RuntimeException(action + " not allowed");
  }

  /*
   * ***************************************************************************
   * execute()
   * ***************************************************************************
   *//**
    *
    */
  public ActionForward execute(ActionMapping oMapping, ActionForm oActionForm,
      HttpServletRequest oRequest, HttpServletResponse oResponse) throws Exception {
    ActionForward oReturn = null;
    doJsrGuavaHack();
    InitUtil.setupTeams(getResources(oRequest));
    try {
      oSession = oRequest.getSession(false);
      oReturn = doExecute(oMapping, oActionForm, oRequest, oResponse);
    } catch (Exception e) {
      oReturn = oMapping.findForward(FORWARD_RETURN_FAILURE);
    }

    return oReturn;
  } // execute()

  /*
   * ***************************************************************************
   * addError()
   * ***************************************************************************
   *//**
    *
    */
  protected void addError(HttpServletRequest oRequest, String sKey) {
    ActionMessages oMessages = new ActionMessages();
    ActionMessage oMessage = new ActionMessage(sKey);

    oMessages.add(Globals.ERROR_KEY, oMessage);

    saveErrors(oRequest, oMessages);

  } // addError()

  @SuppressWarnings("unused")
  public Bracket readMaster() {
    Bracket b = null;
    if (false) {
      b = Bracket.newTransientInstance();
      b.getBaseMatches()[0].setStatus(2);
      b.getBaseMatches()[1].setStatus(1);
      b.getBaseMatches()[2].setStatus(1);
      b.getBaseMatches()[3].setStatus(1);
      b.getBaseMatches()[4].setStatus(2);
    } else {
      b = ofy().load().type(Bracket.class).id(Bracket.PERFECT_ID).get();
    }
    b.init();
    return b;
  }

  protected void doJsrGuavaHack() {
    try {
      FluentIterable.from(Lists.newArrayList());
    } catch (Throwable th) {
      // Hack to work around JSR 305 issues with Guava inside of AppEngine
      // developer SDK.
    }
  }

  /*
   * ***************************************************************************
   * readBracket()
   * ***************************************************************************
   *//**
     *
     */
  public Bracket readBracket(final String name, final String email, boolean bComplete) {
    doJsrGuavaHack();
    FluentIterable<Bracket> brackets = FluentIterable.from(ofy().load().type(Bracket.class)
        .filter("msEntryName", name));
    if (email != null) {
      brackets = brackets.filter(new Predicate<Bracket>() {
        @Override
        public boolean apply(Bracket b) {
          return email.equalsIgnoreCase(b.getUserEmail());
        }
      });
    }

    if (brackets.size() > 1) {
      throw new RuntimeException("Too many brackets matching name " + name);
    }

    if (brackets.isEmpty()) {
      return null;
    }

    Bracket oEntry = brackets.first().get();
    oEntry.init();
    oEntry.validate(bComplete);
    return oEntry;
  } // readBracket()

  public String getBracketId(String bracketName) {
    return getEmail() + "/" + bracketName;
  }

  public String fullNameToBracketId(String fullBracketName) {
    return fullBracketName.replace(" - ", "/");
  }

  public String getEmail() {
    return userService.getCurrentUser().getEmail();
  }

  public String getNickname() {
    return userService.getCurrentUser().getNickname();
  }

  /*
   * ***************************************************************************
   * doExecute()
   * ***************************************************************************
   *//**
    *
    */
  public abstract ActionForward doExecute(ActionMapping oMapping, ActionForm oActionForm,
      HttpServletRequest oRequest, HttpServletResponse oResponse) throws Exception;

} // Class: BaseAction
