<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpServlet"%>"
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbconn.*"%>


<%

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Monitoring Application URL</title>

    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        %>
        <%
            if (session.getAttribute("username") == null) {
                response.sendRedirect("Login.jsp");
            }
        %>

        <div class="jumbotron">
            <div class="container text-center">
                <h1>Monitoring Url Application</h1>      
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
                        <li><a href="AddURL.jsp">Home</a></li>
                        <li><a href="#">URL List</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-xs-6">
                                <h2><b>List of URL's</b></h2>
                            </div>
                            <div class="col-xs-6">
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>URL</th>
                                <th>Status</th>
                                <th>MilliSeconds</th>
                                <th>Seconds</th>
                                <th>Timestamp</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <%
                            HttpSession session1 = request.getSession();
                            String s = String.valueOf(session1.getAttribute("username"));
                            int id = 0;
                            ResultSet rs = null;
                    		try (Connection connection = new DataSourceConnection().getConnection();
                    				PreparedStatement ps = connection
                    						.prepareStatement("Select userid from user where username= ?")) {
                    			ps.setString(1, s);
                                ResultSet result1 = ps.executeQuery();
                                if (result1.next()) {
                                    id = result1.getInt("userid");
                                }
                    		} catch (ClassNotFoundException | SQLException e) {
                    			System.out.println(e);
                            }
                    		try (Connection connection = new DataSourceConnection().getConnection();
                    				PreparedStatement ps = connection
                    						.prepareStatement("select site_name,status,milliseconds,seconds,time from monitor_application where userid=?")) {
                    			ps.setInt(1, id);
                                ResultSet result1 = ps.executeQuery();
                                while (result1.next()) {
                        %>

                        <tbody>
                            <tr>
                                <td><%=result1.getString("site_name")%></td>
                                <td><%=result1.getString("status")%></td>
                                <td><%=result1.getLong("milliseconds")%></td>
                                <td><%=result1.getDouble("seconds")%></td>
                                <td><%=result1.getTimestamp("time")%></td>
                                <td>
                                    <form action="delete" method="post">
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="site_name" value="<%=result1.getString("site_name")%>" placeholder="Username" required="required">		
                                        </div>                                                                    
                                        <div class="form-group">
                                            <button class="btn btn-danger btn-sm rounded-0"  type="submit" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                    		}
                            %> 
                        </tbody>
                    </table>
                    <!--                    <div class="clearfix">
                                            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                            <ul class="pagination">
                                                <li class="page-item disabled"><a href="#">Previous</a></li>
                                                <li class="page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                            </ul>
                                        </div>-->
                </div>
            </div>        
        </div>
        <footer class="container-fluid text-center">
            <p></p>
        </footer>

    </body>
</html>