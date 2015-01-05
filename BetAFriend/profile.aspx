<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="BetAFriend._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="content">
		<h1>Profile of ba3611</h1>
		<img src="images/profile.jpg" class="userImg"  height="180" width="189" />
		<table id="profileTable">
			<tr>
				<td class="tableTdProfile">
					Username:
				</td>
				<td>
					ba3611
				</td>
			</tr>
			<tr>
				<td class="tableTdProfile">
					Created:
				</td>
				<td>
					15.2.2014
				</td>
			</tr>
			<tr>
				<td class="tableTdProfile">
					Last seen:
				</td>
				<td>
					10.11.2014
				</td>
			</tr>		
		</table>
		<table id="profileLastBets">
			<tr>
				<td class="tableTdProfile">
					Total number of bets:
				</td>
				<td>
					22
				</td>
			</tr>
			<tr>
				<td class="tableTdProfile">
					Win/Defeat:
				</td>
				<td>
					10/12
				</td>
			</tr>			
			<tr>
				<td class="tableTdProfile">
					Active:
				</td>
				<td>
					2
				</td>
			</tr>
			<tr>
				<td class="tableTdProfile">
					Pending:
				</td>
				<td>
					10
				</td>
			</tr>
			<tr>
				<td class="tableTdProfile">
					Finished:
				</td>
				<td>
					10
				</td>				
			</tr>		
		</table>
	</div>
</asp:Content>