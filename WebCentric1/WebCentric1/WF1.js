function userValid() 
{
    var FName, pw, EmailId;
    FName = document.getElementById("user_name").value;
    EmailId = document.getElementById("Email").value;
    pw = document.getElementById("password").value;
    emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id


    if (FName == '' && pw == '' && EmailId == '')
    {
        alert( "Enter All Fields");
        return false;
    }

    else if (EmailId != '')
    {
        if (!EmailId.match(emailExp))
        {
            alert( "Invalid Email Id");
            return false;
        }
    }
    else if (FName == '') {
        alert("Please Enter Login ID");
        return false;
    }
    return true;

}
