<%-- 
    Document   : index
    Created on : Feb 6, 2018, 8:54:37 PM
    Author     : fael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
           <!-- Latest compiled and minified CSS -->       
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
        <link href="WEB-INF/lib/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="WEB-INF/lib/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="navbar navbar-default" >
            <img  id="logo_login" src="http://wp.globalhitss.com/wp-content/uploads/2015/09/Logo_02.png">

        </div>
        <div class="container">
            <div class="row" ng-view></div>
        </div>



        <div class="container">

            <div class="row" id="label_login">

                <div class="col-sm-12 col-md-12">
                    <h1>Diário de bordo </h1>
                </div>

            </div>

            <div class="row" id="form_login">
                <div class="col-md-6">
                    <form  action="loginServlet" method="POST">

                        <div class="form-group" >
                            <label >Login</label>
                            <input ntype="text" name="login" class="form-control" id="user" placeholder="Ex: T12345">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="senha" class="form-control"  placeholder="Password">
                        </div>

                        <button type="submit" class="btn btn-success" id="teste" value="">Logar </button>

                    </form> 
                </div>

            </div>

        </div>

        <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>
        <script src="WEB-INF/lib/js/bootstrap.js" type="text/javascript"></script>
        <script src="WEB-INF/lib/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
