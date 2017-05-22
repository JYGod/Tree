//工具类中的方法一般都是类方法，方便调用
import java.sql.*;

public class DBUtil {
    // 获得连接对象
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tianguo?useUnicode=true&characterEncoding=utf8", "root", "14753258");
            return conn;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    // 事务管理1.开始事务
    public static void startTrans(Connection conn) {
        try {
            conn.setAutoCommit(false);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    // 2.提交事务
    public static void endTrans(Connection conn) {
        try {
            conn.commit();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    // 3.事务回滚
    public static void rollBack(Connection conn) {
        try {
            conn.rollback();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    // 关闭资源（主要针对insert，update，delete语句）
    public static void closeAll(Connection conn, PreparedStatement ps) {
        try {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    // 关闭资源（主要针对select语句）
    public static void closeAll(Connection conn, PreparedStatement ps,
                                ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            closeAll(conn,ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
