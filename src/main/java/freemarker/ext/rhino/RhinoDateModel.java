package freemarker.ext.rhino;

import freemarker.template.TemplateDateModel;
import java.util.Date;
import org.mozilla.javascript.ScriptableObject;

/**
 *
 * @author Sergey Vakhurin
 */
class RhinoDateModel implements TemplateDateModel {

    static boolean isRhinoDate(Object object) {
        return (object instanceof ScriptableObject) && "Date".equals(((ScriptableObject) object).getClassName());
    }

    private final Date date;

    RhinoDateModel(ScriptableObject date) {
        this.date = new Date(((Number) ScriptableObject.callMethod(date, "getTime", null)).longValue());
    }
    
    @Override
    public Date getAsDate() {
        return date;
    }

    @Override
    public int getDateType() {
        return DATETIME;
    }
}
