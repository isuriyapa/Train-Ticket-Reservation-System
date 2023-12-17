<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.digitalbd.*,AllLayout.*" %>
<div class="ticket_print_section">
	<div class="rs_shadow single_ticket" style="background-image: url('images/ticket_bg.jpg');">
		<div class="ticket_header">
			<h2>Sri Lanka Railway Ticket</h2>
		</div>
		<div class="ticket_inner">
			<div class="customer_part">
				<h4>
					<strong>Name of passenger</strong>
					Isuri Yapa <%= request.getAttribute("ticket_id") %>
				</h4>

				<div class="ticket_col_1">
					<table>
						<tr>
							<td>
								<strong>Train Name</strong>
								<span>Ruhunu Kumari</span>
								<strong>From</strong>
								<span>Gampaha</span>
								<strong>To</strong>
								<span>Matara</span>
							</td>
							<td class="wd_100px text_center">
								<strong>Train No</strong>
								1056
							</td>
							<td class="wd_100px text_center">
								<strong>Journey Date</strong>
								15-11-2022
							</td>
							<td class="wd_100px text_center">
								<strong>Time</strong>
								10:5AM
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td>
								<strong>Class/Coach</strong>
								<span>F-Class</span>
							</td>
							<td  class="wd_100px text_center">
								<strong>Seat</strong>
								12, 13
							</td>
							<td  class="text_center">
								<strong>Issue Date & Time</strong>
								15-11-2022 
							</td>
							<td  class="wd_100px text_center">
								<strong>Fare</strong>
								400 Rs
							</td>
							<td width="90"  class="text_center">
								<img class="qr_code" src="images/qr.png" alt="">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- <div class="company_part">
				<h4>
					<strong>Name of passenger</strong>
					Mahinda Rajapaksha
				</h4>
				<strong>Train Name</strong>
				<span>Galle Express</span>
				<strong>Journey</strong>
				<span>Dhaka To Jamalpur</span>
				<table>
					<tr>
						<td>
							<strong>Seat</strong>
							Tista
						</td>
						<td>
							<strong>Date</strong>
							1/25/25
						</td>
						<td>
							<strong>Time</strong>
							70:30AM
						</td>
					</tr>
					<tr>
						<td>
							<strong>Fare</strong>
							150RS
						</td>
						<td>
							<strong>Issue Date</strong>
							1/25/25
						</td>
						
						<td>
						</td>
					</tr>
				</table>
			</div> -->
			<div class="clearfix"></div>
		</div>
		<div class="ticet_footer">
			<span>Have a nice journey.</span>
		</div>
	</div>
</div>