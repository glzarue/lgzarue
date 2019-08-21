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
  <link rel="shortcut icon" href="images/favicon1.png" />
  <%@include file = 'sessions.jsp' %>
  
  		 <script>
		 function Log_out()
		 {
		     var hi= confirm("Are you sure you want to logout?");
		     if (hi== true){
		         //alert("Ok");
		         window.location.href = 'login.jsp';
		         
		     }else{
		         alert("Cancel");

		        window.location.href = 'job.jsp';
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
          <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/logo-mini.svg" alt="logo"/></a> 
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
      <!-- partial:../../partials/_settings-panel.html -->
    
        
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
	<%@include file = '/Views/nav/navigation.jsp' %>
          <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        
    <%@include file = '/Views/nav/header.jsp' %>	
      <br><br><br>   						
        
		
		 <div class="row grid-margin">
            <div class="col-md-9">
              <div class="card">
                <div class="card-body" >
                  <h4 class="card-title">Create User</h4><br>
                  <form class="cmxform" id="commentForm" method="post" action="/ContitouchH/CreateUser">
                    <fieldset>
                    
                    
                    
                    <div class="row">
                      <div class="col-md-6">
                      
                      <div class="form-group">
                        <label for="name">Name*</label>
                        <input id="name" class="form-control" name="name" minlength="2" type="text" required>
                      </div>
                      </div>
                      
                      
       			<% Connection mysqlConn = null;
				try{

    			mysqlConn = ConMysqlLocalhost.getMySqlConnection();

				Statement stmt = null;
				stmt = mysqlConn.createStatement();
				ResultSet resultset =null;

				resultset =stmt.executeQuery("select * from roles ") ;
				%>
                                        
                                        
                                        
               <div class="col-md-6">
                                     
                <div class="form-group">
               <label for="role">Role</label>                        
               <select name="role" id="role" class="form-control">
               <option value="001">Choose One</option>
               <% while(resultset.next()){ %>
               <option value="<%= resultset.getString("code")%>"><%= resultset.getString("description")%></option>
				<% }%>
                                            
                                         
               </select>
               <% }

			   catch(Exception e){

			   System.out.println("wrong entry"+e);
               }%>                      </div>
               </div>
               
               </div>
               
               
               <div class="row">
                  <div class="col-md-6">
               
                      <div class="form-group">
                        <label for="email">E-Mail*</label>
                        <input id="email" class="form-control" type="email" name="email" required>
                      </div>
                      </div>
                      
                                        
                 <div class="col-md-6">  
                      <div class="form-group">
                        <label for="title">Title*</label>
                        <input id="title" class="form-control" type="text" name="title" required>
                      </div>
                      </div>
                      
                      </div>
                      
                      <div class="row">
                      
                       <div class="col-md-6">  
                      <div class="form-group">
                        <label for="title">Phone Number*</label>
                        <input id="pnumber" class="form-control" type="text" name="pnumber" placeholder="eg 263776345234" required>
                      </div>
                      </div>
                      
                      
                      </div>
                      
              
                     
                  <div class="row"> 
                  <div class="col-md-6">  
                      <div class="form-group">
                        <label for="password">Password</label>
                        <input id="pass1" class="form-control" type="password" name="pass1">
                      </div>
                      </div>
                      
                  <div class="col-md-6">  
                      <div class="form-group">
                        <label for="password">Confirm Password</label>
                        <input id="pass" class="form-control" type="password" name="pass">
                      </div>
                      </div>  
                      
                      <div class="col-md-6"> 
               			<a href="#"  data-toggle="modal" data-target="#exampleModal-2" class="auth-link text-black">Add more roles</a>
                       </div>
                      
                      </div>
                      
                      <br><br>
                      <input class="btn btn-primary" name="createuser" type="submit" value="Submit">
					  <input class="btn btn-secondary" type="reset" value="Cancel">
                    </fieldset>
                  </form>
                </div>
              </div>
            </div>
            
            
            <div>
										
          

						<div class="card">
								<div class="card-body">
									<h4 class="card-title">User roles</h4>
									<ul class="bullet-line-list">
										<li>
											<h6>Administrator</h6>
											<p>All Admin privileges </p>
											<p class="text-muted mb-4">
												<i class="mdi mdi-account-outline"></i>
												...
											<br><br><br>
												
											</p>
										</li>
										<li>
											<h6>Finance Users</h6>
											<p>Access to all reports </p>
											<p class="text-muted mb-4">
												<i class="mdi mdi-account-outline"></i>
												...
    											<br><br><br>
												
											</p>
										</li>
										<li>
											<h6>General User</h6>
											<p>Records daily activities </p>
											<p class="text-muted">
												<i class="mdi mdi-account-outline"></i>
												...
												<br><br><br>
											</p>
										</li>
									</ul>
								</div>
							</div>
            
            
            
            
           	<br><br><br><br><br><br> 
          </div>
		
		
		    <div class="card">
               <form action="/ContitouchH/CreateUser" method="post">
                  <div class="modal fade" id="exampleModal-2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel-2" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel-2">More Roles</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"></span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <p>Create More Roles...</p>
                        </div>
                  <div class="modal-body">
                    <input type="text"  id="mroles" name="mroles" class="form-control " placeholder="Enter Role">
                  </div>
                  
                  <div class="modal-body">
                    <select id="code" name="code" class="form-control " >
                    <option value="Administrator">Administrator</option>
                    <option value="User">Designer</option>
                    <option value="Finance">Finance Dept</option>
                    <option value="User">Other</option>
                    </select>
                  </div>
                  
                  
                        <div class="modal-footer">
                          <button type="submit" name="createrole" id="createrole" class="btn btn-success">Submit</button>
                          <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  </form>
                  <!-- Modal Ends -->
                </div>
		
	
	
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <div class="footer-wrapper">
            <footer class="footer">
              <div class="d-sm-flex justify-content-center justify-content-sm-between">
                <span class="text-center text-sm-left d-block d-sm-inline-block">Copyright &copy; 2019. All rights reserved. </span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Designed by: <a href="#" target="_blank">Contitouch</a>. </span>
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
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
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
  <!-- End custom js for this page-->
</body>

</html>
