<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import =  "conn.ConMysqlLocalhost" import="functions.AdminDash" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- <meta http-equiv="refresh" content="60  url=projectdetails.jsp"> -->

        <style>
            table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: #ddd;}
        </style>
		<title>Contitouch</title>
		<!-- base:css -->
		<link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
		<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
		<link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
		<!-- endinject -->
		<!-- plugin css for this page -->
		<!-- End plugin css for this page -->
		<!-- inject:css -->
		<link rel="stylesheet" href="css/vertical-layout-light/style.css">
		<link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
		
		<!-- endinject -->
		<link rel="shortcut icon" href="images/favicon.ico" />
		
		 <%@include file = 'sessions.jsp' %>
		 
		 
		 
		
		 
		
		 <script>
		 function Log_out()
		 {
		     var hi= confirm("Are you sure you want to logout?");
		     if (hi== true){
		         //alert("Ok");
		         window.location.href = 'logout.jsp';
		         
		     }else{
		         alert("Cancel");

		        window.location.href = 'HomeAdmin.jsp';
		     }
		 }
		</script>
		<% String projectselected =  session.getAttribute("projectselected").toString(); %>
		 
<%-- 		  <%
		  AdminDash obj = new AdminDash();
			obj.getAdminDash(request, response);
		  
		  String projectselected =  session.getAttribute("totalcomp").toString();
		  String totalpending =  session.getAttribute("totalpending").toString();
		  String totalopen =  session.getAttribute("totalopen").toString();
		  String totalcompleted =  session.getAttribute("totalcompleted").toString();
		  
		  %>  --%>
		  
		

		

		 
	</head>
	<body>
		<div class="container-scroller">
			<!-- partial:partials/_navbar.html -->
			<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-left navbar-brand-wrapper d-flex align-items-center justify-content-between">
          <a class="navbar-brand brand-logo" href="HomeAdmin.jsp"><img src="images/contitouch-logo-white.png" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href="HomeAdmin.jsp"><img src="images/contitouch-logo-white.png" alt="logo"/></a> 
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
   
        <!-- partial -->
				<!-- partial:partials/_sidebar.html -->
				<%@include file = '/Views/nav/navigation.jsp' %>

				<!-- partial -->
				<div class="main-panel">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-md-12">
							
								<!-- ------header--------- -->
								
							 <%@include file = '/Views/nav/header.jsp' %> 
							 
							 
							 
							 
							 
	<!-- Charts -->						 
							 
								
									<br>
									<!-- chartJS -->		
									<!-- <div class="row">
							      
							            <div class="col-lg-6 grid-margin stretch-card">
							              <div class="card">
							                <div class="card-body">
							                  <h4 class="card-title">Bar chart</h4>
							                  <canvas id="barChart"></canvas>
							                </div>
							              </div>
							            </div>
							            
							            <div class="col-lg-6 grid-margin stretch-card">
							              <div class="card">
							                <div class="card-body">
							                  <h4 class="card-title">Area chart</h4>
							                  <canvas id="areaChart"></canvas>
							                </div>
							              </div>
							            </div>
							            
							            
							          </div> -->
							          
							          
							          <!-- Morris Charts-first   AND Chartjs(bar chart)-second -->
							          
									<div class="row">
									
									
									        
							            <div class="col-lg-6 grid-margin stretch-card">
							              <div class="card">
							                <div class="card-body">
							                  <h4 class="card-title"><% out.print(projectselected); %> - Task Analysis </h4>
							                  <div id="morris-donut-example"></div>
							                </div>
							                <div align="center"><button class="btn btn-outline-success" onclick="window.location.href = 'allprojects.jsp';">More Projects</button></div>
							              </div>
							            </div>
							            
									
									<div class="col-lg-6 grid-margin stretch-card">
							              <div class="card">
							                <div class="card-body">
							                  <h4 class="card-title"><% out.print(projectselected); %> - Tasks per User</h4>
							                  <canvas id="barChart"></canvas>
							                </div>
							              </div>
							            </div>
									
									
							    
							          </div>
							          
					       <!--       <div class="row">
						            <div class="col-lg-6 grid-margin stretch-card">
						              <div class="card">
						                <div class="card-body">
						                  <h4 class="card-title">Line chart</h4>
						                  <div id="morris-line-example"></div>
						                </div>
						              </div>
						            </div>
						           
						           <div class="col-lg-6 grid-margin stretch-card">
							              <div class="card">
							                <div class="card-body">
							                  <h4 class="card-title">Line chart</h4>
							                  <div id="morris-line-example"></div>
							                </div>
							              </div>
							            </div>
						           
						           
						          </div> -->
													          
							         
	<!-- charts end here -->						
								
								
										<br><br>		
		<div class="card">
            <div class="card-body">
              <h4 class="card-title">All Tasks Per Project</h4>
              <div class="row">
                <div class="col-12">
                  <div class="table-responsive">
                  <form name="form1" id="form1" action="/ContitouchH/ProjectActions"  method="post">
                    <table id="order-listing" class="table">
                     
					  <thead>
                        <tr>
                            <th>Task-ID#</th>
                            <th>Task Name</th>
                            <th>AssignedTo</th>
                            <th>Lead</th>
                            <th>AssignedDate</th>
                            <th>DueDate</th>
                            <th>Status</th>
                            <!-- <th>Actions</th> -->
                        </tr>
                      </thead>
                      
                      
                      
                      <tbody>
                      
                      <%Connection mysqlConn = null;
						try{
    					mysqlConn = ConMysqlLocalhost.getMySqlConnection();
    					String projectid = session.getAttribute("theprojectid").toString();

						Statement stmt = null;
						stmt = mysqlConn.createStatement();
						ResultSet resultset =null;
						String val = "TRUE";

						String query="SELECT tasks.todo_status, tasks.task_id, tasks.tname, l.name as leader, a.name assignedto,tasks.assigneddate,tasks.duedate FROM tasks"
								+ " INNER JOIN users l ON tasks.leader=l.email "
								+ " inner join users a on tasks.assignedto = a.email "
								+ " where tasks.del_indicator != '"+val+"' AND tasks.projectid = '"+projectid+"' ";
						
						
						
						
						ResultSet rs=stmt.executeQuery(query);
				
						while(rs.next()){ 
						
							String todo_status = rs.getString("tasks.todo_status");
							int todostatus = Integer.parseInt(todo_status);%>
                        <tr>
                        
                        
                        	<td><%=rs.getString("tasks.task_id") %></td>
        		  			<td><%=rs.getString("tasks.tname") %></td>
            	  			<td><%=rs.getString("assignedto") %></td>
            	  			<td><%=rs.getString("leader") %></td>
            	  			<td><%=rs.getString("tasks.assigneddate") %></td>
            	  			<td><%=rs.getString("tasks.duedate") %></td>
            	  			
            	  			<% if(todostatus == 3 ) { %>
            	  				<td><label class="badge badge-success">Completed</label></td>
            	  			
            	  			<%} else if(todostatus == 1){%>
            	  			<td><label class="badge badge-info">In Progress</label>
            	  			
            	  			
            	  			<%} else if(todostatus == 2){ %>
            	  			<td><label class="badge badge-success">Pending Approval</label>
            	  			<input type="hidden" name="first" id="first" >
            	  			</td>
            	  			
                           <%} else if(todostatus == 0 ){ %>
                            <td><label class="badge badge-warning">Pending Action</label></td>
                           
                           
                           <%} else if(todostatus == 4 ){ %>
                            <td><label class="badge badge-warning">OnHold</label></td>
                          
                           <%} %>
                           
                           
						   
						
                           
                           
                           
                           
                     <!--        <td>
                            
                            
                            
                            	   get table values						
	  							 
       							 <input type="hidden" name="second" id="second">
       							 <input type="hidden" name="third" id="third">
	  							 ----------buttons ------
                              <button class="btn btn-outline-primary" onclick="window.location.href = 'alljobs.jsp';">View</button>
                              <button  class="btn btn-info" name="viewtasks" id="viewtasks">Follow Up</button>

                            
                              
                              
                              
                              
                            </td> -->
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
          </div>
						
						
						
						
						
								

							</div>
						</div>
						

				

						
						
						
						
				</div>		
			
					<!-- content-wrapper ends -->
					
					
					
					

					
					
					
					
					
					
					<!-- partial:partials/_footer.html -->
          <div class="footer-wrapper">
            <footer class="footer">
              <div class="d-sm-flex justify-content-center justify-content-sm-between">
                <span class="text-center text-sm-left d-block d-sm-inline-block">Copyright &copy; 2019. All rights reserved. </span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Designed by: <a href="#" target="_blank">Contitouch</a>. </span>
              </div>
            </footer>
          </div>
          <!-- partial -->
				<!-- main-panel ends -->
				</div>
			<!-- page-body-wrapper ends -->
			</div>
		</div>
		<!-- container-scroller -->
		
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
		
		
		
		<!-- base:js -->
		<script src="vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page-->
		<script src="vendors/progressbar.js/progressbar.min.js"></script>
		<script src="vendors/flot/jquery.flot.js"></script>
		<script src="vendors/flot/jquery.flot.resize.js"></script>
		<script src="vendors/flot/curvedLines.js"></script>
<!-- 		<script src="vendors/chart.js/Chart.min.js"></script>
 -->		<!-- End plugin js for this page-->
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
		
		
  		<script src="https://www.gstatic.com/charts/loader.js"></script>
   		<script src="https://www.gstatic.com/charts/loader.js"></script>
  		<script src="js/google-charts.js"></script>
		
	
		
		<script src="js/data-table.js"></script>
		<script src="vendors/datatables.net/jquery.dataTables.js"></script>
  		<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  		<!-- End plugin js for this page -->
  		<!-- Custom js for this page-->
  		
  		     <!-- endinject -->
  <!-- plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <!-- <script src="js/chart.js"></script> -->   
    <script src="vendors/raphael/raphael.min.js"></script>
  <script src="vendors/morris.js/morris.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <%@include file = 'projectcharts.jsp' %>
  <%@include file = 'projectchartjs.jsp' %>
  <!-- <script src="js/morris.js"></script> -->
  <!-- End custom js for this page-->
  		   
  	
  		
	</body>
</html>







