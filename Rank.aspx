<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rank.aspx.cs" Inherits="Rank" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank you for your opinions</title>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
<script src="/jquery/lib/jquery.js"></script>
<script src="/jquery/dist/jquery.validate.js"></script>
<script src="/js/jquery-ui.js"></script>
<script src="js/jquery.ui.touch-punch.min.js"></script>
<link rel="stylesheet" href="style.css" type="text/css"/>
<link rel="stylesheet" href="sort.css" type="text/css"/>
<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css"/>

     <style>
  #feedback { font-size: 1.4em; }
  #selectable .ui-selecting { background: #A3CCE7; }

  .selectable-disabled { background: #A3CCE7; color: black; pointer-events : none;}
 
       
 
  </style>
<script>

    $.validator.setDefaults({
        ignore: []

    });
    $(document).ready(function () {

        $("#form1").validate({
            rules: {

                valid: {
                    required:
                 function (e) {
                     if ($("input[name=valid]").val() == "") {
                         return true;
                     }
                     else {
                         return false;
                     }
                 }
                }
            }

        });


        var good;
        var startValue = [""];
        var selectedItems;

        var gobValid18 = ""
        var valid18 = "<%=validCheck%>";

    if (valid18 == "-1") {
        var valid18String = gobValid18.replace(/^,/, "");
        var splitValid18 = valid18String.split(",");

        for (i = 0; i < splitValid18.length; ++i) {
            $("label[for=q18a_" + splitValid18[i] + "]").text(i + 1);
            $("#rank_" + splitValid18[i] + "").addClass("ranking");
            $("#q18a_" + splitValid18[i] + "").addClass("selectable-disabled").removeClass("ui-selected");

        }
    }


    $(function () {
        $("#selectable").selectable({

            filter: "li:not(.selectable-disabled)",
            selecting: function(event, ui){
                if( $(".ui-selected, .ui-selecting").length > 1){
                    $(ui.selecting).removeClass("ui-selecting");
                }
            },
            stop: function () {
                selectedItems = $(".selectable-disabled", this);
                if (selectedItems.length < 3) {
                    var randomString = "<%=text%>";
                    //var editString = randomString.replace(/^,/, "");
                    var splitString = randomString.split(", ");

                    $(".ui-selected", this).each(function () {
                        var index = $("#selectable li").index(this);
                        startValue.push(splitString[index]);
                        $("label[for=q18a_" + splitString[index] + "]").text(selectedItems.length + 1);
                        $("#rank_" + splitString[index] + "").addClass("ranking");
                        $("input[id=q18a]").val(startValue);
                        $("input[name=q18a]").valid();
                        $(".selector").selectable("disable");
                        return index;

                    }).addClass("selectable-disabled").removeClass("ui-selected");

                }
        if ($(".selectable-disabled").length === 3) {
            good = -1;
            $("input[name=valid]").val(good);
            $("input[name=valid]").valid();
        }

    }

    });
    });




    $("#refresh").click(function () {
        $(".selectable-disabled").removeClass("selectable-disabled");
        $(".ranking").removeClass("ranking");
        startValue = [""];
        $("input[id=q18a]").val(startValue);
        $("label[id*='rank']").text("");
        $("input[name=valid]").val("");
    });



});

$.validator.messages.required = 'Please select three items.';

</script>

</head>
<body>
     <form id="form1" class="cmgform" runat="server">
       <div class="surveyFrame">
    
                        <p class="centered">&nbsp;</p>
                        <p class="centered">The following is a list of attributes you may consider when searching for an automotive dealership. Please click the top three most important attributes to you when selecting which dealership to shop. </p>

    

                          <p class="centered">Please click the most important attribute first and then the second and third attributes in order.&nbsp; </p>
                        <p class="centered"><button type="button" id="refresh"><i class="fa fa-refresh" aria-hidden="true"></i> Restart</button></p>	
                        <ul id="selectable">
                             <%  for (int k = 0; k < shuffledList.Count; k++){
                                    index = shuffledList[k];
                                    items = itemsArray[index];                                
                                   %>
                            <li class="ui-widget-content" id="q18a_<%=index%>"><label for="q18a_<%=index%>" id="rank_<%=index%>"></label><%=items%></li>
                            <%} %>
                        </ul>
                  
                    <p>This text box will not be displayed live.  It is shown to demonstrate how the data will be captured for the database. </p>
          
                        <p class="centered"><label for="q18a" class="error"></label></p>
                        <p class="centered"><label for="valid18" class="error"></label></p>
                        <asp:TextBox runat="server" ID ="q18a" name="q18a" OnTextChanged="q18a_TextChanged"></asp:TextBox>   
                        <asp:TextBox runat="server" ID="valid" style="display:none;" AutoPostBack="true" OnTextChanged="valid_TextChanged"></asp:TextBox>                                        
                        <p class="centered">&nbsp;</p>
                        <p><asp:Button ID="Back" runat="server" Text="Back to Demo Page" OnClick="Back_Click" /></p>
                        <p class="centered">&nbsp;</p>
					

    </div>
    </form>
</body>
</html>
