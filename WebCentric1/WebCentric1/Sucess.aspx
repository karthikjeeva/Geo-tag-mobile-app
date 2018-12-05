<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sucess.aspx.cs" Inherits="WebCentric1.Sucess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#ADD8E6" id="PageBody" runat="server">
    <form id="form1" runat="server">
   <h1 style="height: 138px">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="log out" OnClick="Button1_Click" />
        Congratulations Booking successfully</h1>

        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="booker" HeaderText="booker" SortExpression="booker" />
                <asp:BoundField DataField="arrival" HeaderText="arrival" SortExpression="arrival" />
                <asp:BoundField DataField="depature" HeaderText="depature" SortExpression="depature" />
                <asp:BoundField DataField="depaturedate" HeaderText="depaturedate" SortExpression="depaturedate" />
                <asp:BoundField DataField="arrivaldate" HeaderText="arrivaldate" SortExpression="arrivaldate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [booker], [arrival], [depature], [depaturedate], [arrivaldate] FROM [Flight_details] WHERE ([booker] = @booker)">
            <SelectParameters>
                <asp:SessionParameter Name="booker" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button2" runat="server" Text="update booking" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" style="margin-left: 404px" Text="cancel booking" OnClick="Button3_Click" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Flight_details] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Flight_details] ([booker], [arrival], [depature], [depaturedate], [arrivaldate]) VALUES (@booker, @arrival, @depature, @depaturedate, @arrivaldate)" SelectCommand="SELECT * FROM [Flight_details]" UpdateCommand="UPDATE [Flight_details] SET [booker] = @booker, [arrival] = @arrival, [depature] = @depature, [depaturedate] = @depaturedate, [arrivaldate] = @arrivaldate WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="booker" Type="String" />
                <asp:Parameter Name="arrival" Type="String" />
                <asp:Parameter Name="depature" Type="String" />
                <asp:Parameter DbType="Date" Name="depaturedate" />
                <asp:Parameter DbType="Date" Name="arrivaldate" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="booker" Type="String" />
                <asp:Parameter Name="arrival" Type="String" />
                <asp:Parameter Name="depature" Type="String" />
                <asp:Parameter DbType="Date" Name="depaturedate" />
                <asp:Parameter DbType="Date" Name="arrivaldate" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>

</body>
</html>
