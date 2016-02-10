$(document).ready(function () {
    $(".emp-row").mouseover(function (ev) {
        var mouseX = ev.pageX;
        var mouseY = ev.pageY;
        var id = $(this).find("input").val();

        Data_Binding_App.EmployeeService.GetDetailedEmployeeInfo(id, onSuccess);

        function onSuccess(result) {
            var empDetails = JSON.parse(result);
            var base64Img = "data:image/jpeg;base64," + btoa(empDetails.Photo);
            $("#dd-photo").html("<img src=\"" + base64Img + "\" />");
            $("#dd-phone").html(empDetails.Phone);
            $("#dd-hire-date").html(empDetails.HireDate);
            $("#dd-address").html(empDetails.Address);
            $("#dd-notes").html(empDetails.Notes);

            $("#detailed-data")
                .css({ top: mouseY, left: mouseX })
                .show();
        }
    })

    $(".emp-row").mouseout(function () {
        $("#detailed-data").hide();
    });
})