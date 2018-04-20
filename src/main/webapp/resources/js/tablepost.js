var table = $('table').on().DataTable({
    searching: false,
    pagingType: "simple",
    "iDisplayLength": 5,
    responsive: true
});
table.order([0, 'desc']).draw();
$('.dataTables_length').remove();

$("#DataTables_Table_0_previous").addClass("btn btn-primary");
$("#DataTables_Table_0_next").addClass("btn btn-primary");
$("#DataTables_Table_0_previous").css("width", "120px");
$("#DataTables_Table_0_next").css("width", "120px");

$("#DataTables_Table_0_paginate").addClass("float-right");

$('table').on('draw.dt', function () {
    $("#DataTables_Table_0_previous").addClass("btn btn-primary");
    $("#DataTables_Table_0_next").addClass("btn btn-primary");
    $("#DataTables_Table_0_previous").css("width", "120px");
    $("#DataTables_Table_0_next").css("width", "120px");
});

