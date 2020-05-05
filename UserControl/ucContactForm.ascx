<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucContactForm.ascx.cs" Inherits="ucContactForm" %>
<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="contact-us-form">
            <div class="titleHeader clearfix">
                <h2>Gửi Thư Trực Tuyến</h2>
            </div>
            <div>
                <div class="form-row">
                    <div class="col">
                        <input runat="server" id="input_FullName" type="text"
                            class="form-control"
                            placeholder="Họ tên..." />
                    </div>
                    <div class="col">
                        <input runat="server" id="input_Email" type="text"
                            class="form-control"
                            placeholder="Email..." />
                    </div>
                </div>
                <div class="form-row">
                    <div class="col">
                        <input runat="server" id="input_Mobil"
                            type="text"
                            class="form-control"
                            placeholder="SĐT..." />
                    </div>
                    <div class="col">
                        <input runat="server" id="input_Topic"
                            type="text"
                            class="form-control"
                            placeholder="Chủ đề..." />
                    </div>
                </div>
                <div class="controls">
                    <textarea runat="server" id="textarea_Content"
                        class="col-md-12"
                        placeholder="Nội dung liên hệ..."></textarea>
                </div>
                <div class="controls">
                    <uc1:ucMessage runat="server" ID="ucMessage" />

                    <asp:UpdateProgress runat="server" DynamicLayout="true" DisplayAfter="0" >
                        <ProgressTemplate>
                            <div class="pull-left">
                                <img src="/css/index.svg" alt="Loading...." />
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>

                    <asp:LinkButton ID="LinkButton_Send" OnClick="LinkButton_Send_Click" Text="Gửi thư" runat="server" class="btn btn-success pull-right margin-top10px" />
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
