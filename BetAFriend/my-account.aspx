<%@ Page Title="Account details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="my-account.aspx.cs" Inherits="BetAFriend._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="content" id="editAcc">
		<h1>Edit account</h1>
		<img src="images/profile.jpg" class="userImg"  height="180" width="189" alt="userImage"/>

		<form runat="server">
   			<div class="column floatLeft">
                <div class="row">
                    <div class="col1"><label>Username: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" size="39" value="ba3611" type="text" id="editAccName"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="editAccUsernameValidator"
                            ControlToValidate = "editAccName" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter username" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col1"><label>E-mail: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" type="email" size="39" value="nekaj@gmail.com" id="editAccMail"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="editAccEmailValidator" runat="server" 
                             ControlToValidate="editAccMail" ErrorMessage="Wrong email address" ForeColor="Red" 
                             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>

                    </div>
                </div>
                <div class="row">
                    <div class="col1"><label>Old password: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" type="password" value="nekaj123" size="39" id="editAccOldPwd"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="editAccOldPwdValidator"
                            ControlToValidate = "editAccOldPwd" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter username" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>   
                <div class="row">
                    <div class="col1"><label>New password: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" type="password" value="nekaj123" size="39" id="editAccNewPwd1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="editAccNewPwd1Validator"
                            ControlToValidate = "editAccNewPwd1" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter new password" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>  
                <div class="row">
                    <div class="col1"><label>Repeat password: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" type="password" value="nekaj123" size="39" id="editAccNewPwd2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="editAccNewPwd2Validator"
                            ControlToValidate = "editAccNewPwd2" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter new password" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            <asp:Button runat="server" type="button" id="editAccButton" Text="Update"></asp:Button>                  
            </div> 
		</form>		
	</div>
</asp:Content>