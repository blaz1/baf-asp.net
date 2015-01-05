<%@ Page Title="Personal bets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="my-bets.aspx.cs" Inherits="BetAFriend._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="content">
		<h1>Personal bets</h1>
		<table id="searchBetsResult">
			<thead>
				<tr>
					<td class="tableTdMedium">Name</td>
					<td class="tableTdBig">Description</td>
					<td class="tableTdSmall">Status</td>
					<td class="tableTdMedium">Reward</td>
					<td class="tableTdSmall">End date</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="">Pohod na golovec</a></td>
					<td>startamo tkrt pa tkrt iz tm pa tm in pol kdor pride prej gor</td>
					<td>In progress</td>
					<td>en teden počitnic</td>
					<td>17.11.2014</td>
				</tr>
				<tr>	
					<td><a href="">Pohod na golovec</a></td>
					<td>startamo tkrt pa tkrt iz tm pa tm in pol kdor pride prej gor</td>
					<td>In progress</td>
					<td>en teden počitnic</td>
					<td>17.11.2014</td>
				</tr>				
			</tbody>
		</table>
	</div>
</asp:Content>