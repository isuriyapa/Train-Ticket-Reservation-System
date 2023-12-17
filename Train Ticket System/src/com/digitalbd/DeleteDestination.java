package com.digitalbd;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteDestination
 */
@WebServlet("/DeleteDestination")
public class DeleteDestination extends HttpServlet {

  private static final long serialVersionUID = 1L;

  protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    String message = "";
    boolean isTrue = false;
    Destination dest = new Destination();

    String delId = request.getParameter("hdnbt");
    String from = request.getParameter("station_from");
    String train = request.getParameter("dst_train");

    isTrue = dest.Delete(delId);

    if (isTrue == true) {
      message = "Destination Deleted";
      request.setAttribute("message", message);

      RequestDispatcher dis = request.getRequestDispatcher(
        "Destinations.jsp?dst_train=" +
        train +
        "&station_from=" +
        from +
        "&search=1"
      );
      dis.forward(request, response);
    } else {
      message = "Couldn't Delete the Destination";
      request.setAttribute("message", message);

      RequestDispatcher dis = request.getRequestDispatcher(
        "Destinations.jsp?dst_train=" +
        train +
        "&station_from=" +
        from +
        "&search=1"
      );
      dis.forward(request, response);
    }
  }
}
