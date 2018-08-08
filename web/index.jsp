<%-- 
    Document   : index
    Created on : Feb 6, 2018, 8:54:37 PM
    Author     : fael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="navbar navbar-inverse" >
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <img id="logo" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png">
            </div>
            <div class="col-md-4"> </div>
        </div>
        <div class="container">
            <div class="row" ng-view></div>
        </div>



        <div class="container">

            <div class="row" id="label_login">
                <div class="col-md-3"></div>
                <div class="col-sm-12 col-md-7">
                    <h3> Diário de Bordo - Service Desk <span>Claro</span> Brasil </h3>
                </div>
                <div class="col-md-3"></div>
            </div>

            <div class="row" id="form_login">
                <div class="col-md-3"></div>
                <div class="col-md-5" id="log">
                    <form  action="loginServlet" method="POST">

                        <div class="form-group" >
                            <label >Login</label>
                            <input type="text" name="login" class="form-control" id="user" placeholder="Ex: T12345">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="senha" class="form-control"  placeholder="Password">
                        </div>

                        <button type="submit" class="btn btn-success" id="teste" >Logar </button>

                    </form> 

                   
                </div>
                <div class="col-md-4"></div>
            </div>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </body>
</html>
