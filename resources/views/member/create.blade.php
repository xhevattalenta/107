@php
//use App\Branch;
//$branches = Branch::all();
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
  <link href="{!! asset('assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css') !!}" rel="stylesheet" type="text/css" />
  <link href="{!! asset('assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL PLUGINS -->
@endsection

@section('title', 'Anëtarët')
@section('page-title', 'Anëtarët')
@section('page-subtitle', 'Anëtarët e lagjes')
@section('page-breadcrumb-title', 'Anëtarët')

@section('content')
  <div class="row">
      <div class="col-lg-12 col-xs-12 col-sm-12">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-bubble font-dark hide"></i>
                    <span class="caption-subject font-hide bold uppercase">Shto Anëtarë</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                  <!-- BEGIN FORM-->
                  <form action="/anetar" method="post" class="form-horizontal form-bordered" id="form_shto_kryetar" enctype="multipart/form-data">
                     {{ csrf_field() }}
                      <div class="form-body">
                          <div class="form-group">
                              <label class="control-label col-md-3">Emri dhe Mbiemri</label>
                              <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </span>
                                    <input type="text" name="name" class="form-control" placeholder="Emri dhe Mbiemri" required>
                                </div>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-md-3">Telefoni</label>
                              <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope"></i>
                                    </span>
                                    <input type="text" name="tel" class="form-control" placeholder="Telefoni">
                                </div>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-md-3">Tipi</label>
                              <div class="col-md-3">
                                <select name="anetar" class="form-control">
                                    <option value="1">I lagjes</option>
                                    <option value="0">I Jashtëm</option>
                                </select>
                              </div>
                          </div>
                          <div class="form-group last">
                              <label class="control-label col-md-3">Fotografia</label>
                              <div class="col-md-9">
                                  <div class="fileinput fileinput-new" data-provides="fileinput">
                                      <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                          <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" /> </div>
                                      <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                      <div>
                                          <span class="btn default btn-file">
                                              <span class="fileinput-new"> Selekto Foton </span>
                                              <span class="fileinput-exists"> Ndrysho </span>
                                              <input type="file" name="avatar"> </span>
                                          <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> Remove </a>
                                      </div>
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
  <script src="{!! asset('assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js') !!}" type="text/javascript"></script>
  <script src="{!! asset('assets/pages/scripts/components-bootstrap-select.min.js') !!}" type="text/javascript"></script>
  <!-- END PAGE LEVEL PLUGINS -->
@endsection
