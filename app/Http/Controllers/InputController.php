<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\Storage;
use App\Input;
use App\Member;

class InputController extends Controller
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
        return view('finance.hyrje.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $i = new Input;
        $i->member_id = request('member');
        $i->kontributi = request('kontributi');
        $i->details = request('detaje');
        $i->vlera = request('vlera');
        $i->data = date("Y-m-d H:i:s", strtotime( request('data') ));
        $i->save();

        Session::flash('flash_message', 'Hyrja u ruajt me sukses.');
        return View('finance.hyrje.create', compact('m', $m) );
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
        return view('finance.hyrje.edit', ['i' => Input::where('id', $id)->firstOrFail() ]);
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
        $i = Input::where('id', $id)->firstOrFail();
        //$m->member_id = $id;
        $i->kontributi = request('kontributi');
        $i->details = request('detaje');
        $i->vlera = request('vlera');
        $i->data = date("Y-m-d H:i:s", strtotime( request('data') ));
        $i->save();

        Session::flash('flash_message', 'Hyrja u ndryshua me sukses.');
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
        Input::findorFail($id)->delete();

        Session::flash('flash_message', 'Hyrja u fshij me sukses.');
        return redirect('financat');
    }
}
