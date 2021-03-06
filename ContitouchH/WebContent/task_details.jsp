<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*" import =  "conn.ConMysqlLocalhost"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  <!-- endinject -->
<link rel="shortcut icon" href="images/favicon.ico" />  
  		  
		  <%@include file = 'sessions.jsp' %>
		  
		     		  <%String userName2 =  session.getAttribute("User").toString();%>
		  
		  
		<script>
		 function Log_out()
		 {
		     var hi= confirm("Are you sure you want to logout?");
		     if (hi== true){
		         //alert("Ok");
		         window.location.href = 'logout.jsp';
		         
		     }else{
		         alert("Cancel");

		        window.location.href = 'task_details.jsp';
		     }
		 }
		</script>
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
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
              <span class="nav-profile-name">Pages</span>
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
        
        </div>
      </nav>
       <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
   
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
<%@include file = '/Views/nav/navigation.jsp' %>
          <!-- partial -->
      <div class="main-panel">          
        <div class="content-wrapper">
        
        <%@include file = '/Views/nav/header.jsp' %>
        <br>
        
          <div class="row">
           

            <div class="col-md-12 ">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Task Details </h4>
                  <p class="card-description">details...
                  </p>
                  <div class="row">
                    <div class="col-4">
                      <ul class="nav nav-pills nav-pills-vertical nav-pills-info" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <li class="nav-item">
                          <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                            <i class="mdi mdi-home-outline"></i>
                            Task Description
                          </a>                          
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            <i class="mdi mdi-pencil-box-outline"></i>
                            Edit Task
                          </a>                          
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                            <i class="mdi mdi-email-open-outline"></i>
                            Approve/Decline
                          </a>                          
                        </li>
                      </ul>
                    </div>
                    
                    
                    <%Connection mysqlConn = null;
						try{
    					mysqlConn = ConMysqlLocalhost.getMySqlConnection();

						Statement stmt = null;
						stmt = mysqlConn.createStatement();
						ResultSet resultset =null;
						String val = "TRUE";
						String taskid = session.getAttribute("sss_taskid").toString();

						String query="SELECT * from tasks"
								+ " where task_id = '"+taskid+"' AND del_indicator != '"+val+"'   ";

						ResultSet rs=stmt.executeQuery(query);
				
						while(rs.next()){  %>
                    
                    
                    
                    <div class="col-8">
                      <div class="tab-content tab-content-vertical" id="v-pills-tabContent" >
                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                          <div class="media">
                            <div class="media-body">
                              <h5 class="mt-0">[Task: #<%=rs.getString("task_id") %>, Task Name: <%=rs.getString("tname") %>]</h5>
							  <br>
								<div class="progress progress-lg mt-2">
								<div class="progress-bar bg-info" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">90%</div>
								</div>
								<br>
                              <p>
                                <%=rs.getString("tdesc") %> 
                              </p>
                            </div>
                          </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                        
                        
                          <div class="media">
                            <div class="media-body">
                            <form name="form1" id="form1" action="/ContitouchH/TaskActions"  method="post">
							<h5 class="mt-0">[Task: #<%=rs.getString("task_id") %>, Task Name: <%=rs.getString("tname") %>]</h5>
                              <p>Add or delete tasks items </p>
								
								<div class="form-group">
								<label for="exampleTextarea1">Update..</label>
								<textarea class="form-control" id="tdesc_update" name="tdesc_update"  rows="4"><%=rs.getString("tdesc") %></textarea>
								
								<input type="hidden" name="taskid" id="taskid" value="<%out.print(taskid); %>" >
								</div>
								
								<button class="btn btn-outline-info" id="update_taskdesc" name="update_taskdesc" >
								Update
									<i class="mdi mdi-pencil-box-outline btn-icon-append"></i>
								</button>
								
								
								</form>
                            </div>
                          </div>
                          
                        </div>
                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                          <div class="media">
                             <div class="media-body">
                             <form name="form1" id="form1" action="/ContitouchH/TaskActions"  method="post">
							<h5 class="mt-0">[Task: #<%=rs.getString("task_id") %>, Task Name: <%=rs.getString("tname") %>]</h5>
                              <p>Send notification to user</p>
								
								<div class="form-group">
								<label for="exampleTextarea1">Add..</label>
								<textarea class="form-control" id="msg" name="msg" placeholder="Type something here..." rows="4"></textarea>
								<input type="hidden" name="taskid" id="taskid" value="<%out.print(taskid); %>" >
								</div>
								
								 <button name = "approve_notify" id = "approve_notify" class="btn btn-info btn-icon-text">
									Approve+[Notification]
									<i class="mdi mdi-pencil-box btn-icon-append"></i>                                                                              
								</button>
								
								<button name = "decline_notify" id = "decline_notify" class="btn btn-danger btn-icon-text">
									Decline+[Notification]
									<i class="mdi mdi-close-box btn-icon-append"></i>                                                                              
								</button>
								</form>
                            </div>
                          </div>
                        </div>
                        
                        <%}rs.close();
			    			stmt.close();
    						mysqlConn.close();
    							}
							catch(Exception e){
    							e.printStackTrace();
    			
									}%>
                        
                        
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <div class="footer-wrapper">
            <footer class="footer">
              <div class="d-sm-flex justify-content-center justify-content-sm-between">
                <span class="text-center text-sm-left d-block d-sm-inline-block">Copyright &copy; 2019. All rights reserved. </span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Designed by: <a href="https://www.contitouch.co.zw/" target="_blank">Contitouch</a>. </span>
              </div>
            </footer>
          </div>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <script src="../../../../js/tabs.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
