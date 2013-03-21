package net.indybracket.tourney.common;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

public class OfyService {
	static {
		try {
			factory().register(Bracket.class);
			factory().register(BeatenEntry.class);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static Objectify ofy() {
		return ObjectifyService.ofy();
	}

	public static ObjectifyFactory factory() {
		return ObjectifyService.factory();
	}
}