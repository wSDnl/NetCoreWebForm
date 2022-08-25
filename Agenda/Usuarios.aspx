<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Agenda.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Usuarios</h1>

    <asp:ListView 
        ID="listUsuarios" 
        runat="server" 
        DataSourceID="SqlDataSourceUsuarios" 
        OnSelectedIndexChanged="listUsuarios_SelectedIndexChanged">


        <LayoutTemplate>
          <table cellpadding="10" cellspacing="0" width="100%" border="0" runat="server" id="tblProducts">
            <tr runat="server">
              <th runat="server"></th>
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
          <tr runat="server" style="border-bottom:1px solid #ccc; padding:10">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
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
              <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%#Bind("NomeUsuario") %>' 
                MaxLength="100" /><br />
            </td>
            <td>
              <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%#Bind("Email") %>' 
                MaxLength="100" /><br />
            </td>

            <td>
              <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("UsuarioAtivo") %>' 
                MaxLength="50" /><br />
            </td>

          </tr>
        </EditItemTemplate>

      </asp:ListView>
   


    <asp:SqlDataSource 
        runat="server" ID="SqlDataSourceUsuarios" 
        ConnectionString="<%$ ConnectionStrings:ProdutosDbConnectionString %>" 
        SelectCommand="SELECT [UserId], [NomeUsuario], [Email], [UsuarioAtivo] FROM [Users]" 
        DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @Email" 
        UpdateCommand="UPDATE [Users] SET [NomeUsuario] = @NomeUsuario, [Email] = @Email, [UsuarioAtivo] = @UsuarioAtivo WHERE [Email] = @Email">
    
        <DeleteParameters>
            <asp:Parameter Name="Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="NomeUsuario" Type="String" />
            <asp:Parameter Name="UsuarioAtivo" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="NomeUsuario" Type="String" />
            <asp:Parameter Name="UsuarioAtivo" Type="String" />
        </UpdateParameters>
    
    </asp:SqlDataSource>



</asp:Content>
