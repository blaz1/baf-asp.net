<%@ Page Title="Bet details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="bet-details.aspx.cs" Inherits="BetAFriend.bet_details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div id="createBet" class="content">
        <h1><!--?php echo $bet['name'] ?--></h1>
            <div class="column floatLeft">
                <div class="row">
                    <div class="col1"><label>Name: </label><br></div>
                    <div class="col2"><p><asp:Label runat="server" ID="betName"></asp:Label></p></div>
                </div>
                <div class="row desc">
                    <div class="col1"><label>Description: </label><br></div>
                    <div class="col2"><p><asp:Label runat="server" ID="betDesc"></asp:Label></p></div>
                </div>
                <div class="row">
                    <div class="col1"><label>Start time: </label><br></div>
                    <div class="col2"><p><asp:Label runat="server" ID="betStart"></asp:Label></p></div>
                </div>
                <div class="row">
                    <div class="col1"><label>End time: </label><br></div>
                    <div class="col2"><p><asp:Label runat="server" ID="betEnd"></asp:Label></p></div>
                </div>
                <div class="row">
                    <div class="col1"><label>Reward: </label><br></div>
                    <div class="col2"><p><asp:Label runat="server" ID="betReward"></asp:Label></p></div>
                </div>  
            </div> 

            <div class="column floatRight">
                <div class="row">
                    <div class="col1">
                        <label>Opponent(s):</label>
                    </div>
                    <div class="col2">
                        <div id="opponents">

                            <!--<p class="opponent" id="opp1">Janez NOvak<span class="deleteOpp" onclick="deleteOpp('1');">X</span></p>-->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <label>Rules:</label>
                         <div id="rules">
                            <!--<p class="rule" id="rule1">PRvo pravilo<span class="deleteRule" onclick="deleteRule('1');">X</span></p>
                           <p class="rule" id="rule2">drugovo pravilo<span class="deleteRule" onclick="deleteRule('2');">X</span></p>
                           <p class="rule" id="rule3">tretje pravilo<span class="deleteRule" onclick="deleteRule('3');">X</span></p>    -->  

                       </div>                                      
                </div>

            </div>
    </div>
</asp:Content>