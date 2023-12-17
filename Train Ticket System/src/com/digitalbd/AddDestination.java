package com.digitalbd;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddDestination
 */
@WebServlet("/AddDestination")
public class AddDestination extends HttpServlet {

  private static final long serialVersionUID = 1L;

  protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response
  ) throws ServletException, IOException {
    String tempTime = "2018-09-05 00:00:00";
    String message = "";
    int isTrue = 0;
    String train = null, from = null;

    if (request.getParameter("save_all") != null) {
      String[] station_toAr = request.getParameterValues("station_to[]");
      String[] jurny_timeAr = request.getParameterValues("jurny_time[]");
      String[] fareAr = request.getParameterValues("fare[]");
      String[] total_seatAr = request.getParameterValues("total_seat[]");
      String[] seat_rangeAr = request.getParameterValues("seat_range[]");
      for (int j = 0; j < station_toAr.length; j++) {
        Destination tempDesti = new Destination();
        tempDesti.station_from = request.getParameter("station_from");
        tempDesti.train_id = request.getParameter("dst_train");
        tempDesti.station_to = station_toAr[j];
        tempDesti.time = jurny_timeAr[j];
        tempDesti.status = "active";
        tempDesti.fare = fareAr[j];
        tempDesti.last_activity = tempTime;
        tempDesti.last_modify_by = "0";
        tempDesti.total_seat = total_seatAr[j];
        tempDesti.seat_range = seat_rangeAr[j];
        tempDesti.type = "up";

        train = tempDesti.train_id;
        from = tempDesti.station_from;

        tempDesti.Save();
      }

      if (isTrue != 0) {
        message = "Destination(s) Created";
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
        message = "Destination(s) Created";
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
}
