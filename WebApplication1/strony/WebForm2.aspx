<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.strony.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="DropDownListKlient" runat="server" DataSourceID="SqlDataSource1" DataTextField="nazwa" DataValueField="idklienta">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rembudConnectionString %>" SelectCommand="SELECT [nazwa], [idklienta] FROM [klienci]"></asp:SqlDataSource>
    <asp:Label ID="LabelNrFaktury" runat="server" Text="0"></asp:Label>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button"/>
    <br />
    <br />
    <asp:DropDownList ID="DropDownListTowar" runat="server" DataSourceID="SqlDataSource2" DataTextField="nazwa" DataValueField="idproduktu">
    </asp:DropDownList>
    <asp:TextBox ID="TextBoxIlosc" runat="server"></asp:TextBox>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:rembudConnectionString %>" SelectCommand="SELECT [idproduktu], [nazwa] FROM [produkty]"></asp:SqlDataSource>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
    <asp:GridView ID="GridViewLinies" runat="server" AutoGenerateColumns="False" DataKeyNames="idpoz" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="idpoz" HeaderText="idpoz" InsertVisible="False" ReadOnly="True" SortExpression="idpoz" />
            <asp:BoundField DataField="nrfaktury" HeaderText="nrfaktury" SortExpression="nrfaktury" />
            <asp:BoundField DataField="idproduktu" HeaderText="idproduktu" SortExpression="idproduktu" />
            <asp:BoundField DataField="ilosc" HeaderText="ilosc" SortExpression="ilosc" />
            <asp:BoundField DataField="cena_jednostkowa" HeaderText="cena_jednostkowa" SortExpression="cena_jednostkowa" />
            <asp:BoundField DataField="vat_jednostkowy" HeaderText="vat_jednostkowy" SortExpression="vat_jednostkowy" />
            <asp:BoundField DataField="rabat_jednostkowy" HeaderText="rabat_jednostkowy" SortExpression="rabat_jednostkowy" />
            <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:rembudConnectionString %>" DeleteCommand="DELETE FROM [pozsprzedaz] WHERE [idpoz] = @idpoz" InsertCommand="INSERT INTO [pozsprzedaz] ([nrfaktury], [idproduktu], [ilosc], [cena_jednostkowa], [vat_jednostkowy], [rabat_jednostkowy]) VALUES (@nrfaktury, @idproduktu, @ilosc, @cena_jednostkowa, @vat_jednostkowy, @rabat_jednostkowy)" SelectCommand="SELECT pozsprzedaz.idpoz, pozsprzedaz.nrfaktury, pozsprzedaz.idproduktu, pozsprzedaz.ilosc, pozsprzedaz.cena_jednostkowa, pozsprzedaz.vat_jednostkowy, pozsprzedaz.rabat_jednostkowy, produkty.nazwa FROM pozsprzedaz INNER JOIN produkty ON pozsprzedaz.idproduktu = produkty.idproduktu WHERE (pozsprzedaz.nrfaktury = @nrfaktury)" UpdateCommand="UPDATE [pozsprzedaz] SET [nrfaktury] = @nrfaktury, [idproduktu] = @idproduktu, [ilosc] = @ilosc, [cena_jednostkowa] = @cena_jednostkowa, [vat_jednostkowy] = @vat_jednostkowy, [rabat_jednostkowy] = @rabat_jednostkowy WHERE [idpoz] = @idpoz" OnDeleted="SqlDataSource3_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="idpoz" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nrfaktury" Type="Int32" />
            <asp:Parameter Name="idproduktu" Type="String" />
            <asp:Parameter Name="ilosc" Type="Decimal" />
            <asp:Parameter Name="cena_jednostkowa" Type="Decimal" />
            <asp:Parameter Name="vat_jednostkowy" Type="Decimal" />
            <asp:Parameter Name="rabat_jednostkowy" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="LabelNrFaktury" Name="nrfaktury" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nrfaktury" Type="Int32" />
            <asp:Parameter Name="idproduktu" Type="String" />
            <asp:Parameter Name="ilosc" Type="Decimal" />
            <asp:Parameter Name="cena_jednostkowa" Type="Decimal" />
            <asp:Parameter Name="vat_jednostkowy" Type="Decimal" />
            <asp:Parameter Name="rabat_jednostkowy" Type="Decimal" />
            <asp:Parameter Name="idpoz" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsViewSuma" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="suma faktury" HeaderText="suma faktury" ReadOnly="True" SortExpression="suma faktury" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:rembudConnectionString %>" SelectCommand="SELECT CAST(SUM(((cena_jednostkowa * ilosc) * (1 + vat_jednostkowy)) * (1 - rabat_jednostkowy)) AS DECIMAL(9 , 2)) AS [suma faktury] FROM pozsprzedaz GROUP BY nrfaktury HAVING (nrfaktury = @nrfaktury)">
        <SelectParameters>
            <asp:ControlParameter ControlID="LabelNrFaktury" Name="nrfaktury" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="nrfaktury" DataSourceID="SqlDataSource5">
        <Columns>
            <asp:BoundField DataField="nrfaktury" HeaderText="nrfaktury" InsertVisible="False" ReadOnly="True" SortExpression="nrfaktury" />
            <asp:BoundField DataField="idklienta" HeaderText="idklienta" SortExpression="idklienta" />
            <asp:BoundField DataField="datasp" HeaderText="datasp" SortExpression="datasp" />
            <asp:BoundField DataField="zaplacono" HeaderText="zaplacono" SortExpression="zaplacono" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="TAK" />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="NIE" />
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:rembudConnectionString %>" SelectCommand="SELECT * FROM [nagsprzedaz] WHERE ([nrfaktury] = @nrfaktury)">
        <SelectParameters>
            <asp:ControlParameter ControlID="LabelNrFaktury" Name="nrfaktury" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
