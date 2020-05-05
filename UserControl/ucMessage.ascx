<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMessage.ascx.cs" Inherits="ucMessage" %>

<div runat="server" id="div_Error" class="alert alert-danger no-margin">
    <button type="button" class="close" data-dismiss="alert"> &times; </button>
    <span runat="server" id="span_Error">Error</span>
</div>
<div runat="server" id="div_Success" class="alert alert-success no-margin">
    <button type="button" class="close" data-dismiss="alert"> &times; </button>
    <span runat="server" id="span_Success">Success</span>
</div>
<div runat="server" id="div_info" class="alert alert-info inline-msg">
    <button type="button" class="close" data-dismiss="alert"> &times; </button>
    <span runat="server" id="span_info">Info</span>
</div>
