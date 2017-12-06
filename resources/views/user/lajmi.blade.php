@php
use TCG\Voyager\Models\Post;



//$posts = TCG\Voyager\Models\Post::all();
$post = Voyager::model('Post')::find( $id );
/*
echo "<pre>";
print_r($post);
echo "</pre>";
*/
@endphp
@extends('admin.layouts.skeleton')

@section('styles')
  <!-- BEGIN THEME GLOBAL STYLES -->
  <link href="{!! asset('assets/global/css/components-md.min.css') !!}" rel="stylesheet" id="style_components" type="text/css" />
  <link href="{!! asset('assets/global/css/plugins-md.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END THEME GLOBAL STYLES -->
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <link href="{!! asset('assets/pages/css/blog.min.css') !!}" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL PLUGINS -->
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
  <div class="blog-page blog-content-2">
      <div class="row">
          <div class="col-lg-12">
              <div class="blog-single-content bordered blog-container">
                  <div class="blog-single-head">
                      <h1 class="blog-single-head-title">{{ $post->title }}</h1>
                      <div class="blog-single-head-date">
                          <i class="icon-calendar font-blue"></i>
                          <a href="javascript:;">{{ $post->created_at }}</a>
                      </div>
                  </div>
                  <div class="blog-single-img">
                      <img src=" {{ Voyager::image($post->image) }} " /> </div>
                  <div class="blog-single-desc">
                      {!! $post->body !!}
                  </div>
                  @if (!empty( $post->meta_keywords) )
                      <div class="blog-single-foot">
                          <ul class="blog-post-tags">
                              @foreach ( explode( ",", $post->meta_keywords ) as $keyword )
                                <li class="uppercase">
                                    <a href="javascript:;">{{ $keyword }}</a>
                                </li>
                              @endforeach
                          </ul>
                      </div>
                  @endif
              </div>
          </div>
      </div>
  </div>

@endsection

@section('scripts')
@endsection
