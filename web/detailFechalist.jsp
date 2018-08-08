<%-- 
    Document   : detailFechalist
    Created on : 27/04/2018, 14:56:46
    Author     : t7249320
--%>

<%@page import="java.util.List"%>
<%@page import="dados.Sistema"%>
<%@page import="conectadb.incidenteDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="pages.css" rel="stylesheet" type="text/css"/>

        <title>Dash Board Hitss</title>
        <%  String user = (String) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("index.jsp");
            }
        %>


    </head>
    <body>

        <div class="row"> 
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="col-md-3">
                        <a href="dashBoard.jsp"> <img  id="logo_pages" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png"> </a>
                    </div>

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
                            <li><a href="grafico.jsp">Gráfico de incidentes</a></li>

                            <li><a href="incidentesList.jsp">Listar Incidentes</a></li>
                            <!--    <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestão<span class="caret"></span></a>
                              <ul class="dropdown-menu">
                                  
                                
                               
                                  <li role="separator" class="divider"></li>
                                  <li><a href="#">Verificar apontamentos</a></li>
                                  <li role="separator" class="divider"></li>
                               
                              </ul>
                          </li>
                      </ul>-->

                            <ul class="nav navbar-nav navbar-right">
                                   <li id="iconeSair" ><a class="glyphicon glyphicon-off btn-lg" href="fechaSession.jsp"><span id="sair">Sair</span>    </a>  </li>

                            </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>

        </div>

        <div class="row">
            <h2 class="inciText">Lista Geral de Incidentes</h2>
        </div>

        <div class="container-fluid" id="rel">

            <div class="row">
                <div class="col-sm-12 col-md-2"></div>
                <div class="col-sm-12 col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-heading"> 

                        </div>

                        <!-- Table -->
                        <form  action="${pageContext.request.contextPath}/incidentDetailServlet" method="POST">
                            <table class="table" id="tbInci">
                                <tr> 
                                    <th>Ocorrência</th>
                                    <th>Sistema</th>
                                    <th>Abertura </th>
                                    <th>Chamado</th>
                                    <th>Status</th>
                                    <th>Horário de Fechamento </th>
                                </tr>
                                <% incidenteDao inciDao = new incidenteDao();

                                    List<Sistema> incidentes = inciDao.relatorioIncidentes();

                                    for (Sistema s : incidentes) {

                                %>
                                <tr>
                                    <td id="td"> <%=s.getOcorrencia()%></td>   
                                    <td> <%=s.getSistema()%></td>
                                    <td> <%=s.getAbertura()%></td>
                                    <td > <%=s.getChamado()%></td>
                                    <td> <%=s.getStatus()%><br></td>
                                    <td> <%=s.getFechamento()%><br></td>
                                    <td> 
                                        <button name="ch" class="btn btn-primary" id="cha" type="submit" value="<%=s.getChamado()%>">Detalhar</button>
                                    </td>
                                </tr>
                                <%}%>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="col-sm-12 col-md-2"></div>
            </div>
        </div>




        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="validaLog.js" type="text/javascript"></script>    
        <script src="gerarGrafico.js" type="text/javascript"></script>

    </body>
</html>
