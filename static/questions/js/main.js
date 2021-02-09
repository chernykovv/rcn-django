$(".ch").click(function() {
    var val = $(this).val();
    val=val.replace(' ', '');
    $(".qblock").hide();
    $("#" + val).show();
});


var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
// This function will display the specified tab of the form ...
var x = document.getElementsByClassName("tab");
try {
    x[n].style.display = "block";

// ... and fix the Previous/Next buttons:
if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
} else {
    document.getElementById("prevBtn").style.display = "inline";
}
if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
} else {
    document.getElementById("nextBtn").innerHTML = "Next";
}
} catch(msg) {



}
// ... and run a function that displays the correct step indicator:
fixStepIndicator(n)
}

function nextPrev(n) {
// This function will figure out which tab to display
var x = document.getElementsByClassName("tab");

var nv = document.getElementsByClassName("need_valid");


[].forEach.call(nv, function(el) {
    el.classList.remove("invalid");
});

try{
    var che_val = document.getElementById("che_val");
    var sel_val = document.getElementById("sel_val");
    che_val.style.display = 'none';
    sel_val.style.display = 'none';
} catch(msg) {
    console.log("no sel")
}


// Exit the function if any field in the current tab is invalid:
if (n == 1 && !validateForm()) return false;
// Hide the current tab:
x[currentTab].style.display = "none";
// Increase or decrease the current tab by 1:
currentTab = currentTab + n;
// if you have reached the end of the form... :


try{
    if (document.getElementById('custom_input').checked){
        document.getElementById('third').className = "not_tab"
    }
} catch(msg) {
    console.log("no third")
}



if (currentTab >= x.length) {
    //...the form gets submitted:
    if($('.notvalidnow').length>0){
      doSubmitRequest();
    }else{
      document.getElementById("regForm").submit();
      return false;
    }

}
// Otherwise, display the correct tab:
showTab(currentTab);
}

function validField(element) {
    if (element.value == "") {
        element.className += " invalid";
        element.previousElementSibling.style.display = 'block';
    } else {
        element.className = "form-control need_valid";
        element.previousElementSibling.style.display = 'none';
    }
}

function validPhone(element) {
    if (element.value == "") {
        element.className += " invalid";
        element.previousElementSibling.style.display = 'block';
    } else {
        element.className = "form-control need_valid";
        element.previousElementSibling.style.display = 'none';
        if (validatePhone(element.value)) {
            document.getElementById("err_phone").style.display = 'none';
            element.className = "form-control need_valid";
        } else {
            document.getElementById("err_phone").style.display = 'block';
            element.className += " invalid";
        }
    }
}








function validEmail(element) {
    if (element.value == "") {
        element.className += " invalid";
        element.previousElementSibling.style.display = 'block';
    } else {
        element.className = "form-control need_valid";
        element.previousElementSibling.style.display = 'none';
        if (validateEmail(element.value)) {
            document.getElementById("err_email").style.display = 'none';
            element.className = "form-control need_valid";
        } else {
            document.getElementById("err_email").style.display = 'block';
            element.className += " invalid";
        }
    }
}



function validCho(element) {
    var strUser = element.options[element.selectedIndex].value;
    if (strUser == '') {
        var sel_val = document.getElementById("sel_val");
        sel_val.style.display = 'block';
        valid = false;
    }
}



function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

function validatePhone(phone) {
    var re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/;
    return re.test(String(phone).toLowerCase());
}

function validateForm() {

    // This function deals with validation of the form fields
    var x, y, i, valid = true;
    x = document.getElementsByClassName("tab");
    y = x[currentTab].getElementsByClassName("need_valid");
    // A loop that checks every input field in the current tab:
    for (i = 0; i < y.length; i++) {
        // If a field is empty...
        if (y[i].value == "") {
        // add an "invalid" class to the field:
        y[i].className += " invalid";
        // and set the current valid status to false:
        valid = false;
        }
    }

if($('.notvalidnow').length>0){
  if(currentTab>0){
    var e = document.getElementById("id_neighborhood");
    var strUser = e.options[e.selectedIndex].value;
    if (strUser == '') {
        var sel_val = document.getElementById("sel_val");
        sel_val.style.display = 'block';
        valid = false;
    }
  }
}else{
  var e = document.getElementById("id_neighborhood");
  var strUser = e.options[e.selectedIndex].value;
  if (strUser == '') {
      var sel_val = document.getElementById("sel_val");
      sel_val.style.display = 'block';
      valid = false;
  }
}


    ch = x[currentTab].getElementsByClassName("ch");
    if (ch.length != 0 ){
        if (document.querySelector('.ch:checked')) {
            console.log('OK')
        }
        else{
            valid = false;
            var che_val = document.getElementById("che_val");
            che_val.style.display = 'block';
        }

    }

    email = document.getElementById("id_email");

    if (validateEmail(email.value)) {
        console.log('OK')
    } else {
        email.className += " invalid"
        valid = false;
    }


    phone = document.getElementById("id_phone");

    if (validatePhone(phone.value)) {
        console.log('OK')
    } else {
        phone.className += " invalid"
        valid = false;
    }


    // If the valid status is true, mark the step as finished and valid:
    try {
        if (valid) {
            document.getElementsByClassName("step")[currentTab].className += " finish";
        }
    } catch(err) {

    return true;

    }

    return valid; // return the valid status
}

function fixStepIndicator(n) {
// This function removes the "active" class of all steps...

try {
    var i, x = document.getElementsByClassName("step");
    for (i = 0; i < x.length; i++) {
        x[i].className = x[i].className.replace(" active", "");
    }
    //... and adds the "active" class to the current step:
    x[n].className += " active";
  } catch(err) {

   return true;

  }
}
