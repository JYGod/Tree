
public class Bean {
    private int id;
    private String json;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    public int  save() {
        Dao dao=new Impl();
        return dao.save(this);
    }

    public String selectJson() {
        Dao dao=new Impl();
        return dao.selectJson(this);
    }
}
