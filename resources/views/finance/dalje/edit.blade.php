@php
use App\Input;
$output = $o;
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
  <link href="{!! asset('assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL PLUGINS -->
@endsection

@section('title', 'Daljet')
@section('page-title', 'Daljet')
@section('page-subtitle', 'Të hollat dhe materialet')
@section('page-breadcrumb-title', 'Daljet')

@section('content')
  @if(Session::has('flash_message'))
    <p class="alert alert-info">{{ Session::get('flash_message') }}</p>
  @endif
  <div class="row">
      <div class="col-lg-12 col-xs-12 col-sm-12">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-bubble font-dark hide"></i>
                    <span class="caption-subject font-hide bold uppercase">Shto dalje të re</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                  <!-- BEGIN FORM-->
                  <form action="/dalje/{{$output->id}}" method="post" class="form-horizontal form-bordered" id="form_shto_kryetar" enctype="multipart/form-data">
                     {{ csrf_field() }}
                     <input name="_method" type="hidden" value="PUT">
                      <div class="form-body">
                          <div class="form-group">
                              <label class="control-label col-md-3">Detajet</label>
                              <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </span>
                                    <textarea name="detaje" rows="4" cols="80" class="form-control" placeholder="Detajet">{{ $output->details }}</textarea>
                                </div>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-md-3">Vlera</label>
                              <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </span>
                                    <input type="number" name="vlera" class="form-control" value="{{ $output->kontributi }}">
                                </div>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-md-3">Data</label>
                              <div class="col-md-4">
                                  <div class="input-group date date-picker" data-date-format="dd-mm-yyyy">
                                      <input type="text" class="form-control" name="data" value="{{ date("d-m-Y", strtotime($output->data) ) }}" required>
                                      <span class="input-group-btn">
                                          <button class="btn default" type="button">
                                              <i class="fa fa-calendar"></i>
                                          </button>
                                      </span>
                                  </div>
                              </div>
                          </div>


                      </div>
                      <div class="form-actions">
                          <div class="row">
                              <div class="col-md-offset-3 col-md-9">
                                  <button type="submit" class="btn green">Ruaj</button>
                                  <button type="reset" class="btn default">Reseto</button>
                              </div>
                          </div>
                      </div>
                  </form>
                  <!-- END FORM-->
                </div>
            </div>
        </div>
    </div>
  </div>
@endsection

@section('scripts')
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <script src="{!! asset('assets/global/plugins/jquery-validation/js/jquery.validate.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/pages/scripts/form-validation.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/pages/scripts/components-bootstrap-select.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL PLUGINS -->
@endsection
