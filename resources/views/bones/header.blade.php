<?php
$user_avatar = Voyager::image(Auth::user()->avatar);
if ((substr(Auth::user()->avatar, 0, 7) == 'http://') || (substr(Auth::user()->avatar, 0, 8) == 'https://')) {
    $user_avatar = Auth::user()->avatar;
}
?>

<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner ">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="./">
                <?php $admin_logo_img = Voyager::setting('admin.icon_image', ''); ?>
                @if($admin_logo_img == '')
                    <img src="{{ voyager_asset('images/logo-icon-light.png') }}" alt="logo" class="logo-default" />
                @else
                    <img src="{{ Voyager::image($admin_logo_img) }}" alt="logo" class="logo-default" />
                @endif
            </a>
            <div class="menu-toggler sidebar-toggler">
                <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
            </div>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN PAGE ACTIONS -->
        <!-- DOC: Remove "hide" class to enable the page header actions -->
        <div class="page-actions">
            <div class="btn-group">
                <button type="button" class="btn btn-circle btn-outline red dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-plus"></i>&nbsp;
                    <span class="hidden-sm hidden-xs">Shto&nbsp;</span>&nbsp;
                    <i class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu" role="menu">
                    @php
                      $user_role = Voyager::model('User')->find( Auth::id() )->role_id;
                      $role = Voyager::model('Role')->find($user_role)->name;
                    @endphp
                    @if ($role == 'admin' || $role == 'subadmin')
                      <li>
                          <a href="/kryetaret/create">
                              <i class="icon-users"></i> Kryetar të ri </a>
                      </li>
                      <li>
                          <a href="/lista/create">
                              <i class="icon-user"></i> Anëtar të ri </a>
                      </li>
                    @else
                      <li>
                          <a href="/lista/create">
                              <i class="icon-user"></i> Anëtar të ri </a>
                      </li>
                    @endif
                </ul>
            </div>
        </div>
        <!-- END PAGE ACTIONS -->
        <!-- BEGIN PAGE TOP -->
        <div class="page-top">
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-user">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <img alt="" class="img-circle" src="{{ $user_avatar }}" />
                            <span class="username username-hide-on-mobile"> {{ Auth::user()->name }} </span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                            <li>
                                <a href="javascript:void(0)">
                                  <div class="profile-body">
                                      <h5>{{ Auth::user()->name }}</h5>
                                      <h6>{{ Auth::user()->email }}</h6>
                                  </div> </a>
                            </li>
                            <li>
                                <a href="{{ route('voyager.profile') }}">
                                    <i class="icon-user"></i> Profili </a>
                            </li>
                            <li class="divider"> </li>
                            <li>
                              <form action="{{ route('voyager.logout') }}" method="POST">
                                {{ csrf_field() }}
                                <button type="submit" class="btn btn-danger btn-block">
                                  <i class="icon-key"></i>
                                  Log Out
                                </button>
                              </form>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                    <!-- END QUICK SIDEBAR TOGGLER -->
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
        </div>
        <!-- END PAGE TOP -->
    </div>
    <!-- END HEADER INNER -->
</div>
