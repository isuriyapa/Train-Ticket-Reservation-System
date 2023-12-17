<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="AllLayout.*,com.digitalbd.*,java.util.ArrayList,java.util.Iterator,java.util.HashMap" %>
<%

String message = "";
Stations sts = new Stations();
String tempId = null;
String tempTime = "2018-09-05 00:00:00";
if(request.getParameter("createStation") != null){
	sts.name = (String) request.getParameter("name");
	sts.contact = (String) request.getParameter("contact");
	sts.address = (String) request.getParameter("address");
	sts.Save();
}
trains trn = new trains();
ArrayList<Train> trainlist = new ArrayList<Train>();
trainlist = trn.getAll();
Iterator trnIt = trainlist.iterator();


String from = request.getParameter("station_from");
String train_id= request.getParameter("dst_train");
String delId = null;

Destination desti = new Destination();
ArrayList<HashMap<String,String>> allDestinaions = new ArrayList<HashMap<String,String>>();
ArrayList<Station> stationList = sts.getAll();
Iterator stationIterator = stationList.iterator();

if(request.getParameter("delete") != null){
	delId = (String) request.getParameter("delete");
	
}
boolean isSearchBoxNeed = true;
if(request.getParameter("search") != null){
	isSearchBoxNeed = false;
	allDestinaions = desti.getAll(request.getParameter("station_from"),request.getParameter("dst_train"));
}

String up_from = null, up_train_id = null;

boolean isUpdate = true;
if(request.getParameter("updateClick") != null){
	isUpdate = false;
	isSearchBoxNeed = true;
	String destId = request.getParameter("hdnbt");
	up_from = request.getParameter("station_from");
	up_train_id= request.getParameter("dst_train");
	tempId = destId;
	
	
}
Destination tempDst = new Destination();
Station newsts = new Station();
Stations sts1 = new Stations();
trains trn1 = new trains();
newsts = sts1.getStation(from);

%>
    
<%@ include file="header.jsp" %>
<% if(isUpdate){ %>
<div class="signpage">


	<% if(isSearchBoxNeed){ %>
	<form class="register_form" action="<%= Helper.baseUrl %>Destinations.jsp?search=1" method="get">
		
		<div class="row">
			<div class="col-xs-12 col-sm-6 offset-sm-3">
				<div class="rs_form_box">
					<h3 class="form_section_title">
						Information
					</h3>
					<div class="input-group">
						<label>Select Train</label>
						<select style="width:100%;" name="dst_train" class="form-control" style="width:auto;">
							<%
								while(trnIt.hasNext()){
									Train trnTemp = (Train) trnIt.next();
									%>
									<option value="<%= trnTemp.id %>"><%= trnTemp.name+" ("+trnTemp.code+")" %></option>
									<%
								}
							%>
						</select>
					</div>
					
					<div class="input-group">
						<label>Station From</label>
						<select style="width:100%;" name="station_from" class="form-control" style="width:auto;">
							<%
								while(stationIterator.hasNext()){
									Station stsTemp = (Station) stationIterator.next();
									%>
									<option value="<%= stsTemp.id %>"><%= stsTemp.name %></option>
									<%
								}
							%>
						</select>
					</div>

				</div>

			</div>
			<div class="col-xs-12 col-sm-12 text-center">
				<div class="rs_btn_group">
					<button class="btn btn-default pull-left" name="search" value="1" type="submit">Search</button>
				</div>
			</div>
		</div>
	</form>
	<% }else{ %>
		<div class="rs_box" style="overflow:auto;">
			<form class="ticket_selecting_form" method="post" action="AddDestination" name="frm_deslist">

			
				<h2 class="title" style="background: #2a2a2a; color:#fff; padding:15px; border-radius:5px;" > Train Name: <%= trn1.getTrainName(train_id)%> <br>Station From: <%= newsts.name %> </h2>
				<table class="table table_des_seat" id="table_des_list" >
					<tr>
						<th style="background: #373e98; color:#fff;">Station To</th>
						<th style="background: #373e98; color:#fff;">Time</th>
						<th style="background: #373e98; color:#fff;">Unit Fare</th>
						<th style="background: #373e98; color:#fff;">Total Seat</th>
						<th style="background: #373e98; color:#fff;"> Seat Range (10-15)</th>
						<th width="50" style="background: #373e98; color:#fff; text-align:center;">Actions</th>
					</tr>
					<%
					Iterator itrTemp = allDestinaions.iterator();
					Stations tempToFromStation = new Stations();
					while(itrTemp.hasNext()){
						HashMap<String,String> tempDestination = (HashMap<String,String>) itrTemp.next();
						Station tempToStation = tempToFromStation.getStation(tempDestination.get("station_to"));
						%>
						<tr>
							<td>
								<div class="input-group">
									<label><%= tempToStation.name %></label>
								</div>
	
							</td>
							<td>
								<div class="input-group">
									<label><%= tempDestination.get("time") %></label>
								</div>
							</td>
							<td>
								<div class="input-group">
									<label><%= tempDestination.get("fare") %></label>
								</div>
							</td>
							<td>
								<div class="input-group">
									<label><%= tempDestination.get("total_seat") %></label>
								</div>
							</td>
							
							<td align="center">
								<div class="input-group">
									<label><%= tempDestination.get("seat_range") %></label>
								</div>
							</td>
							<td style="text-align:center; width:20%">
								<form style="display:inline;" method="post" action="DeleteDestination">
									<input style="display:inline;" value="<%= tempDestination.get("id") %>" type="hidden" name="hdnbt" />
									<input style="display:inline;" value="<%= from %>" type="hidden" name="station_from" />
									<input style="display:inline;" value="<%= train_id %>" type="hidden" name="dst_train" />
									<button style="display:inline;" class="btn btn-sm btn-danger" type="submit" name="bt" >Delete</button>
								</form>
								<form style="display:inline;" method="post" action="Destinations.jsp">
									<input style="display:inline;" value="<%= tempDestination.get("id") %>" type="hidden" name="hdnbt" />
									<input style="display:inline;" value="<%= from %>" type="hidden" name="station_from" />
									<input style="display:inline;" value="<%= train_id %>" type="hidden" name="dst_train" />
									<button style="display:inline;" class="btn btn-sm btn-success" value="updateClick" type="submit" name="updateClick" >Update</button>
								</form>
							</td>
						</tr>
						<%
					}
					%>
					
					
				</table>
				<div class="alert alert-info"><p>Action Status Updates: ${message}</p></div>
				<div class="text-center">
					<div class="rs_btn_group">
								
						<input style="display:inline;" value="<%= from %>" type="hidden" name="station_from" />
						<input style="display:inline;" value="<%= train_id %>" type="hidden" name="dst_train" />
						<input style="display:inline;" value="<%= delId %>" type="hidden" name="delId" />
						
						<button class="btn btn-success pull-left" name="save_all" type="submit">Save All</button>
						<button id="btn_add_new_item" class="btn btn-info pull-left" name="search" type="button">Add New Item</button>
					</div>
				</div>
			</form>
			
			<table id="data_list_item" style="display:none;">
				
		
					<tr>
									<td>
										<div class="input-group">
											<select name="station_to[]" class="form-control">
												<%
														for(int i =0; i<stationList.size(); i++){
															Station stsTemp = (Station) stationList.get(i);
															%>
															<option value="<%= stsTemp.id %>"><%= stsTemp.name %></option>
															<%
														}
													%>
										</select>
							</div>
					
						</td>
						<td>
							<div class="input-group">
								<input class="form-contoller" name="jurny_time[]">
							</div>
						</td>
						<td>
							<div class="input-group">
								<input class="form-contoller" name="fare[]">
							</div>
						</td>
						<td>
							<div class="input-group">
								<input class="form-contoller" name="total_seat[]">
							</div>
						</td>
						
						<td align="center">
							<div class="input-group">
								<input class="form-contoller" name="seat_range[]">
							</div>
						</td>
						<td><button class="btn btn-danger btn-xs rv_destination" type="button">Delete</button></td>
					</tr>
			</table>
			
		</div>	
	
</div>
	<% }
}else{ %>
<div class="signpage">

	<form class="register_form" action="UpdateDestination" method="post">
		
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-sm-offset-3" style="margin: 0 auto;">
				<div class="rs_form_box">
					<h3 class="form_section_title">
						Destination Information
					</h3>
					<div class="input-group" >
						<label>Journey Time</label>
						<input class="form-contoller" style="width:100%;" name="jurny_time_up">
					</div>
					<div class="input-group">
						<label>Fare</label>
						<input class="form-contoller" style="width:100%;" name="fare_up">
					</div>
					<div class="input-group">
						<label>Total Seat</label>
						<input class="form-contoller" style="width:100%;" name="total_seat_up">
					</div>
					<div class="input-group">
						<label>Seat Range</label>
						<input class="form-contoller" style="width:100%;" name="seat_range_up">
					</div>

				</div>

			</div>
			<div class="col-xs-12 col-sm-12 text-center">
				<div class="rs_btn_group">
					<input style="display:inline;" value="<%= tempId %>" type="hidden" name="upId" />
					<input style="display:inline;" value="<%= up_from %>" type="hidden" name="station_from" />
					<input style="display:inline;" value="<%= up_train_id %>" type="hidden" name="dst_train" />
					<button class="btn btn-default pull-left" name="updateDestination" type="submit">Update Destination</button>
				</div>
			</div>
		</div>
	</form>
</div>

<%} %>
<%@ include file="footer.jsp" %>