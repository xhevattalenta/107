@php
use App\Member;
$member = $m;


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
                  <!-- BEGIN PORTLET -->
                  <div class="portlet light ">
                      <div class="portlet-title">
                          <div class="caption caption-md">
                              <i class="icon-bar-chart theme-font hide"></i>
                              <span class="caption-subject font-blue-madison bold uppercase">Kontributi</span>
                              <span class="caption-helper hide">weekly stats...</span>
                          </div>
                          <div class="actions">
                              <div class="btn-group btn-group-devided" data-toggle="buttons">
                                  <label class="btn btn-transparent grey-salsa btn-circle btn-sm active">
                                      <input type="radio" name="options" class="toggle" id="option1">2017</label>
                                  <label class="btn btn-transparent grey-salsa btn-circle btn-sm">
                                      <input type="radio" name="options" class="toggle" id="option2">2018</label>
                              </div>
                          </div>
                      </div>
                      <div class="portlet-body">
                          <div class="row number-stats margin-bottom-30">
                              <div class="col-md-12">
                                  <div class="stat-left">
                                      <div class="stat-chart">
                                          <!-- do not line break "sparkline_bar" div. sparkline chart has an issue when the container div has line break -->
                                          <div id="sparkline_bar"></div>
                                      </div>
                                      <div class="stat-number">
                                          <div class="title"> Total </div>
                                          <div class="number"> 2460 </div>
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
                                      </tr>
                                  </thead>
                                  <tr>
                                      <td class="">Antarsim</td>
                                      <td></td>
                                      <td> 1200 den </td>
                                      <td> 12.11.2017 </td>
                                  </tr>
                                  <tr>
                                      <td class="">Doreza</td>
                                      <td>400 palë doreza</td>
                                      <td>  </td>
                                      <td> 12.11.2017 </td>
                                  </tr>
                              </table>
                          </div>
                      </div>
                  </div>
                  <!-- END PORTLET -->
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

                $("#sparkline_bar").sparkline([8, 9, 10, 11, 10, 10, 12, 10, 10, 11, 9, 12, 11], {
                    type: 'bar',
                    width: '100',
                    barWidth: 6,
                    height: '45',
                    barColor: '#F36A5B',
                    negBarColor: '#e02222'
                });
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
