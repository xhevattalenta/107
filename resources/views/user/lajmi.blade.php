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

@extends('voyager::master')

@section('css')
    <link href="{!! asset('assets/pages/css/blog.min.css') !!}" rel="stylesheet" type="text/css" />
@stop

@section('content')
    <div class="container">
        @include('voyager::alerts')

        <div class="page-content">
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
      </div>
    </div>
@stop
