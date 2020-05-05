<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucArticleNews.ascx.cs" Inherits="ucArticleNews" %>

<div class="news-right">
    <div class="news-right-title">
        <span>Tin Tức Sen Đá</span>
    </div>
    <asp:Repeater ID="Repeater_Main" runat="server">
        <ItemTemplate>
            <div class="news-right-content" data-aos="fade-left">
                <img src='<%# Eval("Avatar") %>' alt="" />
                <div class="cap">
                    <h4>
                        <a href='<%# Eval("ArticleID","/ArticleDetail.aspx?id={0}") %>'>
                            <%# Eval("Title") %>
                        </a>
                    </h4>
                    <div class="body-content">
                        <div>
                            <i class="fa fa-calendar"></i>
                            <time pubdate datetime="2019-09-22"><%# Eval("CreateTime","{0:dd/MM/yyyy}") %></time>
                        </div>
                        <div>
                            <i class="fa fa-file-text-o"></i>
                            <a href="#">Hướng dẫn chăm sóc sen đá</a>
                        </div>
                    </div>
                    <a href='<%# Eval("ArticleID","/ArticleDetail.aspx?id={0}") %>' class="btn">Xem Chi Tiết</a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
