function safe_tags(str) {
    return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

/*START CREATE BET FUNCTIONALITY*/

$(document).ready(function () {
    /*$("#createBetForm").submit(function validateNewBet(e) {
        var start = checkDate('#newFormStart');
        var end = checkDate('#newFormEnd');
        /*if (!$('#newFormName').val()) {
            $('#newFormName').css("background-color","red");
        } else {
            $('#newFormName').css("background-color","white");
        }*/
        //alert($('#newFormName').val());
        /*if ($('#newFormName').val() == "") {
            alert("jasdf");
            toggleBgColor("#newFormName","red");
        } else {
            toggleBgColor("#newFormName", "white");
        }*/
        /*var bool = true;
        bool = checkIfEmpty("#newFormName") && bool;
        bool = checkIfEmpty("#newFormDesc") && bool;
        bool = checkIfEmpty("#newFormReward") && bool;
        bool = checkDate("#newFormStart") && bool;
        bool = checkDate("#newFormEnd") && bool;
        bool = checkRuleAndOpp("#opponents", "#newFormOpp") && bool;
        bool = checkRuleAndOpp("#rules", "#addRule") && bool;

        if (bool) {
            $("#createBetForm").attr("method", "post");
            $("#createBetForm").attr("action", "CreateBetScript.php");
        } else {
            e.preventDefault();
        }
    });*/
});

function checkRuleAndOpp(a, b) {
    var str = a + " p";
    if ($(str).length == 0) {
        $(b).css("background-color", "red");
        //alert("ja");
        return false;
    } else {
        $(b).css("background-color", "white");
    }
    return true;
}

function checkIfEmpty(a) {
    if ($(a).val() == "") {
        //alert("prazen");
        $(a).css("background-color", "red");
        return false;
    } else {
        $(a).css("background-color", "white");
    }
    return true;
}


function addNewRule() {
    var rule = $('#MainContent_addRule').val();
    if (!rule) {
        return false;
    }
    var n = $('.rule').length + 1;
    var ruleId = "rule" + n;
    var ruleName = "newRule" + n;
    //alert(ruleId);
    var func = "deleteRule(" + n + ");";
    var tag = "<p class='rule' id='" + ruleId + "' name='" + ruleName + "'>" + rule + "<span class='deleteRule' onclick='" + func + "'>X</span><input type='hidden' name='" + ruleName + "' value='" + rule + "'></input></p>";
    //alert(tag);
    $('#rules').append(tag);
    $('#addRule').val("");
    checkRuleAndOpp("#rules", "#addRule");
}

function deleteRule(num) {
    var s = "#rule" + num;
    $(s).remove();
    checkRuleAndOpp("#rules", "#addRule");
}

function addOpponent() {
    var opp = $('#MainContent_newFormOpp').val();
    if (!opp) {
        return false;
    }
    var n = $('.opponent').length + 1;
    var oppId = "opp" + n;
    var oppName = "newOpp" + n;
    //alert(oppId);
    var func = "deleteOpp(" + n + ");";
    var tag = "<p class='opponent' id='" + oppId + "'>" + opp + "<span class='deleteOpp' onclick='" + func + "'>X</span><input type='hidden' name='" + oppName + "' value='" + opp + "'></input></p>";
    //alert(tag);
    $('#opponents').append(tag);
    $('#newFormOpp').val("");
    checkRuleAndOpp("#opponents", "#newFormOpp");
}

function deleteOpp(num) {
    var s = "#opp" + num;
    $(s).remove();
    checkRuleAndOpp("#opponents", "#newFormOpp");
}


/*$("#newFormOpp").change(
	function searchOpp () {
		$("button").click(function(){
  		$.get("demo_test.asp",function(data,status){
   	 		alert("Data: " + data + "\nStatus: " + status);
  		});
	});*/
/*
function changeOpp() {
	var opp = $('#newFormOpp').val();
  		$.get("srchOpp.php?username="+opp,function(data,status){
   	 		alert("Data: " + data + "\nStatus: " + status);
   	 	});
}*/

function getRewards() {

    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject("Microsoft.XMLHTTP");  // for older browsers
    }

    // Register the embedded handler function
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var result = xhr.responseText;
            var transfer = JSON.parse(result);
            for (var key in transfer) {
                //alert(transfer[key]);
                var tag = "<div class='rewards'>" + transfer[key] + "</div>";
                $("#rewardRow").append(tag);
            }
            $("#getRewardsButton").attr("onclick", "");
            //alert(result);
            //var place = result.split(', ');
            /*document.getElementById("city").value = place[0];
            document.getElementById("state").value = place[1];*/
        }
    }
    xhr.open("GET", "rewards.php");
    xhr.send(null);
}

/*END CREATE BET FUNCTIONALITY*/

/*START BROWSE BET FUNCTIONALITY*/

function browseBets() {
    var str = $("#searchBets").val();
    if (str == "") {
        $("#searchBets").css("background-color", "red");
        return false;
    }
    $("#searchBets").css("background-color", "white");
    //alert(str);
}

/*END BROWSE BET FUNCTIONALITY*/

/*START EDIT ACCOUNT FUNCTIONALITY*/

function validateUsername(a) {
    var usernameRegex = /^[a-zA-Z0-9\-_]+$/;
    var valid = $(a).val().match(usernameRegex);
    if (valid == null) {
        $(a).css("background-color", "red");
        return false;
    }
    $(a).css("background-color", "white");
    return true;
}

function validateEmail(a) {
    var str = $(a).val();
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var valid = re.test(str);
    if (valid == false) {
        $(a).css("background-color", "red");
        return false;
    }
    $(a).css("background-color", "white");
    return true;

}

function validateEditAcc() {
    var bool = true;
    bool = validateUsername("#editAccName") && bool;
    bool = validateEmail("#editAccMail") && bool;
    if (($("#editAccNewPwd1").val() !== $("#editAccNewPwd2").val()) || $("#editAccNewPwd1").val() == "") {
        $(".editAccPwdError").css("visibility", "visible");
        bool = false;
    } else {
        $(".editAccPwdError").css("visibility", "hidden");
    }
    //alert(bool);
}

function uploadImg() {
    $("#editAccImgUpload").click();
}

/*END EDIT ACCOUNT FUNCTIONALITY*/

/*START REGISTER ACCOUNT FUNCTIONALITY*/

$(document).ready(function () {

    //$("#regForm").bind("submit", validateRegAcc(), false);
    //$("#regForm").submit(validateRegAcc(e));
    $("#regForm").submit(function validateRegAcc(e) {
        var bool = true;
        bool = validateUsername("#regName") && bool;
        bool = validateEmail("#regMail") && bool;
        if (($("#regPwd1").val() !== $("#regPwd2").val()) || $("#regPwd1").val() == "") {
            $(".editAccPwdError").css("visibility", "visible");
            bool = false;
        } else {
            $(".editAccPwdError").css("visibility", "hidden");
        }

        if (bool) {
            $("#regForm").attr("action", "RegisterScript.php");
            $("#regForm").attr("method", "post");
            //$("#regForm").submit();
        } else {
            e.preventDefault();
        }
    });

});

/*END REGISTER ACCOUNT FUNCTIONALITY*/

/*START LOGIN FUNCTIONALITY*/

$(document).ready(function () {
   /* $("#loginForm").submit(function checkLogin(e) {
        var t1 = checkIfEmpty("#loginName");
        var t2 = checkIfEmpty("#loginPwd");

        if (t1 && t2) {
            $("#loginForm").attr("method", "post");
            $("#loginForm").attr("action", "loginScript.php");
        } else {
            e.preventDefault();
        }
        //return false;
        //$("#loginButton").click();
    });*/
});

/*END LOGIN FUNCTIONALITY*/