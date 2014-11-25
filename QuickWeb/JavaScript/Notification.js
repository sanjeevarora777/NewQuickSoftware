function GetNotificationData() {
    $.ajax({
        url: 'Autocomplete.asmx/GetNotificationData',
        type: 'GET',
        data: "",
        timeout: 20000,
        contentType: 'application/json; charset=UTF-8',
        datatype: 'JSON',
        cache: true,
        async: false,
        success: function (response) {
            var _val = response.d;
            SetColorAndText(_val);
        },
        error: function (response) {
        }
    });
}

function UpdateNotification() {
    $.ajax({
        url: 'Autocomplete.asmx/UpdateNotificationData',
        type: 'GET',
        data: "",
        timeout: 20000,
        contentType: 'application/json; charset=UTF-8',
        datatype: 'JSON',
        cache: true,
        async: false,
        success: function (response) {
            var _val = response.d;           
        },
        error: function (response) {
        }
    });
}



function GetNotificationData1() {
    $.ajax({
        url: '../Autocomplete.asmx/GetNotificationData',
        type: 'GET',
        data: "",
        timeout: 20000,
        contentType: 'application/json; charset=UTF-8',
        datatype: 'JSON',
        cache: true,
        async: false,
        success: function (response) {
            var _val = response.d;
            SetColorAndText(_val);
        },
        error: function (response) {
        }
    });
}

function UpdateNotification1() {
    $.ajax({
        url: '../Autocomplete.asmx/UpdateNotificationData',
        type: 'GET',
        data: "",
        timeout: 20000,
        contentType: 'application/json; charset=UTF-8',
        datatype: 'JSON',
        cache: true,
        async: false,
        success: function (response) {
            var _val = response.d;
        },
        error: function (response) {
        }
    });
}


function SetColorAndText(_val) {
    var aryData = _val.split('@');
    var aryDays = aryData[1].split(':');
    var NoOfDay = parseInt(aryDays[0]);
    var Ispaid = aryDays[1];
    if ((aryData[0] === "True") && (NoOfDay <= 30)) {
        $('#divShowBar').show();
        if ((NoOfDay >= 0) && (NoOfDay <= 7)) {           
            $('#divShowBar').addClass('alert-danger');
        }
        else if ((NoOfDay >= 8) && (NoOfDay <= 15)) {
            $('#divShowBar').addClass('alert-warning');            
        }
        else if ((NoOfDay >= 16) && (NoOfDay <= 30)) {
            $('#divShowBar').addClass('alert-info');
        }
    }
    else {
        $('#divShowBar').hide();
    }
    $('#spnShowInfo').html('If you do not renew your license, this software will stop working after<b> ' + aryDays[0] + '  Days </b>.');   

}