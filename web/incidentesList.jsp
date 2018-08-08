
<%-- 
    Document   : dashboard
    Created on : 12/02/2018, 11:01:52
    Author     : t7249320
--%>


<%@page import="conectadb.sistemasDao"%>
<%@page import="docs.ExcelPatern"%>

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
                <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="pages.css" rel="stylesheet" type="text/css"/>

        <title>Dash Board Hitss</title>
        <% ExcelPatern xls = new ExcelPatern();
            String tipo = (String) session.getAttribute("tipo");
            String user = (String) session.getAttribute("user");
            String dataI = "";
            String dataF = "";

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

                        </div>
                    </div>
                    <div class="col-md-2" id="nome">   <span ><%=user%></span></div>
                    <ul class="nav navbar-nav navbar-right">
                        <li id="iconeSair" ><a class="glyphicon glyphicon-off btn-lg" href="fechaSession.jsp"><span id="sair">Sair</span>    </a>  </li>

                    </ul>
                </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

</div>

<div class="row">

</div>

<div class="container-fluid " id="rel">
    <form action="" method="POST">
        <div class="Row">



            <div class="col-md-2"> </div>

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
            <div class="col-md-3">
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

                    <button name="env" class="btn btn-primary" id="pesq" formaction="relatorioPesquisaServlet" type="submit">Pesquisar</button>
                    <button name="env" class="glyphicon glyphicon-save"  formaction="ExtractionExcelPaternServlet" type="submit" ></button>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-2"></div>
            <div class="col-sm-12 col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <h2 class="inciText">Lista Geral de Incidentes</h2>  

                    </div>

                    <!-- Table -->

                    <table class="table" id="tbInci">
                        <tr> 
                            <th>Ocorrência</th>
                            <th>Sistema</th>
                            <th>Data Abertura </th>
                            <th>Chamado</th>
                            <th>Status</th>
                            <th>Fechamento </th>
                        </tr>
                        <% incidenteDao inciDao = new incidenteDao();
                            String ini = "", fim = "", sistema = "";
                            List<Sistema> incidentes = inciDao.relatorioIncidentes(ini, fim, sistema);

                            for (Sistema s : incidentes) {

                        %>
                        <tr>
                            <td id="td"> <%=s.getOcorrencia()%></td>   
                            <td> <%=s.getSistema()%></td>
                            <td> <%=s.getAbertura()%></td>
                            <td > <%=s.getChamado()%></td>
                            <td> <%=s.getStatus()%><br></td>
                            <td> <%=s.getFechamento() %><br></td>
                            <td> 
                                <button name="ch" class="btn btn-primary" id="cha" type="submit" value="<%=s.getChamado()%>" formaction="incidentDetailServlet">Detalhar</button>
                            </td>
                        </tr>
                        <%}%>
                    </table>

                </div>
            </div>
            <div class="col-sm-12 col-md-2"></div>
        </div>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script src="validaLog.js" type="text/javascript"></script>    
<script src="gerarGrafico.js" type="text/javascript"></script>
<script src="excel.js" type="text/javascript"></script> 
</body>
</html>
