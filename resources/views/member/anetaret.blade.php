@php
use App\Member;
//$members = Member::all();
$members = Member::orderByDesc('anetar')->get();
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
@endsection

@section('title', 'Anëtarët')
@section('page-title', 'Anëtarët')
@section('page-subtitle', 'Anëtarët e lagjës')
@section('page-breadcrumb-title', 'Anëtarët')

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
                    <span class="caption-subject font-hide bold uppercase">Lista e Anëtarëve</span>
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <a class="btn green-haze btn-outline btn-circle btn-sm" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> SHTO
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="/anetar/create"> Shto të ri</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row flexrow">
                    @foreach($members as $member)
                      <div class="col-md-2">
                          <div class="mt-widget-1 mt-element-ribbon">
                              @if ( $member->anetar == 1 )
                                <div class="ribbon ribbon-vertical-left ribbon-color-warning uppercase">
                                    <i class="fa fa-user"></i>
                                </div>
                              @else
                                <div class="ribbon ribbon-vertical-left ribbon-color-default uppercase">
                                    <i class="fa fa-group"></i>
                                </div>
                              @endif
                              <div class="ribbon-content">
                                @php
                                  $user_role = Voyager::model('User')->find( Auth::id() )->role_id;
                                  $role = Voyager::model('Role')->find($user_role)->name;
                                @endphp
                                @if ($role == 'admin' || $role == 'subadmin')
                                  <div class="mt-icon">
                                      <a href="/anetar/{{$member->id}}/edit" class="btn btn-icon-only blue" style="float: left;">
                                          <i class="fa fa-edit"></i>
                                      </a>
                                      <form action="/anetar/{{$member->id}}" method="post" style="float: left;">
                                        {{ csrf_field() }}
                                        <input name="_method" type="hidden" value="DELETE">
                                        <button type="submit" class="btn btn-icon-only red"><i class="icon-trash"></i></button>
                                      </form>

                                  </div>
                                @endif
                                <div class="mt-img">
                                    <img src="{{ Voyager::image( $member->image ) }}">
                                </div>
                                <div class="mt-body">
                                    <h3 class="mt-username"> {{ $member->name }}</h3>
                                    <p class="mt-user-title"> {{ $member->tel }} </p>
                                        @if ( $member->anetar == 1 )
                                          <i class="fa fa-user"></i>
                                          <div> I Lagjes </div>
                                        @else
                                          <i class="fa fa-group"></i>
                                          <div> I Jashtëm </div>
                                        @endif
                                    <div class="mt-stats">
                                        <div class="btn-group btn-group btn-group-justified">
                                            <a href="anetar/{{$member->id}}" class="btn font-{{ ($member->anetar == 1) ? 'black' : 'red' }}">
                                                <i class="icon-user"></i>Detaje
                                            </a>
                                        </div>
                                    </div>
                                </div>
                              </div>
                          </div>
                      </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
  </div>
@endsection

@section('scripts')

@endsection
