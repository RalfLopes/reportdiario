<%-- 
    Document   : newjsp
    Created on : 08/03/2018, 16:11:02
    Author     : t7249320
--%>

<%@page import="conectadb.sistemasDao"%>
<%@page import="java.util.List"%>
<%@page import="dados.Sistema"%>
<%@page import="conectadb.relatorioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html ng-app="plunker">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/nvd3/1.8.1/nv.d3.min.css"/>  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="pages.css" rel="stylesheet" type="text/css"/>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>

        <title>Relatorio  de incidentes</title>

    </head>


    <%  String user = (String) session.getAttribute("user");
        String tipo = (String) session.getAttribute("tipo");

        if (user == null) {
            response.sendRedirect("index.jsp");
        }
    %>

    <body ng-controller="MainCtrl">
        <div class="row"> 
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="col-md-3">
                        <% if (tipo == "1") { %>
                        <a href="dashBoard.jsp"> <img  id="logo_pages" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png"> </a>
                            <%} else { %>
                        <a href="dashBoardBasic.jsp"> <img  id="logo_pages" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png"> </a>
                            <% }%>
                    </div>
                    <div class="col-md-6">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!--    <a class="navbar-brand" href="#">Brand</a>-->
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <!--   <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                                 <li><a href="#">Link</a></li> -->
                                <% if (tipo == "1") { %>
                                <li> <a href="dashBoard.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true" id="home"></span></a></li>
                                        <% } else {%>
                                <li> <a href="dashBoardBasic.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true" id="home"></span></a></li>
                                        <% }%>
                                <li><a href="incidentesList.jsp">Listar Incidentes</a></li>
                                <!--    <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestão<span class="caret"></span></a>
                                  <ul class="dropdown-menu">
                                      
                                    
                                   
                                      <li role="separator" class="divider"></li>
                                      <li><a href="#">Verificar apontamentos</a></li>
                                      <li role="separator" class="divider"></li>
                                   
                                  </ul>
                              </li>
                          </ul>
                                -->

                        </div>
                    </div>
                    <div class="col-md-2" id="nome">   <span ><%=user%>   </span></div>
                    <ul class="nav navbar-nav navbar-right">
                        <li id="iconeSair" ><a class="glyphicon glyphicon-off btn-lg" href="fechaSession.jsp"><span id="sair">Sair</span>    </a>  </li>

                    </ul>
                </div><!-- /.container-fluid -->
            </nav>

        </div>
        <div class="container" >
            <div class="row">
                <div class="col-md-4">

                    <h3 id="total"></h3>
                </div>
                <form action="pesquisaServlet" method="POST">
                    <div class="col-md-2">
                        <div class="form-group">
                            <span>Inicio</span>
                            <input type="date" name="inicio" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <span>Fim</span>
                            <input type="date" name="fim" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <span>Sistema</span>
                            <select class="form-control" id="exampleFormControlSelect1" name="sistema">
                                <option></option>
                                <%   sistemasDao sDao = new sistemasDao();
                                    List<String> sistemas = sDao.relatorioSistemas();
                                    for (String a : sistemas) {
                                %>
                                <option><%=a%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <button type="submit" class=" btn btn-primary" id="pesq">Pesquisar</button>
                        </div>
                    </div>
                </form> 
            </div>
            <div class="row" >
                <div class="col-md-12"id="grafico">
                    <nvd3 options="options" data="sistemas"></nvd3>
                </div>
            </div>
        </div>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.9/angular.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js" charset="utf-8"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/nvd3/1.8.1/nv.d3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-nvd3/1.0.5/angular-nvd3.min.js"></script>

        <script src="validaLog.js" type="text/javascript"></script>
        <script src="app.js"></script>  

    </body>


</html>

