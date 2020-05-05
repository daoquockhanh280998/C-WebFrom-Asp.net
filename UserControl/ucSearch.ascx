<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSearch.ascx.cs" Inherits="ucSearch" %>
<div class="col-md-4 col-10 search">
    <asp:Panel runat="server" DefaultButton="LinkButton_Search"
        class="input-group input-group-sm">
        <input runat="server" id="input_Search"
            type="text"
            class="form-control"
            placeholder="Tìm kiếm..."
            aria-label="Recipient's username"
            aria-describedby="basic-addon2" />
        <div class="input-group-append">
            <asp:LinkButton ID="LinkButton_Search" OnClick="LinkButton_Search_Click" class="btn btn-light" Text="text" runat="server">
                <i class="fa fa-search"></i>
            </asp:LinkButton>
        </div>
    </asp:Panel>
</div>
