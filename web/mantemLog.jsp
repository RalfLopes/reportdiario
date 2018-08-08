<%
    String user = (String) request.getAttribute("user");
    String log = (String) request.getAttribute("log");
    String tipo = (String) request.getAttribute("tipo");
    session.setAttribute("tipo", tipo);
    session.setAttribute("user", user);
    session.setAttribute("log", log);

    if (tipo == "1") {

        request.getRequestDispatcher("dashBoard.jsp").forward(request, response);
    } else {
        request.getRequestDispatcher("dashBoardBasic.jsp").forward(request, response);
    }
%>


