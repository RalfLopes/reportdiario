<%-- 
    Document   : dashboard
    Created on : 12/02/2018, 11:01:52
    Author     : t7249320
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="WEB-INF/lib/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <title>Dash Board Hitss</title>

    </head>
    <body>
        <div class="row"> 

            <div class="navbar navbar-default" >
                <div class="col-md-5">

                    <img  id="logo_pages" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png">


                </div>
            </div>
        </div>
        <div class="container-fluid" id="rel"> 

            <div class="row">

                <div class="col-sm-12 col-md-2">
                    <button type="button" id="myModal" class="btn btn-primary">Gerir apontamentos</button>
                </div>
                <div class="col-sm-12 col-md-8">
                    <div class="panel panel-default">

                        <div class="panel-heading"> <b>Apontamentos diários</b>
                            <button id="button"type="button" onclick="" class="btn btn-primary" data-toggle="modal" 
                                    data-target="#apontamento" ></a>
                                <span class="glyphicon glyphicon-plus"></span></button>
                        </div>
                        <!-- Table -->
                        <table class="table" id="tbFunc">
                            <tr> 
                                <th>Nome</th>
                                <th>Sobrenome</th>
                                <th>Torre</th>
                                <th>Horário oficial</th>
                                <th>Entrada</th>
                            </tr>

                        </table>
                    </div>

                </div>
            </div>
        </div>
        <div class="container-fluid" id="rel"> 
            <div class="row">


                <div class="modal fade" id="apontamento" tabindex="-1" role="dialog" aria-labelledby="apontamentoLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Torre:</label>
                                        <select class="form-control" id="exampleFormControlSelect1">
                                            <option>Claro Movel</option>
                                            <option>Micro-informatica</option>
                                            <option>Monitoria</option>
                                            <option>PDA Telecom</option>
                                            <option>Portabilidade</option>
                                            <option>Sistemas</option>
                                            <option>Web</option>
                                        </select>

                                    </div>

                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Nome</label>
                                        <input type="text" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Horário:</label>
                                        <input type="text" class="form-control" id="name">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" id="btnApont" class="btn btn-primary">Salvar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 col-md-2">

                    <button id="button"type="button" onclick="" class="btn btn-primary" data-toggle="modal" 
                            data-target="#incidentes" >Criar Incidentes</button>
                </div>

                <div class="col-sm-12 col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-heading"> <b>Incidentes em aberto</b>
                            <button id="button"type="button" onclick="" class="btn btn-primary" data-toggle="modal" 
                                    data-target="#apontamento" ></a>
                                <span class="glyphicon glyphicon-plus"></span></button>
                        </div>

                        <!-- Table -->

                        <table class="table" id="tbFunc">
                            <tr> 
                                <th>Nome</th>
                                <th>Sobrenome</th>
                                <th>Torre</th>
                                <th>Horário oficial</th>
                                <th>Entrada</th>
                            </tr>

                        </table>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="incidentes" tabindex="-1" role="dialog" aria-labelledby="incidentesLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="exampleModalLabel">Inserção de incidentes</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form  action="incidentesServlts" method="POST">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Tipo de Ocorrência:</label>
                                    <select class="form-control" id="exampleFormControlSelect1" name="ocorrencia">
                                        <option>Indisponibilidade</option>
                                        <option>lentidão</option>
                                        <option>Instabilidade</option>
                                    </select>

                                </div>

                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Sistema</label>
                                    <input type="text" class="form-control" name="sistema">
                                </div>
                                <div class="form-group">    
                                    <label for="recipient-name" class="col-form-label">Horário:</label>
                                    <input type="text" class="form-control" name="hora">
                                </div>
                                <label for="comment">Obersvações:</label>
                                <textarea class="form-control" rows="5" name="obs"></textarea>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" id="insertIncident"  class="btn btn-primary">Salvar</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
            </div>

        </div>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="validarLogin.js" type="text/javascript"></script>        
    </body>
</html>
