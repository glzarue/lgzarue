<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*" import =  "conn.ConMysqlLocalhost"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Contitouch</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
  <%@include file = 'sessions.jsp' %>

<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#myModal").modal('show');
    });
</script>
</head>
<body>
<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel-2">Clients</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
        				<div class="modal-body">
        				
        				
        				
        				<table id="mytable" class="table">
                     
					  <thead>
                        <tr>
                            <th>ID #</th>
                            <th>Client Name</th>
                            <th>Address</th>
                            <th>Date Created</th>
                            <th>CreatedBy</th>
                         
                        </tr>
                      </thead>
                      
                      
                      
                      <tbody>
                      
                      <%Connection mysqlConn1 = null;
						try{
    					mysqlConn1 = ConMysqlLocalhost.getMySqlConnection();
    					
    					
    					String jid =  session.getAttribute("mycon1").toString();
    					
						Statement stmt = null;
						stmt = mysqlConn1.createStatement();
						ResultSet resultset =null;
						String val = "TRUE";
						//String query="select *  from clients where del_indicator != '"+val+"' and id = '"+jid+"'   ";
						
						String query="select clients.id, clients.name,clients.address,clients.regdate, clients.createdby,users.name"
								+	" from clients INNER JOIN users ON clients.createdby=users.email"
								+	" where clients.del_indicator != '"+val+"' AND clients.id = '"+jid+"'   ";
						
						
						ResultSet rs=stmt.executeQuery(query);
				
						while(rs.next()){  %>
                        <tr>
                        
                        
                        <td><%=rs.getString("clients.id") %></td>
        		  			<td><%=rs.getString("clients.name") %></td>
            	  			<td><%=rs.getString("clients.address") %></td>
            	  			<td><%=rs.getString("clients.regdate") %></td>
            	  			<td><%=rs.getString("users.name") %></td>
            	  			
            	  			
                           
                      
                        </tr>
                   
							<%}%>
                                		</tbody>
          					                                
                			</table>
    						<%rs.close();
			    			stmt.close();
    						mysqlConn1.close();
    							}
							catch(Exception e){
    							e.printStackTrace();
    			
									}%> 
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                        </div>
        </div>
    </div>
</div>
</body>
</html>



