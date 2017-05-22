import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Servlet extends HttpServlet{
    private static final long serialVersionUID=1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path=req.getRequestURI();
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        if (path.endsWith("json/save")){
            this.save(req,resp);
        }else if (path.endsWith("json/select")){
            this.select(req,resp);
        }
    }

    private void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Bean bean=new Bean();
        String json=bean.selectJson();
        req.setAttribute("resJson",json);
        System.out.println(json);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json=req.getParameter("json");
        Bean bean=new Bean();
        bean.setJson(json);
        int i= bean.save();
        String resJson=bean.selectJson();
        req.setAttribute("resJson",resJson);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
