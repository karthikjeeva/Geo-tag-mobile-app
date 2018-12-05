<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modification.aspx.cs" Inherits="WebCentric1.Modification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #submit {
            width: 126px;
        }
    </style>
     <link href="book.css" rel="stylesheet" />
    <link href="pikaday.css" rel="stylesheet" />
    <script src="moment.js"></script>
    <script src="pikaday.js"></script>
     
    <link href="site.css" rel="stylesheet" />
    <link href="theme.css" rel="stylesheet" />
    <link href="triangle.css" rel="stylesheet" />
      <script src="validate.js"></script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validate();">
        <asp:TextBox ID="arrivalDate" runat="server" Width="193px"></asp:TextBox>
        <script type="text/javascript">
             var picker = new Pikaday({
                 field: document.getElementById('arrivalDate'),
                 //format:'DD/MM/YYYY',
                 firstDay: 1, minDate: new Date('2017-04-01'),
                 maxDate: new Date('2020-12-31'),
                 yearRange: [2017, 2020],
                 numberOfMonths: 1,
                 theme: 'dark-theme'
             });

         </script>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="depatureDate" runat="server"></asp:TextBox>
       
         <script type="text/javascript">
             var picker = new Pikaday({
                 field: document.getElementById('depatureDate'),
                 //format:'DD/MM/YYYY',
                 firstDay: 1, minDate: new Date('2017-04-01'),
                 maxDate: new Date('2020-12-31'),
                 yearRange: [2017, 2020],
                 numberOfMonths: 1,
                 theme: 'dark-theme'
             }); </script>
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="submit" Width="145px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Flight_details] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Flight_details] ([booker], [arrival], [depature], [depaturedate], [arrivaldate]) VALUES (@booker, @arrival, @depature, @depaturedate, @arrivaldate)" SelectCommand="SELECT * FROM [Flight_details] WHERE ([booker] = @booker)" UpdateCommand="UPDATE [Flight_details] SET [booker] = @booker, [arrival] = @arrival, [depature] = @depature, [depaturedate] = @depaturedate, [arrivaldate] = @arrivaldate WHERE [Id] = @Id">
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
            <SelectParameters>
                <asp:SessionParameter Name="booker" SessionField="user" Type="String" />
            </SelectParameters>
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
