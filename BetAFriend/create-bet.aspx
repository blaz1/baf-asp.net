<%@ Page Title="Create bet" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="create-bet.aspx.cs" Inherits="BetAFriend.create_bet" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function validateDate(oSrc, args) {
            var date = args.Value;
            var parms = date.split(/[\.\-\/]/);
            var yyyy = parseInt(parms[0], 10);
            var mm = parseInt(parms[1], 10);
            var dd = parseInt(parms[2], 10);
            var date = new Date(yyyy, mm - 1, dd, 0, 0, 0, 0);
            var bool = mm === (date.getMonth() + 1) && dd === date.getDate() && yyyy === date.getFullYear();
            if (!bool) {
                args.IsValid = false;
                return false;
            } else {
            }
            args.IsValid = true;
            return true;
        }
</script>
    <div id="createBet" class="content">
        <h1>Create new bet</h1>
        <form id="createBetForm" runat="server">
                            <asp:ScriptManager ID="ScriptManagerCreateBet" runat="server">
                            </asp:ScriptManager>
            <div class="column floatLeft">
                <div class="row">
                    <div class="col1"><label>Name: </label><br></div>
                    <div class="col2">
                        <asp:textbox size="39" runat="server" placeholder="Name" id="newFormName" name="betName" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            ControlToValidate = "newFormName" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter bet name" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row desc">
                    <div class="col1"><label>Description: </label><br></div>
                    <div class="col2">
                        <asp:textbox rows="5" TextMode="MultiLine" CausesValidation="true" runat="server" placeholder="Enter description" id="newFormDesc" name="betDesc"></asp:textbox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            ControlToValidate = "newFormDesc" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter bet description" ForeColor="Red">*</asp:RequiredFieldValidator>
                       
                    </div>
                </div>
                <div class="row">
                    <div class="col1"><label>Start time: </label><br></div>
                    <div class="col2">
                        <asp:textbox runat="server" type="date" size="39" placeholder="yyyy-mm-dd" id="newFormStart" name="betStart" />
                        <!--<asp:RegularExpressionValidator ID="RegexpValidator1" runat="server" ControlToValidate="newFormStart" ErrorMessage="Wrong date format" ForeColor="Red" ValidationExpression="\d{4}-\d{2}-\d{2}">*</asp:RegularExpressionValidator>-->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            ControlToValidate = "newFormStart" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter bet start date" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator runat="server" ID="startDateValidator" ControlToValidate="newFormStart" ClientValidationFunction="validateDate" ErrorMessage="Wrong date format!" />
                    </div>
                </div>
                <div class="row">
                    <div class="col1"><label>End time: </label><br></div>
                    <div class="col2">
                        <asp:textbox runat="server" CausesValidation="true" type="date" size="39" placeholder="yyyy-mm-dd" id="newFormEnd" name="betEnd" />
                        <!--<asp:RegularExpressionValidator ID="RegexpValidator2" runat="server" ControlToValidate="newFormEnd" ErrorMessage="Wrong date format" ForeColor="Red" ValidationExpression="\d{4}-\d{2}-\d{2}">*</asp:RegularExpressionValidator>-->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            ControlToValidate = "newFormEnd" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter bet end date" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator runat="server" ID="endDateValidator" ControlToValidate="newFormEnd" ClientValidationFunction="validateDate" ErrorMessage="Wrong date format!" />
                    </div>
                </div>
                <div class="row" id="rewardRow">
                    <div class="col1"><label>Reward: </label><br></div>
                    <div class="col2">
                        <asp:textbox runat="server" size="39" placeholder="Reward" id="newFormReward" name="betReward" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            ControlToValidate = "newFormReward" Display = "Static" runat = "server"
                            ErrorMessage = "Please enter bet reward" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                     <asp:Button runat="server" id="getRewardsButton" Text="Get rewards" OnClick="getRewards" CausesValidation="false"></asp:Button>
                            <asp:UpdatePanel ID="RewardUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <!--<asp:Label runat="server" ID="reward1"></asp:Label>
                                    <asp:Label runat="server" ID="Label1"></asp:Label>
                                    <asp:Label runat="server" ID="Label2"></asp:Label>
                                    <asp:Label runat="server" ID="Label3"></asp:Label>
                                    <asp:Label runat="server" ID="Label4"></asp:Label>-->
                                </ContentTemplate>
                            </asp:UpdatePanel>
                </div>  
            </div> 

            <div class="column floatRight">
                <div class="row">
                    <div class="col1">
                        <label>Opponent(s):</label>
                    </div>
                    <div class="col2">
                        <asp:textbox runat="server" class="opponentInput" id="newFormOpp" placeholder="Add opponent" onkeydown="if (event.keyCode == 13) addOpponent()" onblur='checkRuleAndOpp("#opponents", "#newFormOpp");' />
                        <button class="addButton" type="button" value="Add" onclick="addOpponent();">Add</button>
                        <div id="opponents">
                            <!--<p class="opponent" id="opp1">Janez NOvak<span class="deleteOpp" onclick="deleteOpp('1');">X</span></p>-->
                        </div>
                    </div>
                </div>
                <div class="row">
                        <asp:textbox runat="server" id="addRule" placeholder="Add rule"/>
                        <asp:Button runat="server" class="addRuleButton" id="newFormRuleButton" Text="Add" CausesValidation="false" OnClick="addNewRule"></asp:Button>
                        <div id="rules">
                            <asp:UpdatePanel ID="addRuleUpdatePanel" runat="server">
                                <ContentTemplate>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                       </div>                                      
                </div>

            </div>     
            <asp:Button runat="server" type="submit" id="createBetButton" Text="Create" OnClick="createBetHandler"></asp:Button>           
        </form>
    </div>
</asp:Content>