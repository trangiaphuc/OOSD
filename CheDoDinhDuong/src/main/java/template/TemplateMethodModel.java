package template;

public abstract class TemplateMethodModel {
    protected abstract int getIdByName(String name);

    public final int executeQ(String name){

        return getIdByName(name);
    }
}
