@php
  /*use App\Member;
  use App\Branch;
  $members = Member::all();
  $members_pritje = Member::where("status", 0)->get();
  $members_zgjedhur = Member::where("status", 1)->get();
  $members_refuzuar = Member::where("status", 2)->get();


  $u_count = Voyager::model('User')::where('role_id', 3)->count();
  $b_count = Branch::all()->count();
  $m_count = Member::all()->count();*/

  $inputs  = App\Input::all();
  $outputs = App\Output::all();
  $total_input  = $inputs->sum('vlera');
  $total_output = $outputs->sum('vlera');
  $total_arka   = $total_input - $total_output;
@endphp
@extends('admin.layouts.skeleton')

@section('styles')
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <link href="{!! asset('assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/morris/morris.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/jqvmap/jqvmap/jqvmap.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL PLUGINS -->
  <!-- BEGIN THEME GLOBAL STYLES -->
  <link href="{!! asset('assets/global/css/components-md.min.css') !!}" rel="stylesheet" id="style_components" type="text/css" />
  <link href="{!! asset('assets/global/css/plugins-md.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END THEME GLOBAL STYLES -->
  <!-- BEGIN THEME LAYOUT STYLES -->
  <link href="{!! asset('assets/layouts/layout2/css/layout.min.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/layouts/layout2/css/themes/blue.min.css') !!}" rel="stylesheet" type="text/css" id="style_color" />
  <link href="{!! asset('assets/layouts/layout2/css/custom.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END THEME LAYOUT STYLES -->
@endsection

@section('title', 'Ballina')
@section('page-title', 'Admin Ballina')
@section('page-subtitle', 'statistics, recent events and reports')
@section('page-breadcrumb-title', '')

@section('content')
  <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="dashboard-stat2 ">
              <div class="display">
                  <div class="number">
                      <h3 class="font-blue-sharp">
                          <span data-counter="counterup" data-value="{{$total_input}}">{{$total_input}}</span>
                          <small class="font-blue-sharp">den</small>
                      </h3>
                      <small>Hyrje Totale</small>
                  </div>
                  <div class="icon">
                      <i class="icon-briefcase"></i>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="dashboard-stat2 ">
              <div class="display">
                  <div class="number">
                      <h3 class="font-red-haze">
                          <span data-counter="counterup" data-value="{{$total_output}}">{{$total_output}}</span>
                          <small class="font-red-haze">den</small>
                      </h3>
                      <small>Harxhime Totale</small>
                  </div>
                  <div class="icon">
                      <i class="icon-basket"></i>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="dashboard-stat2 ">
              <div class="display">
                  <div class="number">
                      <h3 class="font-green-sharp">
                          <span data-counter="counterup" data-value="{{$total_arka}}">{{$total_arka}}</span>
                          <small class="font-green-sharp">den</small>
                      </h3>
                      <small>Para në arkë</small>
                  </div>
                  <div class="icon">
                      <i class="icon-users"></i>
                  </div>
              </div>
          </div>
      </div>
  </div>

  <div class="row">
      <div class="col-lg-12 col-xs-12 col-sm-12">
          @include('user.lajme')
      </div>
  </div>

@endsection

@section('scripts')
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <script src="{!! asset('assets/global/plugins/moment.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/morris/morris.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/morris/raphael-min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/counterup/jquery.waypoints.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/counterup/jquery.counterup.min.js') !!}" type="text/javascript"></script>

  <script src="{!! asset('assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js') !!}" type="text/javascript"></script>


  <script src="{!! asset('assets/pages/scripts/ui-extended-modals.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL PLUGINS -->
  <!-- BEGIN PAGE LEVEL SCRIPTS -->
  <script src="{!! asset('assets/pages/scripts/dashboard.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL SCRIPTS -->
  <script src="{!! asset('js/custom.js') !!}" type="text/javascript"></script>
@endsection
