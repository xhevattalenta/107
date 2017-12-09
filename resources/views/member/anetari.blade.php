@php
use App\Member;
use App\Input;
$member = $m;

$user_role = Voyager::model('User')->find( Auth::id() )->role_id;
$role = Voyager::model('Role')->find($user_role)->name;

$years  = [2017,2018];
$inputs = App\Input::where('member_id', $m->id)->get();
$inputs_total = $inputs->sum('vlera');
$inputs_data = App\Input::where('member_id', $m->id)
->select(DB::raw('sum(vlera) as `vlera`'), DB::raw("DATE_FORMAT(data, '%m-%Y') new_date"),  DB::raw('YEAR(data) year, MONTH(data) month'))
->groupby('year','month')
->get();

function getTotalByYear($datas, $year )
{
  $sum = 0;
  foreach ($datas as $key => $value) {
    if ( $value->year == $year ) {
      $sum += $value->vlera;
    }
  }
  return $sum;
}
function getTotalByMonth($datas, $year, $month)
{
  $sum = 0;
  foreach ($datas as $key => $value) {
    if ( $value->year == $year ) {
      if ( $value->month == $month ) {
        $sum += $value->vlera;
      }
    }
  }
  return $sum;
}
/*
$input_data = array(
  'jan' => ,
);*/


//setlocale(LC_TIME, "AL");
@endphp

{{-- $posts = Voyager::model('Post')::find(1)->get() --}}


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
  <!-- BEGIN PAGE LAYOUT STYLES -->
  <link href="{!! asset('assets/pages/css/profile.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END PAGE LAYOUT STYLES -->
@endsection

@section('title', 'Anëtar')
@section('page-title', 'Anëtari')
@section('page-subtitle', 'Profili i anëtarit')
@section('page-breadcrumb-title', 'Anëtar')

@section('content')
  @if(Session::has('flash_message'))
    <p class="alert alert-info">{{ Session::get('flash_message') }}</p>
  @endif
  <div class="row">
      <div class="col-md-12">
        <!-- BEGIN PROFILE SIDEBAR -->
        <div class="profile-sidebar">
            <!-- PORTLET MAIN -->
            <div class="portlet light profile-sidebar-portlet ">
                <!-- SIDEBAR USERPIC -->
                <div class="profile-userpic">
                  <img src="{{ Voyager::image( $member->image ) }}" class="img-responsive" alt="">
                </div>
                <!-- END SIDEBAR USERPIC -->
                <!-- SIDEBAR USER TITLE -->
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"> {{ $member->name }} </div>
                    <div class="profile-usertitle-job"> {{ $member->tel }} </div>
                    <br><br>
                    <div class="profile-usertitle-job">Totali:<h2><strong> {{$inputs_total }} den </strong><h2></div>
                </div>
                <!-- END SIDEBAR USER TITLE -->
                <!-- SIDEBAR MENU -->
                <div class="profile-usermenu">

                </div>
                <!-- END MENU -->
            </div>
            <!-- END PORTLET MAIN -->
        </div>
        <!-- END BEGIN PROFILE SIDEBAR -->
        <!-- BEGIN PROFILE CONTENT -->
        <div class="profile-content">
            <div class="row">
              <div class="col-md-12">
                <!-- BEGIN Portlet PORTLET-->
                  <div class="portlet light">
                      <div class="portlet-title tabbable-line">
                          <div class="caption">
                              <i class="icon-pin font-blue-madison"></i>
                              <span class="caption-subject font-blue-madison bold uppercase"> Kontributi </span>
                              <span class="caption-helper">hyrjet...</span>
                          </div>
                          <ul class="nav nav-tabs">
                            @foreach ($years as $key => $year)
                              <li class="{{ ($key==0) ? 'active' : '' }}">
                                  <a href="#portlet_tab_{{$year}}" data-toggle="tab">
                                    <label class="btn btn-transparent grey-salsa btn-circle btn-sm {{ ($key==0) ? 'active' : '' }}">{{$year}} </label>
                                  </a>
                              </li>
                            @endforeach
                          </ul>
                      </div>
                      <div class="portlet-body">
                          <div class="tab-content">
                            @foreach ($years as $key => $year)
                              <div class="tab-pane {{ ($key==0) ? 'active' : '' }}" id="portlet_tab_{{$year}}">
                                  <div class="scroller" style="height: 400px;">
                                    <div class="row number-stats margin-bottom-30">
                                        <div class="col-md-12">
                                            <div class="stat-left">
                                                <div class="stat-chart">
                                                    <div id="sparkline_bar_{{$year}}"></div>
                                                </div>
                                                <div class="stat-number">
                                                    <div class="title"> Total </div>
                                                    <div class="number"> {{getTotalByYear($inputs_data, $year)}} den </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-scrollable table-scrollable-borderless">
                                        <table class="table table-hover table-light">
                                            <thead>
                                                <tr class="uppercase">
                                                    <th> Kontributi </th>
                                                    <th> Përshkrimi </th>
                                                    <th> Vlera </th>
                                                    <th> Data </th>
                                                    @if ($role == 'admin' || $role == 'subadmin')
                                                    <th style="min-width:100px;"> NDRYSHIME </th>
                                                    @endif
                                                </tr>
                                            </thead>
                                            @foreach ($inputs as $key => $input)
                                              @if ( date( 'Y', strtotime( $input->data ) ) == $year)
                                                <tr>
                                                    <td>{{ $input->kontributi }}</td>
                                                    <td>{{ $input->details }}</td>
                                                    <td>{{ ($input->vlera == '') ? '-' : $input->vlera . ' den' }}</td>
                                                    <td>{{ date("d-m-Y", strtotime($input->data) ) }}</td>
                                                    @if ($role == 'admin' || $role == 'subadmin')
                                                    <td>
                                                      <a href="/hyrje/{{$input->id}}/edit" class="btn btn-icon-only blue" style="float: left;">
                                                          <i class="fa fa-edit"></i>
                                                      </a>
                                                      <form action="/hyrje/{{$input->id}}" method="post">
                                                        {{ csrf_field() }}
                                                        <input name="_method" type="hidden" value="DELETE">
                                                        <button type="submit" class="btn btn-icon-only red"><i class="fa fa-times"></i></button>
                                                      </form>

                                                    </td>
                                                    @endif
                                                </tr>
                                              @endif
                                            @endforeach
                                        </table>
                                    </div>
                                  </div>
                              </div>
                            @endforeach
                          </div>
                      </div>
                  </div>
              </div>
            </div>
        </div>
        <!-- END PROFILE CONTENT -->
    </div>
  </div>
@endsection

@section('scripts')
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <script src="{!! asset('assets/global/plugins/jquery.sparkline.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL PLUGINS -->
  <!-- BEGIN PAGE LEVEL SCRIPTS -->
  <script src="{!! asset('assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/pages/scripts/components-date-time-pickers.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL SCRIPTS -->
  <script type="text/javascript">
    var Profile = function() {

        var dashboardMainChart = null;

        return {

            //main function
            init: function() {

                Profile.initMiniCharts();
            },

            initMiniCharts: function() {

                // IE8 Fix: function.bind polyfill
                if (App.isIE8() && !Function.prototype.bind) {
                    Function.prototype.bind = function(oThis) {
                        if (typeof this !== "function") {
                            // closest thing possible to the ECMAScript 5 internal IsCallable function
                            throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
                        }

                        var aArgs = Array.prototype.slice.call(arguments, 1),
                            fToBind = this,
                            fNOP = function() {},
                            fBound = function() {
                                return fToBind.apply(this instanceof fNOP && oThis ? this : oThis,
                                    aArgs.concat(Array.prototype.slice.call(arguments)));
                            };

                        fNOP.prototype = this.prototype;
                        fBound.prototype = new fNOP();

                        return fBound;
                    };
                }

                @foreach ($years as $key => $year)

                  $("#sparkline_bar_{{$year}}").sparkline(
                    @php
                      $bar = array();
                      for ($m=1; $m<=12; $m++) {
                        array_push( $bar, getTotalByMonth($inputs_data, $year, $m) );
                      }
                      echo json_encode($bar);
                    @endphp
                      , {
                      type: 'bar',
                      width: '100',
                      barWidth: 6,
                      height: '45',
                      barColor: '#F36A5B',
                      negBarColor: '#e02222'
                  });
                @endforeach

                /*$("#sparkline_bar_2017").sparkline([2, 9, 10, 11, 10, 10, 12, 10, 10, 11, 9, 12, 11], {
                    type: 'bar',
                    width: '100',
                    barWidth: 6,
                    height: '45',
                    barColor: '#F36A5B',
                    negBarColor: '#e02222'
                });
                $("#sparkline_bar_2018").sparkline([8, 9, 10, 11, 10, 10, 12, 10, 10, 11, 9, 12, 11], {
                    type: 'bar',
                    width: '100',
                    barWidth: 6,
                    height: '45',
                    barColor: '#F36A5B',
                    negBarColor: '#e02222'
                });*/
            }

        };

    }();

    if (App.isAngularJsApp() === false) {
        jQuery(document).ready(function() {
            Profile.init();
        });
    }
  </script>
@endsection
