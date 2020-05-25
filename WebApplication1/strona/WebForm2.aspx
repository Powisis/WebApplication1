<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.strona.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ProductCategoryID">
    </asp:RadioButtonList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT Name, ProductCategoryID FROM SalesLT.ProductCategory WHERE (ParentProductCategoryID IS NULL)"></asp:SqlDataSource>
    <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ProductCategoryID">
    </asp:RadioButtonList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT ProductCategoryID, Name FROM SalesLT.ProductCategory WHERE (ParentProductCategoryID = @Param3)">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="Param3" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT ProductID, Name FROM SalesLT.Product WHERE (ProductCategoryID = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList2" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
            <asp:BoundField DataField="StandardCost" HeaderText="StandardCost" SortExpression="StandardCost" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
            <asp:BoundField DataField="SellStartDate" HeaderText="SellStartDate" SortExpression="SellStartDate" />
            <asp:BoundField DataField="SellEndDate" HeaderText="SellEndDate" SortExpression="SellEndDate" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksLT2016ConnectionString %>" SelectCommand="SELECT SalesLT.Product.Color, SalesLT.Product.StandardCost, SalesLT.Product.Size, SalesLT.Product.Weight, SalesLT.ProductModel.Name, SalesLT.ProductDescription.Description, SalesLT.Product.SellStartDate, SalesLT.Product.SellEndDate FROM SalesLT.Product INNER JOIN SalesLT.ProductModel ON SalesLT.Product.ProductModelID = SalesLT.ProductModel.ProductModelID INNER JOIN SalesLT.ProductModelProductDescription ON SalesLT.ProductModel.ProductModelID = SalesLT.ProductModelProductDescription.ProductModelID INNER JOIN SalesLT.ProductDescription ON SalesLT.ProductModelProductDescription.ProductDescriptionID = SalesLT.ProductDescription.ProductDescriptionID WHERE (SalesLT.Product.ProductID = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Param1" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
