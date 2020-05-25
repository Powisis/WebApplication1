<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.strony.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idklienta" DataSourceID="SqlDataSource1" AllowSorting="True">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="idklienta" HeaderText="idklienta" ReadOnly="True" SortExpression="idklienta" />
        <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
        <asp:BoundField DataField="nip" HeaderText="nip" SortExpression="nip" />
        <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
        <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
        <asp:BoundField DataField="kod" HeaderText="kod" SortExpression="kod" />
        <asp:BoundField DataField="rabat" HeaderText="rabat" SortExpression="rabat" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:rembudConnectionString %>" DeleteCommand="DELETE FROM [klienci] WHERE [idklienta] = @original_idklienta AND (([nazwa] = @original_nazwa) OR ([nazwa] IS NULL AND @original_nazwa IS NULL)) AND (([nip] = @original_nip) OR ([nip] IS NULL AND @original_nip IS NULL)) AND (([adres] = @original_adres) OR ([adres] IS NULL AND @original_adres IS NULL)) AND (([miasto] = @original_miasto) OR ([miasto] IS NULL AND @original_miasto IS NULL)) AND (([kod] = @original_kod) OR ([kod] IS NULL AND @original_kod IS NULL)) AND (([rabat] = @original_rabat) OR ([rabat] IS NULL AND @original_rabat IS NULL))" InsertCommand="INSERT INTO [klienci] ([idklienta], [nazwa], [nip], [adres], [miasto], [kod], [rabat]) VALUES (@idklienta, @nazwa, @nip, @adres, @miasto, @kod, @rabat)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [klienci]" UpdateCommand="UPDATE [klienci] SET [nazwa] = @nazwa, [nip] = @nip, [adres] = @adres, [miasto] = @miasto, [kod] = @kod, [rabat] = @rabat WHERE [idklienta] = @original_idklienta AND (([nazwa] = @original_nazwa) OR ([nazwa] IS NULL AND @original_nazwa IS NULL)) AND (([nip] = @original_nip) OR ([nip] IS NULL AND @original_nip IS NULL)) AND (([adres] = @original_adres) OR ([adres] IS NULL AND @original_adres IS NULL)) AND (([miasto] = @original_miasto) OR ([miasto] IS NULL AND @original_miasto IS NULL)) AND (([kod] = @original_kod) OR ([kod] IS NULL AND @original_kod IS NULL)) AND (([rabat] = @original_rabat) OR ([rabat] IS NULL AND @original_rabat IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_idklienta" Type="String" />
        <asp:Parameter Name="original_nazwa" Type="String" />
        <asp:Parameter Name="original_nip" Type="String" />
        <asp:Parameter Name="original_adres" Type="String" />
        <asp:Parameter Name="original_miasto" Type="String" />
        <asp:Parameter Name="original_kod" Type="String" />
        <asp:Parameter Name="original_rabat" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="idklienta" Type="String" />
        <asp:Parameter Name="nazwa" Type="String" />
        <asp:Parameter Name="nip" Type="String" />
        <asp:Parameter Name="adres" Type="String" />
        <asp:Parameter Name="miasto" Type="String" />
        <asp:Parameter Name="kod" Type="String" />
        <asp:Parameter Name="rabat" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="nazwa" Type="String" />
        <asp:Parameter Name="nip" Type="String" />
        <asp:Parameter Name="adres" Type="String" />
        <asp:Parameter Name="miasto" Type="String" />
        <asp:Parameter Name="kod" Type="String" />
        <asp:Parameter Name="rabat" Type="Decimal" />
        <asp:Parameter Name="original_idklienta" Type="String" />
        <asp:Parameter Name="original_nazwa" Type="String" />
        <asp:Parameter Name="original_nip" Type="String" />
        <asp:Parameter Name="original_adres" Type="String" />
        <asp:Parameter Name="original_miasto" Type="String" />
        <asp:Parameter Name="original_kod" Type="String" />
        <asp:Parameter Name="original_rabat" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idklienta" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <EditItemTemplate>
            idklienta:
            <asp:Label ID="idklientaLabel1" runat="server" Text='<%# Eval("idklienta") %>' />
            <br />
            nazwa:
            <asp:TextBox ID="nazwaTextBox" runat="server" Text='<%# Bind("nazwa") %>' />
            <br />
            nip:
            <asp:TextBox ID="nipTextBox" runat="server" Text='<%# Bind("nip") %>' />
            <br />
            adres:
            <asp:TextBox ID="adresTextBox" runat="server" Text='<%# Bind("adres") %>' />
            <br />
            miasto:
            <asp:TextBox ID="miastoTextBox" runat="server" Text='<%# Bind("miasto") %>' />
            <br />
            kod:
            <asp:TextBox ID="kodTextBox" runat="server" Text='<%# Bind("kod") %>' />
            <br />
            rabat:
            <asp:TextBox ID="rabatTextBox" runat="server" Text='<%# Bind("rabat") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
        </EditItemTemplate>
        <InsertItemTemplate>
            idklienta:
            <asp:TextBox ID="idklientaTextBox" runat="server" Text='<%# Bind("idklienta") %>' />
            <br />
            nazwa:
            <asp:TextBox ID="nazwaTextBox" runat="server" Text='<%# Bind("nazwa") %>' />
            <br />
            nip:
            <asp:TextBox ID="nipTextBox" runat="server" Text='<%# Bind("nip") %>' />
            <br />
            adres:
            <asp:TextBox ID="adresTextBox" runat="server" Text='<%# Bind("adres") %>' />
            <br />
            miasto:
            <asp:TextBox ID="miastoTextBox" runat="server" Text='<%# Bind("miasto") %>' />
            <br />
            kod:
            <asp:TextBox ID="kodTextBox" runat="server" Text='<%# Bind("kod") %>' />
            <br />
            rabat:
            <asp:TextBox ID="rabatTextBox" runat="server" Text='<%# Bind("rabat") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
        </InsertItemTemplate>
        <ItemTemplate>
            idklienta:
            <asp:Label ID="idklientaLabel" runat="server" Text='<%# Eval("idklienta") %>' />
            <br />
            nazwa:
            <asp:Label ID="nazwaLabel" runat="server" Text='<%# Bind("nazwa") %>' />
            <br />
            nip:
            <asp:Label ID="nipLabel" runat="server" Text='<%# Bind("nip") %>' />
            <br />
            adres:
            <asp:Label ID="adresLabel" runat="server" Text='<%# Bind("adres") %>' />
            <br />
            miasto:
            <asp:Label ID="miastoLabel" runat="server" Text='<%# Bind("miasto") %>' />
            <br />
            kod:
            <asp:Label ID="kodLabel" runat="server" Text='<%# Bind("kod") %>' />
            <br />
            rabat:
            <asp:Label ID="rabatLabel" runat="server" Text='<%# Bind("rabat") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
