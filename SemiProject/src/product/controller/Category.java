package product.controller;

import common.controller.AbstractController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/habibi/product/category")
public class Category extends AbstractController {



/*    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {

    }*/

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {



        super.setRedirect(false);
        super.setViewPage("/WEB-INF/habibi/product/category.jsp");

        //request.getRequestDispatcher("/WEB-INF/habibi/product/category.jsp").forward(request, response);

    }
}
