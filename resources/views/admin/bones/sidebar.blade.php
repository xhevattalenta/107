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
            $user = Voyager::model('User')->find(Auth::id());
            $role = $user->role_id;
          @endphp
          @if ($role == 1 || $role == 2)
            <li class="nav-item start active open">
                <a href="/" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">Ballina</span>
                    <span class="selected"></span>
                    <span class="arrow open"></span>
                </a>
            </li>
            <li class="nav-item  ">
              <a href="/kryetaret" class="nav-link nav-toggle">
                  <i class="icon-users"></i>
                  <span class="title">Kryetarët</span>
                  <span class="arrow"></span>
              </a>
            </li>
            <li class="nav-item  ">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-diamond"></i>
                  <span class="title">Anëtarsim</span>
                  <span class="arrow"></span>
              </a>
              <ul class="sub-menu">
                  <li class="nav-item  ">
                      <a href="/lista" class="nav-link ">
                          <span class="title">Lista e anëtarëve</span>
                      </a>
                  </li>
                  <li class="nav-item  ">
                      <a href="/lista/create" class="nav-link ">
                          <span class="title">Shto anëtarë</span>
                      </a>
                  </li>
              </ul>
            </li>
            <li class="nav-item  ">
              <a href="/keshillat" class="nav-link nav-toggle">
                  <i class="icon-users"></i>
                  <span class="title">Këshillat vendor</span>
                  <span class="arrow"></span>
              </a>
            </li>
          @else
            <li class="nav-item  ">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-diamond"></i>
                  <span class="title">Anëtarsim</span>
                  <span class="arrow"></span>
              </a>
              <ul class="sub-menu">
                  <li class="nav-item  ">
                      <a href="/lista" class="nav-link ">
                          <span class="title">Lista e anëtarëve</span>
                      </a>
                  </li>
                  <li class="nav-item  ">
                      <a href="/lista/create" class="nav-link ">
                          <span class="title">Shto anëtarë</span>
                      </a>
                  </li>
              </ul>
            </li>
          @endif
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
