<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.strona.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Customer" DataValueField="CustomerID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT CustomerID, COALESCE (FirstName + ' ' + MiddleName, LastName) + '  ' + LastName AS Customer FROM SalesLT.Customer"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Suffix" HeaderText="Suffix" SortExpression="Suffix" />
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT CustomerID, Title, FirstName, MiddleName, LastName, Suffix, CompanyName, EmailAddress, Phone FROM SalesLT.Customer WHERE (CustomerID = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="AddressLine1" HeaderText="AddressLine1" SortExpression="AddressLine1" />
            <asp:BoundField DataField="AddressLine2" HeaderText="AddressLine2" SortExpression="AddressLine2" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="StateProvince" HeaderText="StateProvince" SortExpression="StateProvince" />
            <asp:BoundField DataField="CountryRegion" HeaderText="CountryRegion" SortExpression="CountryRegion" />
            <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT SalesLT.Address.AddressLine1, SalesLT.Address.AddressLine2, SalesLT.Address.City, SalesLT.Address.StateProvince, SalesLT.Address.CountryRegion, SalesLT.Address.PostalCode, SalesLT.CustomerAddress.CustomerID FROM SalesLT.Address INNER JOIN SalesLT.CustomerAddress ON SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID WHERE (SalesLT.CustomerAddress.CustomerID = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="SalesOrderID" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="ShipMethod" HeaderText="ShipMethod" SortExpression="ShipMethod" />
            <asp:BoundField DataField="TotalDue" HeaderText="TotalDue" ReadOnly="True" SortExpression="TotalDue" />
            <asp:BoundField DataField="TaxAmt" HeaderText="TaxAmt" SortExpression="TaxAmt" />
            <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" />
            <asp:BoundField DataField="Freight" HeaderText="Freight" SortExpression="Freight" />
            <asp:BoundField DataField="SalesOrderID" HeaderText="SalesOrderID" InsertVisible="False" ReadOnly="True" SortExpression="SalesOrderID" />
        </Columns>
    </asp:GridView>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="SalesOrderID,SalesOrderDetailID" DataSourceID="SqlDataSource5">
        <Columns>
            <asp:BoundField DataField="SalesOrderID" HeaderText="SalesOrderID" ReadOnly="True" SortExpression="SalesOrderID" />
            <asp:BoundField DataField="SalesOrderDetailID" HeaderText="SalesOrderDetailID" InsertVisible="False" ReadOnly="True" SortExpression="SalesOrderDetailID" />
            <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="UnitPriceDiscount" HeaderText="UnitPriceDiscount" SortExpression="UnitPriceDiscount" />
            <asp:BoundField DataField="LineTotal" HeaderText="LineTotal" ReadOnly="True" SortExpression="LineTotal" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT SalesLT.SalesOrderDetail.SalesOrderID, SalesLT.SalesOrderDetail.SalesOrderDetailID, SalesLT.SalesOrderDetail.OrderQty, SalesLT.SalesOrderDetail.UnitPrice, SalesLT.SalesOrderDetail.UnitPriceDiscount, SalesLT.SalesOrderDetail.LineTotal, SalesLT.Product.Name FROM SalesLT.SalesOrderDetail INNER JOIN SalesLT.Product ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID WHERE (SalesLT.SalesOrderDetail.SalesOrderID = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" DefaultValue="" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT CustomerID, ShipMethod, TotalDue, TaxAmt, SubTotal, Freight, SalesOrderID FROM SalesLT.SalesOrderHeader WHERE (CustomerID = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
