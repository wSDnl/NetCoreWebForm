<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Agenda.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Usuarios</h1>

    <asp:ListView ID="listUsuarios" runat="server" DataSourceID="SqlDataSourceUsuarios">



   

        <LayoutTemplate>
          <table cellpadding="2" width="640px" border="1" runat="server" id="tblProducts">
            <tr runat="server">
              <th runat="server">Id</th>
              <th runat="server">Nome</th>
              <th runat="server">Email</th>
            </tr>
            <tr runat="server" id="itemPlaceholder" />
          </table>

        <asp:DataPager runat="server" ID="ContactsDataPager" PageSize="50">
            <Fields>
              <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true"
                FirstPageText="|&lt;&lt; " LastPageText=" &gt;&gt;|"
                NextPageText=" &gt; " PreviousPageText=" &lt; " />
            </Fields>
          </asp:DataPager>

        </LayoutTemplate>


        <ItemTemplate>
          <tr runat="server">
            <td>
              <asp:Label ID="nomeUser" runat="Server" Text='<%#Eval("[NomeUsuario]") %>' />
            </td>
            <td>
              <asp:Label ID="emailUser" runat="Server" Text='<%#Eval("[Email]") %>' />
            </td>
            <td valign="top">
              <asp:Label ID="ativoUser" runat="Server" Text='<%#Eval("[UsuarioAtivo]") %>' />
            </td>
          </tr>
        </ItemTemplate>

        <EditItemTemplate>
          <tr style="background-color: #ADD8E6">
            <td>
              <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />&nbsp;
              <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
            <td>
              <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%#Bind("FirstName") %>' 
                MaxLength="50" /><br />
            </td>
            <td>
              <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%#Bind("LastName") %>' 
                MaxLength="50" /><br />
            </td>
          </tr>
        </EditItemTemplate>

      </asp:ListView>
   


     <asp:SqlDataSource runat="server" ID="SqlDataSourceUsuarios" ConnectionString="<%$ ConnectionStrings:ProdutosDbConnectionString %>" SelectCommand="SELECT [UserId], [NomeUsuario], [Email], [Senha], [UsuarioAtivo] FROM [Users]"></asp:SqlDataSource>



</asp:Content>
