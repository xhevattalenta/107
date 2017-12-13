var TableDatatablesScroller = function () {

    var initTable1 = function () {
        var table = $('.table_member');

        var oTable = table.dataTable({

            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "Nuk ka të dhëna në tabelë",
                "info": "Shfaqja e _START_ deri _END_ nga _TOTAL_ anëtarët",
                "infoEmpty": "Nuk u gjet asnjë anëtarë",
                "infoFiltered": "(filtruar nga  _MAX_ anëtarët total)",
                "lengthMenu": "_MENU_ entries",
                "search": "Kërko:",
                "zeroRecords": "Nuk u gjetën të dhëna të përputhura"
            },

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // setup buttons extension: http://datatables.net/extensions/buttons/
            buttons: [
                { extend: 'print', className: 'btn dark btn-outline', exportOptions: { columns: ':visible' } },
                { extend: 'pdf', className: 'btn green btn-outline', exportOptions: { columns: ':visible' } },
                { extend: 'excel', className: 'btn green btn-outline', exportOptions: { columns: ':visible' } },
                { extend: 'colvis', className: 'btn dark btn-outline', text: 'Kolonat'}
            ],

            // scroller extension: http://datatables.net/extensions/scroller/
            scrollY:        300,
            deferRender:    true,
            scroller:       true,

            stateSave:      true,

            "order": [
                [0, 'asc']
            ],

            columns: [
              null,
              null,
              null,
              null,
              null,
              { width: '80px' }
            ],

            "lengthMenu": [
                [10, 15, 20, -1],
                [10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 10,

            "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js).
            // So when dropdowns used the scrollable div should be removed.
            //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
        });
    }
    return {

        //main function to initiate the module
        init: function () {

            if (!jQuery().dataTable) {
                return;
            }

            initTable1();
        }

    };

}();

jQuery(document).ready(function() {
    TableDatatablesScroller.init();
});
