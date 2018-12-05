<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebCentric1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 1371px;
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
<body bgcolor="#ADD8E6" id="PageBody" runat="server"> 
   
     <img alt="Book" class="Booking"  src="images/Book.jpg" />
    <form id="form1" runat="server" onsubmit="return validate();">
    
       
&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome To Your Flight Reservation!!</h2><br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
            

        From&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="arrivaldrop" runat="server" DataSourceID="SqlDataSource2" Width="160px" DataTextField="Depature" DataValueField="Depature" BackColor="Yellow" OnSelectedIndexChanged="arrivaldrop_SelectedIndexChanged">
           
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="arrivaldrop1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Depature" DataValueField="Depature" BackColor="Yellow">
        </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="depature" runat="server" Text="Depature"></asp:Label>
&nbsp;&nbsp;
       
        <asp:TextBox ID="datepicker" runat="server" Height="19px" BackColor="Yellow" ></asp:TextBox>
         <script type="text/javascript">
             var picker = new Pikaday({
                 field: document.getElementById('datepicker'),
                 //format:'DD/MM/YYYY',
                 firstDay: 1, minDate: new Date('2017-04-01'),
                 maxDate: new Date('2020-12-31'),
                 yearRange: [2017, 2020],
                 numberOfMonths: 1,
                 theme: 'dark-theme'
             }); </script>
         
       
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arrival&nbsp;&nbsp;
        <asp:TextBox ID="arrivalpicker" runat="server" BackColor="Yellow" OnTextChanged="arrivalpicker_TextChanged"></asp:TextBox>
        <script type="text/javascript">
             var picker = new Pikaday({
                 field: document.getElementById('arrivalpicker'),
                 //format:'DD/MM/YYYY',
                 firstDay: 1, minDate: new Date('2017-04-01'),
                 maxDate: new Date('2020-12-31'),
                 yearRange: [2017, 2020],
                 numberOfMonths: 1,
                 theme: 'dark-theme'
             });

            var dateArr=new Date()
        </script>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="kar" Text="One Way" value="1" class="king"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="kar" Text="Round Trip" value="2" class="king" />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        Class&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="droplist" runat="server" BackColor="Yellow">
            <asp:ListItem Value="500">Economy</asp:ListItem>
            <asp:ListItem Value="400">First Class</asp:ListItem>
            <asp:ListItem Value="300">Buisness Class</asp:ListItem>
            <asp:ListItem Value="200">Second Class</asp:ListItem>
        </asp:DropDownList>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;
        No Of Passengers
        <asp:TextBox ID="passengers" runat="server" Width="34px" CssClass="test" BackColor="Yellow" >0</asp:TextBox>
        <br />
    
        &nbsp;<br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="cost" Class="price-option"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="cost" runat="server" BackColor="Yellow">0</asp:TextBox>
        <br />
        <div draggable="true" style="margin-left: 280px">
            <br />
            
        </div>
       
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="subbutton" runat="server" Text="Click to Reserve" OnClick="validate" BackColor="Blue" ForeColor="White"/> 
        
        <script type="text/javascript">
            var dest = document.getElementById('arrivaldrop').value;
            var arr = document.getElementById('arrivaldrop1').value;

            if (dest == arr) {
                alert("From and To destination fields has to be different");
            }

           /* var depatureDate = document.getElementById('datepicker');
            //alert(new Date(v2.value));
            var depatureDate1 = new Date(depatureDate.value);
            alert(depatureDate1.value);
            var currDate = new Date();

            if (currDate > depatureDate1) {
                alert("invalid depature date in homepage");
            }
            //validate arrival date
            var depatureDate51 = document.getElementById('arrivalpicker');

            var depatureDate52 = new Date(depatureDate51.value);



            if (currDate > depatureDate52) {
                alert("invalid arrival date");
            }*/

       var noOfPassengers = document.getElementById('passengers').value;

            var v1 = document.getElementById('droplist');
            var strUser = parseInt(v1.options[v1.selectedIndex].value);
            
            var val = 0;
         
            if (document.getElementById('RadioButton1').checked == true) {
                val = 1;
            } else if (document.getElementById('RadioButton2').checked == true) {
                val = 2;
            } 
            var c = parseInt(val);
           a= parseInt(noOfPassengers) * 250;
         
           d = a * c*strUser;
           cost.value = d;
         
            
 </script>      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [depature] FROM [depatures]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Flight_details] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Flight_details] ([booker], [arrival], [depature], [depaturedate], [arrivaldate]) VALUES (@booker, @arrival, @depature, @depaturedate, @arrivaldate)" SelectCommand="SELECT * FROM [Flight_details]" UpdateCommand="UPDATE [Flight_details] SET [booker] = @booker, [arrival] = @arrival, [depature] = @depature, [depaturedate] = @depaturedate, [arrivaldate] = @arrivaldate WHERE [Id] = @Id">
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
        <br />
        <br />
      </form>
</body>
</html>
