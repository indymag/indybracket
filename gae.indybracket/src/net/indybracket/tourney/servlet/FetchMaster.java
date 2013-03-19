package net.indybracket.tourney.servlet;

import static net.indybracket.tourney.common.OfyService.ofy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.indybracket.tourney.common.Bracket;

public class FetchMaster extends HttpServlet {
  private static final long serialVersionUID = 5074036371697778305L;
  private String masterurl;
  
  @Override
  public void init(ServletConfig config) {
	  masterurl = config.getInitParameter("masterurl");
  }
	
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
	  Bracket b = readBracket();
  	  ofy().save().entity(b).now();

	  if (b != null) {
		  resp.setStatus(200);
	  } else {
		  resp.setStatus(500);
	  }
  }

  private Bracket readBracket() throws ServletException {
      try {
          URL url = new URL(masterurl);
          BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
          String sFF = reader.readLine();
          String sRegion1 = reader.readLine();
          String sRegion2 = reader.readLine();
          String sRegion3 = reader.readLine();
          String sRegion4 = reader.readLine();
          reader.close();
          Bracket b = Bracket.newDbInstance(Bracket.PERFECT_ID);
          b.importFromWebapp(sRegion1, sRegion2, sRegion3, sRegion4, sFF);
          return b;
      } catch (IOException e) {
    	  throw new ServletException(e);
      }
  }
   
}
