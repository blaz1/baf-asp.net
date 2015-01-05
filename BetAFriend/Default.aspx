<%@ Page Title="Bet A Friend" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BetAFriend._Default" %>





<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="content">
		<h1>Welcome to BetAFriend application</h1>
		<p id="mainPageDesc">BetAFriend application allows users to create new bets and challenge your friends or simply browse through the many of already created bets. </p>

		<div id="mainPageLinks">
            <asp:Label runat="server" ID="mainPageLinksToggle"></asp:Label>
		</div>

		<div id="mainPageStats">
			<div class="column floatLeft">
				<h2>Latest bets</h2>
				<!--?php

				$sql = "SELECT * FROM artac_blaz_b1.bets ORDER BY create_time DESC LIMIT 5";
				$result = $conn->query($sql);
				while ($row = $result->fetch_assoc()) {
					echo "<div class='betSummary'>";
					echo "<h3>".$row["name"]."</h3>";
					$owner_id = $row["owner_id"];
					$sql2 = "SELECT username FROM artac_blaz_b1.user WHERE id_user='$owner_id'";
					$owner = $conn->query($sql2)->fetch_assoc();
					echo "<p class='username'>".$owner["username"]."</p>";
					echo "<p>".$row["description"]."</p>";
					echo "</div>";
				}

				?-->
			</div>
			<div class="column floatRight">
				<h2>Most popular</h2>
				<div class="betSummary">
					<h3>
						Karaoke
					</h3>
					<p class="username">janez_novak12</p>					
					<p>
						BetAFriend application allows users to create new bets and challenge your friends or simply browse through the many of already created bets. 
					</p>
				</div>				
			</div>
		</div>
	</div>

</asp:Content>
