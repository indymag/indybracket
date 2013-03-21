package net.indybracket.tourney.common;

import static net.indybracket.tourney.common.OfyService.ofy;

import java.util.Hashtable;

public class BeatenTable 
{
    private final Hashtable<String,BeatenEntry> moTable = new Hashtable<String,BeatenEntry>();

    public BeatenTable()
    {
    	for (BeatenEntry entry : ofy().load().type(BeatenEntry.class)) {
    		moTable.put(entry.getLoser(), entry);
    	}
    }

    public String get(String sBracket)
    {
    	BeatenEntry entry = moTable.get(sBracket);
        return entry != null ? entry.getBeater() : "";
    }

    public void addBeaten(String sBracket, String sBeatenBy)
    {
        moTable.put(sBracket, new BeatenEntry(sBracket, sBeatenBy));
    } 
    
    public void persist() {
    	if (!moTable.isEmpty()) {
    		ofy().save().entities(moTable.values());
    	}
    }
}
