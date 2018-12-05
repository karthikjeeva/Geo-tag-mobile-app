
function validate() {
    /*var from = document.getElementById('from').value;
    var to = document.getElementById('to').value;
    alert(from);
    if (from == "") {
        alert("please enter the from field");
    }
    if (to == "") {
        alert("please enter the to field");
    }*/
    //validate depature date
    var depatureDate= document.getElementById('datepicker');
    //alert(new Date(v2.value));
    var depatureDate1 = new Date(depatureDate.value);
  
    var currDate = new Date();
    
    if (currDate > depatureDate1) {
       alert("invalid depature date in validate");
       
    }
    //validate arrival date
    var depatureDate51 = document.getElementById('arrivalpicker');
    
    var depatureDate52 = new Date(depatureDate51.value);
   
    

    if (currDate >depatureDate52) {
        alert("invalid arrival date in validate");
        
    }
    if ((currDate > depatureDate52) || (currDate > depatureDate1)) {
        alert("invalid arrival date in validate");
        return false;
    }
    return true;
}

