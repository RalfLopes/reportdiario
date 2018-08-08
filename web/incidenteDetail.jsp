<%-- 
    Document   : incidenteDetail
    Created on : 05/04/2018, 12:39:45
    Author     : t7249320
--%>
<%@page import="conectadb.relatorioDao"%>
<%@page import="java.util.List"%>
<%@page import="dados.Sistema"%>
<%@page import="conectadb.incidenteDao"%>
<%@page import="conectadb.relatorioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="pages.css" rel="stylesheet" type="text/css"/>

        <title>Dash Board - Indent Detail</title>
        <%  String user = (String) session.getAttribute("user");
            String tipo = (String) session.getAttribute("tipo");

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
                        <% if (tipo == "1") { %>
                        <a href="dashBoard.jsp"> <img  id="logo_pages" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png"> </a>
                            <%} else { %>
                        <a href="dashBoardBasic.jsp"> <img  id="logo_pages" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png"> </a>
                            <% }%>
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
                    <div class="col-md-5"> 
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <!--   <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                                 <li><a href="#">Link</a></li> -->
                                <% if (tipo == "1") { %>
                                <li> <a href="dashBoard.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true" id="home"></span></a></li>
                                        <% } else {%>
                                <li> <a href="dashBoardBasic.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true" id="home"></span></a></li>
                                        <% }%>
                                <li> <a href="grafico.jsp">Gráfico de incidentes</a> </li>
                                <li><a data-toggle="modal" data-target="#funcionarios" >Criar usuário</a></li>

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



                        </div>
                    </div><!-- /.navbar-collapse -->
                    <div class="col-md-2" id="nome">   <span >Bem Vindo <%=user%></span></div>
                    <div class="col-md-2"> 

                        <ul class="nav navbar-nav navbar-right">


                            <li id="iconeSair" ><a class="glyphicon glyphicon-off btn-lg" href="fechaSession.jsp"><span id="sair">Sair</span>    </a>  </li>
                        </ul>
                    </div>
                </div><!-- /.container-fluid -->

            </nav>

        </div>
    <body>
    </div>
    <div class="container" id="rel"> 
        <div class="row">

        </div>

        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">  <h2 class="inciText">Dados do incidente</h2></button>
                </div>
                <table class="table" id="tbInci">

                    <tr> 
                        <th>Ocorrência</th>
                        <th>Sistema</th>
                        <th>Abertura </th>
                        <th>chamado</th>
                        <th>Status</th>
                    </tr>
                    <% incidenteDao inciDao = new incidenteDao();

                        String saida = (String) request.getAttribute("numero");
                        Sistema sist = new Sistema();

                        List<Sistema> incidentes = inciDao.getIncident(Integer.parseInt(saida));

                        for (Sistema s : incidentes) {

                    %>
                    <tr>
                        <td id="td"> <%=s.getOcorrencia()%></td>   
                        <td><%=s.getSistema()%></td>
                        <td><%=s.getAbertura()%></td>
                        <td><%=s.getChamado()%></td>
                        <td id="status"><%=s.getStatus()%></td>
                    </tr>
                    <tr>
                        <th colspan="5" id="dado">Descrição</th>                   
                    </tr>
                </table>


                <div>
                    <table id="tbObs">
                        <tr>
                            <td id="obs"> <%=s.getObservações()%></td>                
                        </tr>
                    </table>
                </div>

                <div class="row" id="updates">
                    <form method="POST" > 

                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-danger" name="altD"  id="btnend" value="<%=s.getChamado()%>" data-toggle="modal" 
                                    data-target="#encerra">Encerrar incidente</button>

                            <button type="button" class="btn btn-success" name="altOpen"  id="altOpen" value="<%=s.getChamado()%>" data-toggle="modal" 
                                    data-target="#abre">Reabrir</button>
                        </div>


                        <div class="col-md-2">
                            <button type="submit" class="btn btn-success" formaction="UpdateServlet"  name="ch" value="<%=s.getChamado()%>" id="btnAlt"> Atualizar incidente</button>
                        </div>                   
                        <div class="col-md-4"></div>
                    </form>

                </div>

            </div>
        </div>

        <div class="modal fade" id="encerra" tabindex="1" role="dialog" aria-labelledby="" aria-hidden="true">
            <div class="modal-dialog" id="mteste" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Encerrar Incidentes</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="fechaIncidenteServlet" method="POST">
                            <div class="row">                                
                                <div class= "col-md-3">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Hora</label>
                                        <input type="time" class="form-control" name="horaF">
                                    </div>
                                </div>
                                <div class= "col-md-5">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Data</label>
                                        <input type="date" class="form-control" name="dateF">
                                    </div>
                                </div>
                                <div class= "col-md-3">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Volumetria</label>
                                        <input type="text" class="form-control" name="vol">
                                    </div>
                                </div>


                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="comment">Descrição da Ocorrência:</label>
                                        <textarea class="form-control" rows="5" name="obs"> <%=s.getObservações()%></textarea>
                                    </div>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit"  name="altD"  value="<%=s.getChamado()%>" class="btn btn-danger">Encerrar</button>
                            </div>                  
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <%}%>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="validaLog.js" type="text/javascript"></script>    
        <script src="gerarGrafico.js" type="text/javascript"></script>
        <script src="testeget.js" type="text/javascript"></script>
</body>
</html>
