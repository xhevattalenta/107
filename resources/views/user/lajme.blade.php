@php
use TCG\Voyager\Models\Post;
use TCG\Voyager\Models\User;
//$posts = TCG\Voyager\Models\Post::all();
//$posts = Voyager::model('Post')::all();
$posts = Voyager::model('Post')::orderBy('created_at', 'desc')->get();
echo '<pre>';
//print_r($posts);
echo '</pre>';
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
                            <button type="button" class="btn btn-{{ Voyager::model('User')::find($post->category_id)->first()->btn_type }}">{{ Voyager::model('User')::find($post->category_id)->first()->name }}</button>
                        </div>
                        <div class="mt-head-user">
                            <div class="mt-head-user-img">
                                <img src="{{ Voyager::image( Voyager::model('User')::find($post->authorId)->first()->avatar) }}"> </div>
                            <div class="mt-head-user-info">
                                <span class="mt-user-name">{{ Voyager::model('User')::find($post->authorId)->first()->name }}</span>
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
