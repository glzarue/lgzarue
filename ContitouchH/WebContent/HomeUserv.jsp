<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import =  "conn.ConMysqlLocalhost" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
          <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: #FFFFFF;}
        </style>
  <title>Contitouch</title>
  <!-- base:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
  <%@include file = 'sessions.jsp' %>
  
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.ico" />
  
  
  		 <script>
		 function Log_out()
		 {
		     var hi= confirm("Are you sure you want to logout?");
		     if (hi== true){
		         //alert("Ok");
		         window.location.href = 'login.jsp';
		         
		     }else{
		         alert("Cancel");

		        window.location.href = 'HomeUser.jsp';
		     }
		 }
		</script>
		
  
</head>
<body class="sidebar-icon-only">
  <div class="container-scroller">
   			<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-left navbar-brand-wrapper d-flex align-items-center justify-content-between">
          <a class="navbar-brand brand-logo" href="index.html"><img src="images/contitouch-logo-white.png" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/contitouch-logo-white.png" alt="logo"/></a> 
          <button class="navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="mdi mdi-menu"></span>
          </button>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
          <ul class="navbar-nav">
            <li class="nav-item  dropdown d-none align-items-center d-lg-flex d-none">
              <a class="dropdown-toggle btn btn-outline-secondary btn-fw"  href="#" data-toggle="dropdown" id="pagesDropdown">
              <span class="nav-profile-name">Ctrl Links</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="pagesDropdown">
                <a class="dropdown-item" href="HomeAdmin.jsp">
                <i class="mdi mdi-settings text-primary"></i>
                Home
                </a>
                <a class="dropdown-item" onClick="javascript:Log_out()">
                <i class="mdi mdi-logout text-primary"></i>
                Logout
                </a>
              </div>
            </li>
     
           
          </ul>
          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-search d-none d-lg-flex">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="search">
                  <i class="mdi mdi-magnify"></i>
                  </span>
                </div>
                <input type="text" class="form-control" placeholder="Type to search..." aria-label="search" aria-describedby="search">
              </div>
            </li>
           
           
            
            <li class="nav-item nav-settings d-none d-lg-flex">
              <a class="nav-link" href="#">
              <i class="mdi mdi-dots-horizontal"></i>
              </a>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->


 <%@include file = '/Views/nav/navigationu.jsp' %>
      
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12">
            
		<%@include file = '/Views/nav/header.jsp' %>	
		<br><br>

              <div class="tab-content tab-transparent-content pb-0">
                <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                    <div class="row">
                        
                      
                <div class="card-body">
                <div class="alert alert-info" role="alert">
                  <h4 class="card-title">Recently Assigned task</h4>
                  </div>
                  
               <!--    <div class="row grid-margin">
                    <div class="col-12">
                      <div class="alert alert-secondary" role="alert">
                          <strong>Completed Project!</strong> This table shows all completed projects.<br><br> -->
                          
                      
                          
                        <%Connection mysqlConn = null;
						try{
    					mysqlConn = ConMysqlLocalhost.getMySqlConnection();

						Statement stmt = null;
						stmt = mysqlConn.createStatement();
						ResultSet resultset =null;
						String val = "TRUE";
						String val2 = "9";
						String query="select *  from projects where del_indicator != '"+val+"' and status = '"+val2+"' ORDER BY regdate limit 1   ";
						ResultSet rs=stmt.executeQuery(query);
				
						while(rs.next()){  %>
						<div class="row">
						<div class="col-12">
                        <div class="card">
						
						<div class="card-body">
                          <div class="d-flex flex-wrap justify-content-between">
                          	<h4 class="card-title">Task ID-<%=rs.getString("id") %></h4>

                          </div>
						
					
                          <div class="container-fluid">
                          <div class="row ticket-card mt-3 pb-2 border-bottom pb-3 mb-3">
                          
                          
                            
                              <div class="col-md-1">
                                <img class="img-sm rounded-circle mb-4 mb-md-0" src="images/favicon.ico" alt="profile image">
                              </div>
                              <div class="ticket-details col-md-9">
                                <div class="d-md-flex">
                                  <h4 class="text-dark mr-2 no-wrap">Project Name:<%=rs.getString("pname") %></h4>
                                  <h5 class="mr-1 text-primary">[ID # - <%=rs.getString("id") %>]</h5><br>
                                  
                                </div>
                                <p class="font-weight-medium ellipsis">Company Requester: [<%=rs.getString("company") %>]</p>
                                <p class="text-gray font-weight-medium">Project Lead: [<%=rs.getString("leader") %>]</p>
                                <p class="text-gray font-weight-medium">Date Created: [<%=rs.getString("regdate") %>]</p>
                                
                                <p class="text-gray font-weight-medium">Comments:[<%=rs.getString("comments") %>]</p>
                                <div class="row text-muted d-md-flex d-none">
                                  <div class="col-12 d-flex">
                                    <p class=" mdi mdi-alarm-multiple">Estimated Duration:From[<%=rs.getString("project_start")%>]To[<%=rs.getString("project_end")%>]</p>
                                  </div>
                                </div>
                              </div>
                              <div class="ticket-actions col-md-2 text-lg-right pr-md-0">
                                <div class="btn-group dropdown">
                                  <button type="button" class="btn btn-success btn-md d-flex">Action..</button>
                                </div>
                              </div>
                            </div>
                           

                          </div>
                          
                            
                            
                        </div>
                        
                      </div>
                      
                      <br>
                      <%}%>
                      
                      
                         <%rs.close();
			    			stmt.close();
    						mysqlConn.close();
    							}
							catch(Exception e){
    							e.printStackTrace();
    			
									}%>
                      
                      
                      
                    </div>
                  </div>
                </div>
                
                
                
                 
             <div class="card col-12">
                <div class="card-body">
                  <h4 class="card-title">All My TAsks</h4>
                  <p class="card-description">Please click the<code>drop down arrow</code> to view</p>
                  <div class="mt-4">
                    <div class="accordion accordion-multi-colored" id="accordion-6" role="tablist">
                      <div class="card">
                        <div class="card-header" role="tab" id="heading-16">
                          <h6 class="mb-0">
                            <a data-toggle="collapse" href="#collapse-16" aria-expanded="false" aria-controls="collapse-16">
                              My Completed Projects!
                            </a>
                          </h6>
                        </div>
                        <div id="collapse-16" class="collapse show" role="tabpanel" aria-labelledby="heading-16" data-parent="#accordion-6">
                          <div class="card-body">
                            <!-- -------------- -->
                            
                              <div class="card-body">
                  <h4 class="card-title">View All</h4>
               <!--    <div class="row grid-margin">
                    <div class="col-12">
                      <div class="alert alert-secondary" role="alert">
                          <strong>Completed Project!</strong> This table shows all completed projects.<br><br>
                      </div>
                    </div>
                  </div> -->
                  <div class="row">
                    <div class="col-12">
                      <div class="table-responsive">
                      <form name="form1" id="form1" action="/ContitouchH/ProjectActions"  method="post">
                      
                        <table id="order-listing" class="table table-bordered" bgcolor="#FFFFFF">
                          <thead>
                            <tr class="bg-primary text-white">
                                <th>Project #</th>
                                <th>Project Name</th>
                                <th>Company</th>
                                <th>Lead-Developer</th>
                                <th>Project-Start</th>
                                <th>Project-End</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                          </thead>
                          <tbody>
                       <%
						try{
    					mysqlConn = ConMysqlLocalhost.getMySqlConnection();

						Statement stmt = null;
						stmt = mysqlConn.createStatement();
						ResultSet resultset =null;
						String val = "TRUE";
						String val2 = "9";
						String query="select *  from projects where del_indicator != '"+val+"' and status != '"+val2+"'   ";
						ResultSet rs=stmt.executeQuery(query);
				
						while(rs.next()){  %>
                            <tr>
                        	<td><%=rs.getString("id") %></td>
        		  			<td><%=rs.getString("pname") %></td>
            	  			<td><%=rs.getString("company") %></td>
            	  			<td><%=rs.getString("leader") %></td>
            	  			<td><%=rs.getString("project_start") %></td>
            	  			<td><%=rs.getString("project_end") %></td>
                                
                                <td><%=rs.getString("status") %></td>
                                <td class="text-right">
                                  <!-- Hidden field with table id -->
                                  <input type="hidden" name="first" id="first" >
                                  <button class="btn btn-light" name="viewf" id="viewf">
                                  
                         
                                    <i class="mdi mdi-eye text-primary"></i>View
                                  </button>
                                  
                                  <button class="btn btn-light" name="viewf" id="viewf">
                                    
                         
                                    <i class="mdi mdi-pin text-primary"></i>Add job
                                  </button>
                                  
                             
                                </td>
                            </tr>
        
                       <%}%>
                          </tbody>
                        
                          
                          
                        </table>
                        
                        	<%rs.close();
			    			stmt.close();
    						mysqlConn.close();
    							}
							catch(Exception e){
    							e.printStackTrace();
    			
									}%> 
						</form>
                      </div>
                    </div>
                  </div>
                </div>
                            
                            <!-- -------------- -->
                          </div>
                        </div>
                      </div>
                      
                      
                      
                      <!-- ---------------------end card-------------- -->
             
            
                    </div>
                  </div>
                </div>
              </div>  
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
          
              </div>
            </div>
          </div>
        </div> 
        
        
        
        </div>
        </div></div></div>
        
        
        
                <div class="footer-wrapper">
       
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-center text-sm-left d-block d-sm-inline-block">Copyright &copy; 2019. All rights reserved. </span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Designed by: <a href="#" target="_blank">Contitouch</a></span>
            </div>
          </footer>
        </div>
        
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        

        <!-- partial -->
     
    <!-- page-body-wrapper ends -->
  
  <!-- container-scroller -->
  <!-- base:js -->
  
  		   <script>
    
                var table = document.getElementById('order-listing');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("first").value = this.cells[0].innerHTML;
                         document.getElementById("second").value = this.cells[1].innerHTML;
                         document.getElementById("third").value = this.cells[2].innerHTML;
                    };
                }
                
    
    
         </script>
  
  
  
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="vendors/progressbar.js/progressbar.min.js"></script>
  <script src="vendors/flot/jquery.flot.js"></script>
  <script src="vendors/flot/jquery.flot.resize.js"></script>
  <script src="vendors/flot/curvedLines.js"></script>
  <script src="vendors/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/dashboard.js"></script>
  <!-- End custom js for this page-->
  
  
  		
		<script src="vendors/datatables.net/jquery.dataTables.js"></script>
  		<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  		<!-- End plugin js for this page -->
  		<!-- Custom js for this page-->
  		<script src="js/data-table.js"></script>
  
</body>

</html>

