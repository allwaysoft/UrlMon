<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Monitoring Application URL</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>
    <body>

        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        %>
        <%
            if (session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
            }
        %>


        <div class="jumbotron">
            <div class="container text-center">
                <h1 style="font-family: 'Varela Round', sans-serif;">Monitoring Url Application</h1>      
            </div>
        </div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="https://github.com/sanjaybabum5/Monitoring_URL">View on Github</a></li>
                        <li><a href="#">Home</a></li>
                        <li><a href="Tablelist.jsp">URL List</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br><br>

        <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-8 text-left"> 

                    <div class="container">    
                        <div class="container h-100">
                            <div class="d-flex justify-content-center h-100">
                                <form action="monitor" method="post">
                                    <div class="form-group">
                                        <h2>Enter your site url below</h2><br>
                                        <input type="text" class="form-control" name="site_name" id="usr" required="required">
                                    </div>
                                    <br><br>
                                    <div class="form-group">        
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary btn-md">Submit</button>
                                            <!--                                                <button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>-->

                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <br>



    </body>
</html>
