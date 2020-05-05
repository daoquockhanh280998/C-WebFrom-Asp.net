<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleDetail.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucPagging.ascx" TagPrefix="uc1" TagName="ucPagging" %>
<%@ Register Src="~/UserControl/ucCarousel.ascx" TagPrefix="uc1" TagName="ucCarousel" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Chi Tiết Tin Tức</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="care-detail">
            <div class="container">
                <asp:Repeater ID="Repeater_Main" runat="server">
                    <ItemTemplate>

                        <h2><%# Eval("Title") %></h2>
                        <div class="row">
                            <%# Eval("Content") %>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </main>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="Server">
    <script src="../js/jquery-3.0.0.js"></script>
    <script src="../js/jquery.smartmenus.js"></script>
    <script src="../js/jquery.smartmenus.bootstrap-4.js"></script>
    <link href="css/swiper.min.css" rel="stylesheet" />
    <script src="popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/Script.js"></script>
</asp:Content>

