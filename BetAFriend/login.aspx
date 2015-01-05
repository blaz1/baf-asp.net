<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BetAFriend.login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   	<div class="content" id="loginPage">

  		<h1>Login</h1>
  		<form id="loginForm" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
  			<div class="column floatLeft">
                <div class="row">
                    <div class="col1"><label>Username: </label><br></div>
                    <div class="col2">
                        <asp:textbox runat="server" size="20" type="text" id="loginName" name="username"></asp:textbox>
                        <asp:RequiredFieldValidator ID="loginNameRequired"
                            ControlToValidate = "loginName" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter username" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>                
                <div class="row">
                    <div class="col1"><label>Password: </label><br></div>
                    <div class="col2">
                        <asp:textbox runat="server" type="password" size="20" id="loginPwd" name="password"></asp:textbox>
                        <asp:RequiredFieldValidator ID="loginPwdRequired"
                            ControlToValidate = "loginPwd" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter password" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div> 
            <asp:Button runat="server" Text="Login" id="loginButton" OnClick="loginHandler"></asp:Button>                  
            
            <asp:UpdatePanel ID="errLoginUpdatePanel" runat="server">
                <ContentTemplate>
                    <asp:Label ID="errLoginLabel" runat="server" ></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
           </div> 
  		</form>
	</div>
</asp:Content>