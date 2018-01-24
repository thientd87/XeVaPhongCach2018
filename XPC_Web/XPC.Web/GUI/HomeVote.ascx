<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeVote.ascx.cs" Inherits="XPC.Web.GUI.HomeVote" %>
<div id="other">
    <div id="top-thuxe" class="cate_vertical_thamdo">
        <h2>
            <a class="tab-news" href="http://xevaphongcach.net/#">Thăm dò ý kiến</a>
        </h2>
        <div class="list-news">
            <p><asp:Literal runat="server" ID="ltrVote"></asp:Literal></p>
               <asp:Repeater runat="server" ID="rptVote">
                <ItemTemplate>
                     <p><input type="radio" name="ans_id" value="<%#Eval("VoteIt_ID") %>"><label><%# Eval("VoteIt_Content")%></label></p>
                </ItemTemplate>
            </asp:Repeater>
              <button name="mysubmit" type="button" id="poll_submit" onclick="BieuQuyet();">Biểu quyết</button>
                <button name="myresult" type="button" id="poll_result"  onclick="ViewResult();">Kết quả</button>
           
        </div>
        <!--end of .list-news-->
    </div>
    <!--end of #top-thuxe-->


</div>
<!--end of #other-->
<script type="text/javascript">
    function BieuQuyet() {
        var VoteID = $("input[name='ans_id']:checked").val();
        if (VoteID != null) {
            window.open("/pages/VoteItem.aspx?vid=" + $("#vid").val() + "&voteid=" + VoteID, "VotePage", "width=550px, height=250px");
        }
        else
            alert("Bạn phải chọn 1  ");
    }
    function ViewResult() {

        window.open("/pages/VoteResult.aspx", "VotePage", "width=500px, height=400px");

    }
</script>
