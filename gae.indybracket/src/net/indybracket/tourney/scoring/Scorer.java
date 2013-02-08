package scoring;
/**
 * @author Indian Magic
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generaution>Code and Comments
 */
public abstract class Scorer
{
    public abstract long scoreWin(Match oGame);
    
    public abstract String getDescription();
}