@php
use TCG\Voyager\Models\Post;
use App\Member;

$user_role = Voyager::model('User')->find( Auth::id() )->role_id;
$role = Voyager::model('Role')->find($user_role)->name;

$inputs  = App\Input::all();
$outputs = App\Output::all();

$years  = [2017,2018];
$inputs_data_kesh = DB::table('inputs')
->select(DB::raw('sum(vlera) as `vlera`'), DB::raw("DATE_FORMAT(data, '%m-%Y') new_date"),  DB::raw('YEAR(data) year, MONTH(data) month'))
->where('menyra','k')
->groupby('year','month')
->get();
$inputs_data_materiale = DB::table('inputs')
->select(DB::raw('sum(vlera) as `vlera`'), DB::raw("DATE_FORMAT(data, '%m-%Y') new_date"),  DB::raw('YEAR(data) year, MONTH(data) month'))
->where('menyra','m')
->groupby('year','month')
->get();
$outputs_data = DB::table('outputs')
->select(DB::raw('sum(vlera) as `vlera`'), DB::raw("DATE_FORMAT(data, '%m-%Y') new_date"),  DB::raw('YEAR(data) year, MONTH(data) month'))
->groupby('year','month')
->get();

function getTotalByYear($datas, $year )
{
  $sum = 0;
  foreach ($datas as $key => $value) {
    if ( $value->year == $year )
      $sum += $value->vlera;
  }
  return $sum;
}
function getTotalByMonth($datas, $year, $month)
{
  $sum = 0;
  foreach ($datas as $key => $value) {
    if ( $value->year == $year ) {
      if ( $value->month == $month )
        $sum += $value->vlera;
    }
  }
  return $sum;
}

$total_input  = $inputs->sum('vlera');
$total_output = $outputs->sum('vlera');
$total_arka   = $total_input - $total_output;

@endphp
@extends('admin.layouts.skeleton')

@section('styles')
  <!-- BEGIN THEME GLOBAL STYLES -->
  <link href="{!! asset('assets/global/css/components-md.min.css') !!}" rel="stylesheet" id="style_components" type="text/css" />
  <link href="{!! asset('assets/global/css/plugins-md.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END THEME GLOBAL STYLES -->
  <!-- BEGIN THEME LAYOUT STYLES -->
  <link href="{!! asset('assets/layouts/layout2/css/layout.min.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/layouts/layout2/css/themes/blue.min.css') !!}" rel="stylesheet" type="text/css" id="style_color" />
  <link href="{!! asset('assets/layouts/layout2/css/custom.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END THEME LAYOUT STYLES -->
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <link href="{!! asset('assets/global/plugins/datatables/datatables.min.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL PLUGINS -->
@endsection

@section('title', 'Ballina')
@section('page-title', 'Admin Ballina')
@section('page-subtitle', 'statistics, recent events and reports')
@section('page-breadcrumb-title', 'Ballina')

@section('content')
  @if(Session::has('flash_message'))
    <p class="alert alert-info">{{ Session::get('flash_message') }}</p>
  @endif
  <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 margin-bottom-10">
        <div class="dashboard-stat blue">
            <div class="visual">
                <i class="fa fa-briefcase fa-icon-medium"></i>
            </div>
            <div class="details">
                <div class="number"> {{$total_input}} den </div>
                <div class="desc"> Hyrje Totale </div>
            </div>
            <a class="more" href="javascript:;"> &nbsp;
                <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="dashboard-stat red">
            <div class="visual">
                <i class="fa fa-shopping-cart"></i>
            </div>
            <div class="details">
                <div class="number"> {{$total_output}} den </div>
                <div class="desc"> Harxhime Totale </div>
            </div>
            <a class="more" href="javascript:;"> &nbsp;
                <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="dashboard-stat green">
            <div class="visual">
                <i class="fa fa-group fa-icon-medium"></i>
            </div>
            <div class="details">
                <div class="number"> {{$total_arka}} den </div>
                <div class="desc"> Në Arkë </div>
            </div>
            <a class="more" href="javascript:;"> &nbsp;
                <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
      <!-- Begin: life time stats -->
      <!-- BEGIN PORTLET-->
      <div class="portlet light ">
          <div class="portlet-title tabbable-line">
              <div class="caption">
                  <i class="icon-globe font-red"></i>
                  <span class="caption-subject font-red bold uppercase">Statistikat</span>
              </div>
              <ul class="nav nav-tabs">
                @foreach ($years as $key => $year)
                  <li class="{{ ($key==0) ? 'active' : '' }}">
                      <a href="#portlet_ecommerce_tab_{{$year}}" id="statistics_inputs_tab_{{$year}}" data-toggle="tab">
                        <label class="btn btn-transparent grey-salsa btn-circle btn-sm {{ ($key==0) ? 'active' : '' }}">{{$year}} </label>
                      </a>
                  </li>
                @endforeach
              </ul>
          </div>
          <div class="portlet-body">
              <div class="tab-content">
                @foreach ($years as $key => $year)
                  <div class="tab-pane {{ ($key==0) ? 'active' : '' }}" id="portlet_ecommerce_tab_{{$year}}">
                      <div id="statistics_{{$year}}" class="chart"> </div><div id="legendholder">Legend Container</div>
                  </div>
                @endforeach
              </div>
              <div class="well margin-top-20">
                  <div class="row">
                      <div class="col-md-4 col-sm-4 col-xs-12 text-stat">
                          <span class="label label-info"> Toatal Hyrje: </span>
                          <h3>{{$total_input}} den</h3>
                      </div>
                      <div class="col-md-4 col-sm-4 col-xs-12 text-stat">
                          <span class="label label-success"> Toatal Harxhime: </span>
                          <h3>{{$total_output}} den</h3>
                      </div>
                      <div class="col-md-4 col-sm-4 col-xs-12 text-stat">
                          <span class="label label-danger"> Total në Arkë: </span>
                          <h3>{{$total_arka}}</h3>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!-- End: life time stats -->
    </div>
  </div>

  <div class="row">
    <div class="col-md-6">
      <!-- BEGIN PORTLET -->
      <div class="portlet light ">
          <div class="portlet-title tabbable-line">
              <div class="caption">
                  <i class="icon-pin font-blue-madison"></i>
                  <span class="caption-subject font-blue-madison bold uppercase"> Hyrjet </span>
                  <span class="caption-helper">hyrjet...</span>
              </div>
              <ul class="nav nav-tabs">
                @foreach ($years as $key => $year)
                  <li class="{{ ($key==0) ? 'active' : '' }}">
                      <a href="#portlet_tab_input_{{$year}}" data-toggle="tab">
                        <label class="btn btn-transparent grey-salsa btn-circle btn-sm {{ ($key==0) ? 'active' : '' }}">{{$year}} </label>
                      </a>
                  </li>
                @endforeach
              </ul>
          </div>
          <div class="portlet-body">
            <div class="tab-content">
              @foreach ($years as $key => $year)
                <div class="tab-pane {{ ($key==0) ? 'active' : '' }}" id="portlet_tab_input_{{$year}}">
                    <div class="scroller" style="height: 590px;">
                      <div class="row number-stats margin-bottom-30">
                          <div class="col-md-12">
                              <div class="stat-left note">
                                  <div class="stat-number">
                                      <div class="title"> Total Kesh </div>
                                      <div class="number"> {{getTotalByYear($inputs_data_kesh, $year)}} den </div>
                                  </div>
                              </div>
                              <div class="stat-left">
                                  <div class="stat-number note">
                                      <div class="title"> Total Materiale </div>
                                      <div class="number"> {{getTotalByYear($inputs_data_materiale, $year)}} den </div>
                                  </div>
                              </div>
                          </div>
                      </div>

                        <table class="table table-striped table-light table-bordered table-hover order-column table_hyrje" width="100%">
                          <thead>
                              <tr class="uppercase">
                                  <th style="max-width: 100px;"> ANËTARI </th>
                                  <th> KONTRIBUTI </th>
                                  <th> Mënyra </th>
                                  <th class="webix_hcell"> DETAJET </th>
                                  <th> VLERA </th>
                                  <th> DATA </th>
                                  <th>
                                    @if ($role == 'admin' || $role == 'subadmin')
                                    NDRYSHIME
                                    @endif
                                  </th>
                              </tr>
                          </thead>
                          <tbody>
                          @foreach ($inputs as $key => $input)
                            @if ( date( 'Y', strtotime( $input->data ) ) == $year)

                              <?php $member = Member::where('id', $input->member_id)->first() ?>
                              <tr>
                                  @if ( $member )
                                    <td class="fit">
                                        <img class="user-pic" src="{{ Voyager::image( $member->image ) }}">
                                        <a href="/anetar/{{ $member->id }}" class="primary-link" style="display:block;">
                                          {{ $member->name }}
                                        </a>
                                    </td>
                                  @else
                                    <td class="fit">
                                        <img class="user-pic" src="{{ Voyager::image( 'users/default.png' ) }}">
                                        <span style="display:block;">Anonim</span>
                                    </td>
                                  @endif

                                  <td> {{ ($input->kontributi == 'a') ? "Anëtarsim" : "Kontribut" }} </td>
                                  <td> {{ ($input->menyra == 'k') ? "Kesh" : "Material" }} </td>
                                  <td> {{ $input->details }} </td>
                                  <td>{{ ($input->vlera == '') ? '-' : $input->vlera . ' ' }}</td>
                                  <td>
                                      <span class="bold theme-font"> {{ date("d-m-Y", strtotime($input->data) ) }} </span>
                                  </td>

                                  <td>
                                    @if ($role == 'admin' || $role == 'subadmin')
                                    <a href="/hyrje/{{$input->id}}/edit" class="btn btn-icon-only blue" style="float: left;">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <form action="/hyrje/{{$input->id}}" method="post">
                                      {{ csrf_field() }}
                                      <input name="_method" type="hidden" value="DELETE">
                                      <button type="submit" class="btn btn-icon-only red"><i class="fa fa-times"></i></button>
                                    </form>
                                    @endif
                                  </td>

                              </tr>
                            @endif
                          @endforeach
                        </tbody>
                      </table>

                    </div>
                </div>
              @endforeach
            </div>
          </div>
      </div>
      <!-- END PORTLET -->
    </div>

    <div class="col-md-6">
      <!-- BEGIN PORTLET -->
      <div class="portlet light ">
          <div class="portlet-title tabbable-line">
              <div class="caption">
                  <i class="icon-pin font-blue-madison"></i>
                  <span class="caption-subject font-blue-madison bold uppercase"> Harxhimet </span>
                  <span class="caption-helper">harxhimet...</span>
              </div>
              <ul class="nav nav-tabs">
                @foreach ($years as $key => $year)
                  <li class="{{ ($key==0) ? 'active' : '' }}">
                      <a href="#portlet_tab_output_{{$year}}" data-toggle="tab">
                        <label class="btn btn-transparent grey-salsa btn-circle btn-sm {{ ($key==0) ? 'active' : '' }}">{{$year}} </label>
                      </a>
                  </li>
                @endforeach
              </ul>
          </div>
          <div class="portlet-body">
            <div class="tab-content">
              @foreach ($years as $key => $year)
                <div class="tab-pane {{ ($key==0) ? 'active' : '' }}" id="portlet_tab_output_{{$year}}">
                    <div class="scroller" style="height: 550px;">
                      <div class="row number-stats margin-bottom-30">
                          <div class="col-md-12">
                              <div class="stat-left">
                                  <div class="stat-number">
                                      <div class="title"> Total </div>
                                      <div class="number"> {{getTotalByYear($outputs_data, $year)}} den </div>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <table class="table table-striped table-light table-bordered table-hover order-column table_dalje" width="100%">
                          <thead>
                              <tr class="uppercase">
                                  <th> DETAJET </th>
                                  <th> VLERA </th>
                                  <th> DATA </th>
                                  <th>
                                    @if ($role == 'admin' || $role == 'subadmin')
                                  </th>
                                  @endif
                              </tr>
                          </thead>
                          @foreach ($outputs as $key => $output)
                            @if ( date( 'Y', strtotime( $output->data ) ) == $year)
                              <tr>
                                  <td width="50%"> {{ $output->details }} </td>
                                  <td> {{ $output->vlera }} den </td>
                                  <td>
                                      <span class="bold theme-font"> {{ date("d-m-Y", strtotime($output->data) ) }} </span>
                                  </td>

                                  <td>
                                    @if ($role == 'admin' || $role == 'subadmin')
                                    <a href="/dalje/{{$output->id}}/edit" class="btn btn-icon-only blue" style="float: left;">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <form action="/dalje/{{$output->id}}" method="post">
                                      {{ csrf_field() }}
                                      <input name="_method" type="hidden" value="DELETE">
                                      <button type="submit" class="btn btn-icon-only red"><i class="fa fa-times"></i></button>
                                    </form>
                                    @endif
                                  </td>
                              </tr>
                            @endif
                          @endforeach
                      </table>
                    </div>
                </div>
              @endforeach
            </div>
          </div>
      </div>
      <!-- END PORTLET -->
    </div>
  </div>


@endsection

@section('scripts')
  <!-- BEGIN PAGE LEVEL SCRIPTS -->
  <script src="{!! asset('assets/global/scripts/datatable.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/datatables/datatables.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/pages/scripts/table-datatables-scroller-xh.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL SCRIPTS -->
  <!-- BEGIN PAGE LEVEL SCRIPTS -->
  <script src="{!! asset('assets/global/plugins/flot/jquery.flot.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/flot/jquery.flot.resize.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/flot/jquery.flot.categories.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL SCRIPTS -->

  <script type="text/javascript">
    var EcommerceDashboard = function() {

    function showTooltip(x, y, labelX, labelY) {
        $('<div id="tooltip" class="chart-tooltip">' + (labelY.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,')) + ' DENAR<\/div>').css({
            position: 'absolute',
            display: 'none',
            top: y - 40,
            left: x - 80,
            border: '0px solid #ccc',
            padding: '2px 6px',
            'background-color': '#fff'
        }).appendTo("body").fadeIn(200);
    }

    @foreach ($years as $key => $year)
      var initChartInput{{$year}} = function() {

          var data_kesh = [
              ['01/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,1) }}],
              ['02/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,2) }}],
              ['03/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,3) }}],
              ['04/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,4) }}],
              ['05/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,5) }}],
              ['06/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,6) }}],
              ['07/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,7) }}],
              ['08/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,8) }}],
              ['09/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,9) }}],
              ['10/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,10) }}],
              ['11/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,11) }}],
              ['12/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,12) }}]
              ['12/{{$year}}', {{ getTotalByMonth($inputs_data_kesh, $year,12) }}]
          ];
          var data_materiale = [
              ['01/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,1) }}],
              ['02/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,2) }}],
              ['03/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,3) }}],
              ['04/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,4) }}],
              ['05/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,5) }}],
              ['06/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,6) }}],
              ['07/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,7) }}],
              ['08/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,8) }}],
              ['09/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,9) }}],
              ['10/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,10) }}],
              ['11/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,11) }}],
              ['12/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,12) }}]
              ['12/{{$year}}', {{ getTotalByMonth($inputs_data_materiale, $year,12) }}]
          ];

          var data = [{
              data: data_kesh,
              lines: {
                  fill: 0.6,
                  lineWidth: 0
              },
              color: ['#008000']
          }, {
              data: data_kesh,
              points: {
                  show: true,
                  fill: true,
                  radius: 5,
                  fillColor: "#008000",
                  lineWidth: 3
              },
              color: '#fff',
              shadowSize: 0
          },
          {
              data: data_materiale,
              lines: {
                  fill: 0.6,
                  lineWidth: 0
              },
              color: ['#258fd7']
          }, {
              data: data_materiale,
              points: {
                  show: true,
                  fill: true,
                  radius: 5,
                  fillColor: "#258fd7",
                  lineWidth: 3
              },
              color: '#fff',
              shadowSize: 0
          }];

          var option = {

              xaxis: {
                  tickLength: 0,
                  tickDecimals: 0,
                  mode: "categories",
                  min: 0,
                  font: {
                      lineHeight: 15,
                      style: "normal",
                      variant: "small-caps",
                      color: "#6F7B8A"
                  }
              },
              yaxis: {
                  ticks: 3,
                  tickDecimals: 0,
                  tickColor: "#f0f0f0",
                  font: {
                      lineHeight: 15,
                      style: "normal",
                      variant: "small-caps",
                      color: "#6F7B8A"
                  }
              },
              grid: {
                  backgroundColor: {
                      colors: ["#fff", "#fff"]
                  },
                  borderWidth: 1,
                  borderColor: "#f0f0f0",
                  margin: 0,
                  minBorderMargin: 0,
                  labelMargin: 20,
                  hoverable: true,
                  clickable: true,
                  mouseActiveRadius: 6
              },
              legend: {
                  show: true,
                  position:"nw"
              }
          };

          var plot_statistics = $.plot(
              $("#statistics_{{$year}}"), data, option
          );

          var previousPoint = null;

          $("#statistics_{{$year}}").bind("plothover", function(event, pos, item) {
              $("#x").text(pos.x.toFixed(2));
              $("#y").text(pos.y.toFixed(2));
              if (item) {
                  if (previousPoint != item.dataIndex) {
                      previousPoint = item.dataIndex;

                      $("#tooltip").remove();
                      var x = item.datapoint[0].toFixed(2),
                          y = item.datapoint[1].toFixed(2);

                      showTooltip(item.pageX, item.pageY, item.datapoint[0], item.datapoint[1]);
                  }
              } else {
                  $("#tooltip").remove();
                  previousPoint = null;
              }
          });

      }
    @endforeach

    return {
        init: function() {
            initChartInput2017();
            $('#statistics_inputs_tab_2018').on('shown.bs.tab', function(e) {
                initChartInput2018();
            });
        }
    };

    }();

    jQuery(document).ready(function() {
    EcommerceDashboard.init();
    });
  </script>
@endsection
