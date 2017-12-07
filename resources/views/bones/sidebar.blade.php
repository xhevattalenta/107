<div class="page-sidebar-wrapper">
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed page-sidebar-menu-hover-submenu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
          @php
            $user_role = Voyager::model('User')->find( Auth::id() )->role_id;
            $role = Voyager::model('Role')->find($user_role)->name;
          @endphp
          @if ($role == 'admin' || $role == 'subadmin')
            <li class="nav-item start active open">
                <a href="/" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">Ballina</span>
                    <span class="selected"></span>
                    <span class="arrow open"></span>
                </a>
            </li>
            <li class="nav-item  ">
              <a href="/anetaret" class="nav-link nav-toggle">
                  <i class="icon-users"></i>
                  <span class="title">Anëtarët</span>
                  <span class="arrow"></span>
              </a>
              <ul class="sub-menu">
                  <li class="nav-item ">
                      <a href="/anetar/create" class="nav-link "> Shto te ri </a>
                  </li>
              </ul>
            </li>
            <li class="nav-item  ">
              <a href="/financat" class="nav-link nav-toggle">
                  <i class="icon-bar-chart"></i>
                  <span class="title">Financat</span>
                  <span class="arrow"></span>
              </a>
            </li>
            <li class="nav-item  ">
              <a href="/hyrje/create" class="nav-link nav-toggle">
                  <i class="icon-briefcase"></i>
                  <span class="title">Shto Hyrje</span>
                  <span class="arrow"></span>
              </a>
            </li>
            <li class="nav-item  ">
              <a href="/dalje/create" class="nav-link nav-toggle">
                  <i class="icon-basket"></i>
                  <span class="title">Shto Harxhim</span>
                  <span class="arrow"></span>
              </a>
            </li>
            <li class="nav-item  ">
              <a href="/posts" class="nav-link nav-toggle">
                  <i class="icon-feed"></i>
                  <span class="title">Lajmet</span>
                  <span class="arrow"></span>
              </a>
              <ul class="sub-menu">
                  <li class="nav-item ">
                      <a href="/posts/create" class="nav-link "> Shto te ri </a>
                  </li>
              </ul>
            </li>
          @else
            <li class="nav-item start active open">
                <a href="/" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">Ballina</span>
                    <span class="selected"></span>
                    <span class="arrow open"></span>
                </a>
            </li>
            <li class="nav-item  ">
              <a href="/anetaret" class="nav-link nav-toggle">
                  <i class="icon-users"></i>
                  <span class="title">Anëtarët</span>
                  <span class="arrow"></span>
              </a>
            </li>
            <li class="nav-item  ">
              <a href="/financat" class="nav-link nav-toggle">
                  <i class="icon-bar-chart"></i>
                  <span class="title">Financat</span>
                  <span class="arrow"></span>
              </a>
            </li>
          @endif
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
