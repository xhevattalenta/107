<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\Storage;
use App\Output;

class OutputController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('finance.dalje.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $o = new Output;
        $o->details = request('detaje');
        $o->vlera = request('vlera');
        $o->data = date("Y-m-d H:i:s", strtotime( request('data') ));
        $o->save();

        Session::flash('flash_message', 'Harxhimi u ruajt me sukses.');
        return View('finance.dalje.create', compact('m', $o) );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('finance.dalje.edit', ['o' => Output::where('id', $id)->firstOrFail() ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $o = Output::where('id', $id)->firstOrFail();
        $o->details = request('detaje');
        $o->vlera = request('vlera');
        $o->data = date("Y-m-d H:i:s", strtotime( request('data') ));
        $o->save();

        Session::flash('flash_message', 'Harxhimi u ndryshua me sukses.');
        return redirect('financat');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Output::findorFail($id)->delete();

        Session::flash('flash_message', 'Harxhimimi u fshij me sukses.');
        return redirect('financat');
    }
}
