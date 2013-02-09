package net.indybracket.tourney.common;

import java.util.Hashtable;

public class BeatenTable 
{
    static Object soSync = new Object();
    Hashtable<String,String> moTable = new Hashtable<String,String>();
    String msFile;

    public BeatenTable()
    {
    }

    public String get(String sBracket)
    {
        String sVal = moTable.get(sBracket);
        return sVal != null ? sVal : "";
    }

    public void addBeaten(String sBracket, String sBeatenBy)
    {
        moTable.put(sBracket, sBeatenBy);
    }
}
