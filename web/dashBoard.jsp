<%-- 
    Document   : dashboard
    Created on : 12/02/2018, 11:01:52
    Author     : t7249320
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="WEB-INF/lib/libs/twitter-bootstrap/css/login.css" rel="stylesheet" type="text/css"/>
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
                    <button type="button" class="btn btn-primary">Gerir apontamentos</button>
                </div>
                <div class="col-sm-12 col-md-8">
                    <div class="panel panel-default">

                        <div class="panel-heading"> <b>Apontamentos diários</b>
                            <button type="button" class="btn btn-primary" data-toggle="modal" 
                                    data-target="#exampleModal"><a href="modalApontamentos.html"></a>
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
        <div class="row">

            <div class="col-sm-12 col-md-4">
                <button type="button" class="btn btn-primary">Relatorios</button>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <label for="recipient-name" class="col-form-label">Nome:</label>
                                    <select class="form-control" id="exampleFormControlSelect1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>

                                </div>

                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Sobrenome:</label>
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

        <script src="../../../Documents/NetBeansProjects/hitsshtml5/public_html/js/libs/jquery/jquery.js" type="text/javascript"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </body>
</html>
