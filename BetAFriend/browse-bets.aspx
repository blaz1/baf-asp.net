<%@ Page Title="Browse bets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="browse-bets.aspx.cs" Inherits="BetAFriend._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="content">
		<h1>Browse bets</h1>
		<form id="browseBetsForm" action="<?php echo ( $_SERVER ['PHP_SELF']); ?>" method="get">
			<input id="searchBets" type="text" placeholder="Search bets" name="query" onkeydown="if (event.keyCode == 13) browseBets()">
			<input id="searchBetsButton" type="submit" value="Search" onclick="browseBets();">
		</form>

        <form id="form1" runat="server">
	        <div>
		        <asp:GridView ID="BrowseBetsGridView" runat="server" DataSourceID="SqlDataSource" AutoGenerateColumns="false">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="id_bets" DataNavigateUrlFormatString="bet-details.aspx?betid={0}"
                            DataTextField="name" HeaderText="Name" InsertVisible="False" >
                            <itemstyle CssClass="tableTdMedium">
                            </itemstyle>
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="description" HeaderText="Description">
                              <itemstyle CssClass="tableTdBig">
                              </itemstyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="reward" HeaderText="Reward">
                              <itemstyle CssClass="tableTdSmall">
                              </itemstyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="end_time" HeaderText="End date">
                              <itemstyle CssClass="tableTdMedium">
                              </itemstyle>
                        </asp:BoundField>
                    </Columns>
		        </asp:GridView>
		        <asp:SqlDataSource ID="SqlDataSource" runat="server"
                    ProviderName="<%$ ConnectionStrings:mysqlDBConnection.providerName%>"
		            ConnectionString="<%$ ConnectionStrings:mysqlDBConnection %>"
		            SelectCommand="select id_bets, name, description, end_time, reward from bets" />
	        </div>
        </form>
	</div>
</asp:Content>