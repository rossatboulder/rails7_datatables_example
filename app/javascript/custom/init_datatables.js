import $ from 'jquery'
import DataTable from 'datatables.net-bs5'
import 'datatables.net-buttons-bs5'
import 'jquery-highlight'

// I can get basic dataTable working by commenting out the following 6 lines:
import JSZip from 'jszip'
import pdfMake from 'pdfmake'
import pdfFonts from 'pdfmake/build/vfs_fonts'
DataTable.Buttons.jszip(JSZip)
DataTable.Buttons.pdfMake(pdfMake)
pdfMake.vfs = pdfFonts.pdfMake.vfs


// https://datatables.net/blog/2014-10-22#Initialisation
// Highlight text that was found by searching in DataTables
function highlight( body, table )
{
  // Removing the old highlighting first
  body.unhighlight();

  // Don't highlight the "not found" row, so we get the rows using the api
  if ( table.rows( { filter: 'applied' } ).data().length ) {
    table.columns().every( function () {
        var column = this;
        column.nodes().flatten().to$().unhighlight({ className: 'column_highlight' });
        column.nodes().flatten().to$().highlight( column.search().trim().split(/\s+/), { className: 'column_highlight' } );
    } );
    body.highlight( table.search().trim().split(/\s+/) );
  }
}
// Listen for DataTables initialisations
$(document).on( 'init.dt.dth', function (e, settings, json) {
  if ( e.namespace !== 'dt' ) {
    return;
  }

  var table = new $.fn.dataTable.Api( settings );
  var body = $( table.table().body() );

  if (
    $( table.table().node() ).hasClass( 'searchHighlight' ) || // table has class
    settings.oInit.searchHighlight                          || // option specified
    $.fn.dataTable.defaults.searchHighlight                    // default set
  ) {
    table
      .on( 'draw.dt.dth column-visibility.dt.dth column-reorder.dt.dth', function () {
        highlight( body, table );
      } )
      .on( 'destroy', function () {
        // Remove event handler
        table.off( 'draw.dt.dth column-visibility.dt.dth column-reorder.dt.dth' );
      } );

    // initial highlight for state saved conditions and initial states
    if ( table.search() ) {
      highlight( body, table );
    }
  }
} );





$(document).on('turbo:load', function(e) {

  var sensor_networks_table = $('#sensor_networks').DataTable({
    //dom: 'Bfrtip',
    destroy: true,
    searchHighlight: true,
    paging:          false,
    buttons: [
      { extend: 'copy',
        text: 'Copy to Clipboard'
      },
      { extend: 'csv',
        text: 'Download Spreadsheet (csv)'
      }
    ]
  });

  sensor_networks_table.buttons().container().appendTo( '#sensor_networks_wrapper .col-md-6:eq(0)' );

});

// Before caching the page, clear the search input field
$(document).on('turbo:before-cache', function() {
  if ( $('table#sensor_networks').length > 0 ) {
    $.fn.dataTable.tables( { api: true } ).search("").draw();
    $.fn.dataTable.tables( { api: true } ).destroy();
  }
});


