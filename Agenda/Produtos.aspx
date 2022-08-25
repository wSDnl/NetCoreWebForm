<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="Agenda.Produtos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Produtos</h1>


    <asp:ListView 
        ID="listProdutos" 
        runat="server" 
        DataSourceID="SqlDataSourceProdutos" 
        DataKeyNames="ProdutoId" >

        
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

                </td>
              <td>
              <asp:Label ID="nomeUser" runat="Server" Text='<%#Eval("[Nome]") %>' />
            </td>
            <td>
              <asp:Label ID="emailUser" runat="Server" Text='<%#Eval("[DescricaoCurta]") %>' />
            </td>
            <td valign="top">
              <asp:Label ID="ativoUser" runat="Server" Text='<%#Eval("[DescricaoDetalhada]") %>' />
            </td>
          </tr>
        </ItemTemplate>

    </asp:ListView>
    <asp:SqlDataSource 
        runat="server" 
        ID="SqlDataSourceProdutos" 
        ConnectionString="<%$ ConnectionStrings:ProdutosDbConnectionString %>" 
        DeleteCommand="DELETE FROM [Produto] WHERE [ProdutoId] = @ProdutoId" 
        SelectCommand="SELECT [ProdutoId], [Nome], [DescricaoCurta], [DescricaoDetalhada], [Valor], [ImagemUrl], [ImagemMini], [Disponivel], [CategoriasCategoriaId], [CategoriaId], [QtdeEstoque] FROM [Produto]" 
        UpdateCommand="UPDATE [Produto] SET [Nome] = @Nome, [DescricaoCurta] = @DescricaoCurta, [DescricaoDetalhada] = @DescricaoDetalhada, [Valor] = @Valor, [ImagemUrl] = @ImagemUrl, [ImagemMini] = @ImagemMini, [Disponivel] = @Disponivel, [CategoriasCategoriaId] = @CategoriasCategoriaId, [CategoriaId] = @CategoriaId, [QtdeEstoque] = @QtdeEstoque WHERE [ProdutoId] = @ProdutoId">
    </asp:SqlDataSource>


</asp:Content>
