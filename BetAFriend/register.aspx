<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="BetAFriend.register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <div class="content" id="editAcc">
    <h1>Create account</h1>

    <form id="regForm" runat="server">
        <div class="column floatLeft">
                <div class="row">
                    <div class="col1"><label>Username: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server" size="39" type="text" id="regName" name="username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="registerUsernameValidator"
                            ControlToValidate = "regName" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter username" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col1"><label>E-mail: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server"  type="email" size="39" id="regMail" name="email"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="registerMailValidator" runat="server" 
                             ControlToValidate="regMail" ErrorMessage="Wrong email address" ForeColor="Red" 
                             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col1"><label>Password: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server"  type="password" size="39" id="regPwd1" name="password1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="registerPwd1Validator"
                            ControlToValidate = "regPwd1" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter password" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator runat="server" ID="pwd1MatchingValidator" ControlToValidate="regPwd1" OnServerValidate="validatePasswordMatching" ErrorMessage="Passwords aren't matching!" />
                    </div>
                </div>  
                <div class="row">
                    <div class="col1"><label>Repeat password: </label><br></div>
                    <div class="col2">
                        <asp:TextBox runat="server"  type="password" size="39" id="regPwd2" name="password2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="registerPwd2Validator"
                            ControlToValidate = "regPwd2" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter password" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <!--<asp:CustomValidator runat="server" ID="pwd2MatchingValidator" ControlToValidate="regPwd2" OnServerValidate="validatePasswordMatching" ErrorMessage="Wrong date format!" />-->
                    </div>
                </div>
            <asp:Button runat="server" type="submit" id="regAccButton" Text="Register" OnClick="registerHandler"></asp:Button>
            </div> 
    </form>   
  </div>
</asp:Content>