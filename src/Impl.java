import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Impl implements Dao{
    private String res=null;

    @Override
    public int save(Bean bean) {
        Connection conn=DBUtil.getConnection();
        DBUtil.startTrans(conn);
        String sql="update json set json=? where id=1";
        PreparedStatement ps=null;
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,bean.getJson());
            int i=ps.executeUpdate();
            DBUtil.endTrans(conn);
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
            DBUtil.rollBack(conn);
        }finally {
            DBUtil.closeAll(conn,ps);
        }
        return 0;
    }

    @Override
    public String selectJson(Bean bean) {
        Connection conn=DBUtil.getConnection();
        DBUtil.startTrans(conn);
        String sql="select * from json";
        PreparedStatement ps=null;
        try {
            ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                res=rs.getString("json");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            DBUtil.rollBack(conn);
        }finally {
            DBUtil.closeAll(conn,ps);
        }
        return res;
    }
}
