package scoring;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author csabnis
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class StreamString
{
    private byte[] moData = null;
    
    public StreamString()
    {        
    }
    
    public StreamString(String s)
    {
        moData = s.getBytes();
    }
    
    public StreamString(ByteArrayOutputStream oOut)
    {
        moData = oOut.toByteArray();
    }

    public void persist(OutputStream oOut) throws IOException
    {
        serialize(oOut, moData);
    }
    
    public static void serialize(OutputStream oOut, byte[] oData) throws IOException
    {
        if (oData != null) 
        {
            writeInt(oOut, oData.length);
            oOut.write(oData);            
        }
        else {
            writeInt(oOut, 0);
        }
    }
    
    public static void writeInt(OutputStream oOut, int nInt) 
    throws IOException
    {
        oOut.write(Integer.toString(nInt).getBytes());
        oOut.write(' ');
    }
    
    public static int readInt(InputStream oIn) throws IOException
    {
        byte sizeBuf[] = new byte[10];
        int nPos = 0;
        while (true)
        {
            int nNext = oIn.read();
            if (nNext == -1)
            {
                throw new IOException("Invalid size.");
            }
            else if (nNext == ' ')
            {
                break;
            }
            else
            {
                sizeBuf[nPos] = (byte)nNext;
                nPos++;
            }
        }        
        
        String sTmp = new String(sizeBuf, 0, nPos, "US-ASCII");
        
        return Integer.parseInt(sTmp);
    }
    
    public void desist(InputStream oIn) throws IOException
    {
        moData = deserialize(oIn);
    }

    public static byte[] deserialize(InputStream oIn) throws IOException
    {
        int length = readInt(oIn);
        byte[] oData = null;
        
        if (length > 0)
        {
            oData = new byte[length];
            int nRead = oIn.read(oData);

            if (nRead != length)
            {
                throw new IOException(
                    "StreamString had incorrect size"
                        + "Expected: "
                        + length
                        + ", Got: "
                        + nRead);
            }
        }
        
        return oData;
    }
    
    public ByteArrayInputStream getAsInStream() 
    {
        if (moData == null) {
            return null;
        }
        
        return new ByteArrayInputStream(moData);        
    }
    
    public String toString()
    {
        return new String(moData);
    }
}
