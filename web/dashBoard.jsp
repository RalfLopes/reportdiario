<%-- 
    Document   : dashboard
    Created on : 12/02/2018, 11:01:52
    Author     : t7249320
--%>


<%@page import="conectadb.sistemasDao"%>
<%@page import="conectadb.relatorioDao"%>
<%@page import="java.util.List"%>
<%@page import="dados.Sistema"%>
<%@page import="conectadb.incidenteDao"%>
<%@page import="conectadb.relatorioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="pages.css" rel="stylesheet" type="text/css"/>
        <title>Dash Board Hitss</title>
    </head>
    <body>
        <% incidenteDao inciDao = new incidenteDao();
            String nome = (String) session.getAttribute("user");
            String tipo = (String)  session.getAttribute("tipo");
            String user = (String) session.getAttribute("log");
            request.setAttribute(tipo, tipo);
            if (nome == null) {
                response.sendRedirect("index.jsp");
            }
        %>

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

                                <li> <a href="grafico.jsp">Gráfico de incidentes</a> </li>
                                <li><a data-toggle="modal" data-target="#funcionarios" >Criar usuário</a></li>
                                <li><a href="incidentesList.jsp">Listar Incidentes</a></li>


                        </div>
                    </div><!-- /.navbar-collapse -->
                    <div class="col-md-2" id="nome">   <span >Bem Vindo <%=nome%></span></div>
                    <div class="col-md-2"> 

                        <ul class="nav navbar-nav navbar-right">                    
                            <li id="iconeSair" ><a class="glyphicon glyphicon-off btn-lg" href="fechaSession.jsp"><span id="sair">Sair</span>    </a>  </li>
                        </ul>
                    </div>
                </div><!-- /.container-fluid -->
            </nav>

        </div>
        <div class="container-fluid" id="rel"> 
            <div class="row">
                <h2 class="inciText">Incidentes em aberto</h2>
            </div>

            <div class="row">
                <div class="col-sm-12 col-md-2"></div>
                <div class="col-sm-12 col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-heading"> <b>Criar incidente</b>
                            <button id="button"type="button" onclick="" class="btn btn-primary" data-toggle="modal" 
                                    data-target="#incidentes" ></a>
                                <span class="glyphicon glyphicon-plus"></span></button>
                        </div>                        
                        <form  action="incidentDetailServlet" method="POST">
                            <table class="table" id="tbInci">
                                <tr> 
                                    <th>Ocorrência</th>
                                    <th>Sistema</th>
                                    <th>Abertura </th>
                                    <th>Hora Inicio </th>
                                    <th>Chamado</th>
                                    <th>Status</th>
                                </tr>

                                <% List<Sistema> incidentes = inciDao.listaIncidentes();
                                    for (Sistema s : incidentes) {
                                %>
                                <tr>
                                    <td id="td"> <%=s.getOcorrencia()%></td>   
                                    <td> <%=s.getSistema()%></td>
                                    <td> <%=s.getAbertura()%></td>
                                    <td> <%=s.getHoraI()%></td>
                                    <td > <%=s.getChamado()%></td>
                                    <td> <%=s.getStatus()%><br></td>
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
        <div class="modal fade" id="incidentes" tabindex="-1" role="dialog" aria-labelledby="incidentesLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Inserção de incidentes  </h3> 
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="incidentesServlts" method="POST">
                            <div class="row">
                                <div class= "col-md-6"> 
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Tipo de Ocorrência:</label>
                                        <select class="form-control" id="exampleFormControlSelect1" name="ocorrencia">
                                            <option></option>
                                            <option>Indisponibilidade</option>
                                            <option>Lentidão</option>
                                            <option>Instabilidade</option>
                                            <option>Erro</option>
                                            <option>Atualização</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Sistema</label>
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
                            </div>
                            <div class="row">
                                <div class= "col-md-2">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Chamado </label>
                                        <input type="number" class="form-control" name="chamado">
                                    </div>
                                </div>
                                <div class= "col-md-3">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Hora </label>
                                        <input type="time" class="form-control" name="horaI">
                                    </div>
                                </div>
                                <div class= "col-md-4">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Data </label>
                                        <input type="date"  class="form-control" name="dateI">
                                    </div>
                                </div>
                                <div class= "col-md-2">
                                    <div class="form-group">
                                         <label for="recipient-name" class="col-form-label">Usuário</label>   
                                         <input name="log" type="hidden" value=" <%=user%>"><%=user%>
                                         
                                    </div>
                                </div>
                            </div>

                    </div>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" id="btnIncident"  class="btn btn-primary">Salvar</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="funcionarios" tabindex="-1" role="dialog" aria-labelledby="FuncionariosLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">Cadastro de Usuários</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="cadUserServlet" method="POST">
                        <div class="row">
                            <div class= "col-md-6">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Nível Hierarquico:</label>
                                    <select class="form-control" id="exampleFormControlSelect1" name="nivel">
                                        <option></option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Ponto Focal</option>
                                        <option value="3">Gestor</option>
                                        <option value="4">Supervisor</option>
                                    </select>
                                </div>
                            </div>
                            <div class= "col-md-6">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Torre:</label>
                                    <select class="form-control" id="torreOP">
                                        <option></option>
                                        <option value="Claro Movel">Claro Movel</option>
                                        <option value="Micro-informatica">Micro-informatica</option>
                                        <option value="Monitoria">Monitoria</option>
                                        <option value="PDA Telecom">PDA Telecom</option>
                                        <option value="Portabilidade">Portabilidade</option>
                                        <option value="Sistemas">Sistemas</option>
                                        <option value="Web">Web</option>
                                        <option value="Mdrugada">Madrugada</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class= "col-md-3"> 
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Login de Rede</label>
                                    <input type="text" class="form-control" name="login">
                                </div>
                            </div>
                            <div class= "col-md-6">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Nome Colaborador</label>
                                    <input type="text" class="form-control" name="nome">
                                </div>
                            </div>
                            <div class= "col-md-3">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Senha</label>
                                    <input type="password" class="form-control" name="senha">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" id="btnCadFunc"  class="btn btn-primary">Salvar</button>
                        </div>                  
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="validaLog.js" type="text/javascript"></script>    
    <script src="gerarGrafico.js" type="text/javascript"></script>

</body>
</html>
