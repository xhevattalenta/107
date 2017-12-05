@php
use TCG\Voyager\Models\Post;
//$posts = TCG\Voyager\Models\Post::all();
$posts = Voyager::model('Post')::all();
@endphp

{{-- $posts = Voyager::model('Post')::find(1)->get() --}}



<div class="portlet light portlet-fit ">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-microphone font-dark hide"></i>
            <span class="caption-subject bold font-dark uppercase"> Lajmet e Fundit</span>
            <span class="caption-helper">default option...</span>
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
        <div class="row">
            @foreach ( $posts as $post)
            <div class="col-md-3">
                <div class="mt-widget-2">
                    <div class="mt-head" style="background-image: url( {{ Voyager::image($post->image) }} );">
                        <div class="mt-head-label">
                            <button type="button" class="btn btn-{{ $post->category->btn_type }}">{{ $post->category->name }}</button>
                        </div>
                        <div class="mt-head-user">
                            <div class="mt-head-user-img">
                                <img src="{{ Voyager::image($post->authorId->avatar) }}"> </div>
                            <div class="mt-head-user-info">
                                <span class="mt-user-name">{{ $post->authorId->name }}</span>
                                <span class="mt-user-time">
                                    <i class="icon-clock"></i> {{ $post->created_at }} </span>
                            </div>
                        </div>
                    </div>
                    <div class="mt-body">
                        <h3 class="mt-body-title"> {{ $post->title }} </h3>
                        <p class="mt-body-description"> {{ $post->excerpt }} </p>

                        <div class="mt-body-actions">
                            <div class="btn-group btn-group btn-group-justified">
                                <a href=" {{ route('voyager.lajmi', ['post' => $post->id]) }} " class="btn">
                                    <i class="icon-bubbles"></i> Lexo </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
