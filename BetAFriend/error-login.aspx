<%@ Page Title="Error login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="error-login.aspx.cs" Inherits="BetAFriend.error_login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  	<div class="content" id="loginPage">

  		<h1>Login</h1>
  					

  		<form id="loginForm" runat="server">
  			<div class="column floatLeft">  			
                <div class="row">
                    <div class="col1"><label>Username: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" size="20" type="text" id="loginName" name="username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="errLoginNameRequired"
                            ControlToValidate = "loginName" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter username" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>                
                <div class="row">
                    <div class="col1"><label>Password: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" type="password" size="20" id="loginPwd" name="password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="errLoginPwdRequired"
                            ControlToValidate = "loginPwd" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter password" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div> 
                <div class="loginRememberMe">
                	<label>Remember Me: </label><input type="checkbox" name="rememberme" value="1">
                </div>

            	<asp:Button runat="server" type="submit" id="loginButton" Text="Login" OnClick="loginHandler"></asp:Button>
            
           </div> 
           <p class="errorLogin">Wrong username or password</p>
  		</form>
	</div>
</asp:Content>