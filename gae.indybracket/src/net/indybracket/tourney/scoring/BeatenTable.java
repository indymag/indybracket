package scoring;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;

public class BeatenTable 
{
    static Object soSync = new Object();
    Hashtable<String,String> moTable = new Hashtable<String,String>();
    String msFile;

    public BeatenTable()
    {
    }

    public BeatenTable(String sFile)
    {
        msFile = sFile;
        loadTable();
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

    private void loadTable()
    {
        FileInputStream fstream = null;
        try
        {
            fstream = new FileInputStream(msFile);
            BufferedReader d = new BufferedReader(new InputStreamReader(fstream));
            while (d.ready())
            {
                String[] sLine = d.readLine().split(":");
                moTable.put(sLine[0], sLine[1]);
            }

        }
        catch (Exception e) {}
        finally
        {
            if (fstream != null)
            {
                try
                {
                    fstream.close();
                }
                catch (Exception oEx) {}
            }
        }

    }

    public void persist()
    {
        if (msFile != null)
        {
            synchronized (soSync)
            {
                FileOutputStream fstream = null;
                try
                {
                    fstream = new FileOutputStream(msFile);
                    for (String sBracket : moTable.keySet())
                    {
                        String sVal = sBracket + ":" + moTable.get(sBracket) + "\n";
                        fstream.write(sVal.getBytes());
                    }

                    fstream.flush();
                }
                catch (Exception e) {}
                finally
                {
                    if (fstream != null)
                    {
                        try
                        {
                            fstream.close();
                        }
                        catch (Exception oEx) {}
                    }
                }
            }
        }
    }

}
