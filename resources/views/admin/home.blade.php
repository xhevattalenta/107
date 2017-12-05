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
@section('page-breadcrumb-title', 'Ballina')

@section('content')
  {{--<div class="row">
		@foreach($posts as $post)
			<div class="col-md-3">
				<a href="/post/{{ $post->id }}">
					<img src="{{ Voyager::image( $post->image ) }}" style="width:100%">
					<span>{{ $post->title }}</span>
				</a>
			</div>
		@endforeach
  </div>--}}
  <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="dashboard-stat2 ">
              <div class="display">
                  <div class="number">
                      <h3 class="font-green-sharp">
                          <span data-counter="counterup" data-value="7800">7800</span>
                          <small class="font-green-sharp">den</small>
                      </h3>
                      <small>Para në arkë</small>
                  </div>
                  <div class="icon">
                      <i class="icon-pie-chart"></i>
                  </div>
              </div>
              <div class="progress-info">
                  <div class="progress">
                      <span style="width: 60%;" class="progress-bar progress-bar-success green-sharp">
                          <span class="sr-only">60% progress</span>
                      </span>
                  </div>
                  <div class="status">
                      <div class="status-title"> progres </div>
                      <div class="status-number"> 60% </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="dashboard-stat2 ">
              <div class="display">
                  <div class="number">
                      <h3 class="font-blue-sharp">
                          <span data-counter="counterup" data-value="1349">1349</span>
                          <small class="font-blue-sharp">den</small>
                      </h3>
                      <small>Hyrje</small>
                  </div>
                  <div class="icon">
                      <i class="icon-like"></i>
                  </div>
              </div>
              <div class="progress-info">
                  <div class="progress">
                      <span style="width: 100%;" class="progress-bar progress-bar-success blue-sharp">
                          <span class="sr-only">100% Toatal Hyrje</span>
                      </span>
                  </div>
                  <div class="status">
                      <div class="status-title"> Toatal Hyrje </div>
                      <div class="status-number"> 100% </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="dashboard-stat2 ">
              <div class="display">
                  <div class="number">
                      <h3 class="font-red-haze">
                          <span data-counter="counterup" data-value="567">567</span>
                          <small class="font-red-haze">den</small>
                      </h3>
                      <small>HARXHIME</small>
                  </div>
                  <div class="icon">
                      <i class="icon-basket"></i>
                  </div>
              </div>
              <div class="progress-info">
                  <div class="progress">
                      <span style="width: 40%;" class="progress-bar progress-bar-success red-haze">
                          <span class="sr-only">40% nga hyrjet</span>
                      </span>
                  </div>
                  <div class="status">
                      <div class="status-title"> nga hyrjet </div>
                      <div class="status-number"> 40% </div>
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

  <script src="{!! asset('assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js') !!}" type="text/javascript"></script>

  <script src="{!! asset('assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js') !!}" type="text/javascript"></script>


  <script src="{!! asset('assets/global/plugins/amcharts/amcharts/amcharts.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/amcharts/amcharts/serial.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/amcharts/amcharts/pie.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/amcharts/amcharts/radar.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/amcharts/amcharts/themes/light.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/amcharts/ammap/ammap.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/amcharts/ammap/maps/js/worldLow.js') !!}" type="text/javascript"></script>

  <script src="{!! asset('assets/pages/scripts/charts-amcharts.min.js') !!}" type="text/javascript"></script>


  <script src="{!! asset('assets/pages/scripts/ui-extended-modals.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL PLUGINS -->
  <!-- BEGIN PAGE LEVEL SCRIPTS -->
  <script src="{!! asset('assets/pages/scripts/dashboard.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL SCRIPTS -->
  <script src="{!! asset('js/custom.js') !!}" type="text/javascript"></script>

  <script type="text/javascript">
    $(document).on('click','.mt-actions .mt-action-buttons button.refuzo',function(){
        $('#refuzim').data( 'memberId', $(this).data('id') );
        $('#refuzim').data( 'status', $(this).data('action') );
    });

    $(document).on('click','button#modal_refuzo',function(){
      var id = $('#refuzim').data( 'memberId');
      var status = $('#refuzim').data( 'status');
      var message = $('#refuzim textarea#shkaku').val();
      changeMemberStatus(id, status, message);
    });
    $(document).on('click','button.mirato',function(){
      var id = $(this).data('id');
      var status = $(this).data('action');
      var message = '';
      changeMemberStatus(id, status, message);
    });

    function changeMemberStatus(id, action, message) {
        $.ajax({
            data:{ id: id, status: action, shkaku: message, _token: '{!! csrf_token() !!}' },
            url: 'lista_ajax',
            type: 'POST',
            dataType: 'json',

            success: function(data) {
              console.log("error");
              console.log(data);
              Layout.loadAjaxContent('lista_ajaxload');
              $('.nav-tabs li:first-child a').trigger('click');
            },
            error: function(data) {
              console.log("error");
              console.log(data);
            }
       });
    }

  </script>
@endsection
