<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;

class UserController extends Controller
{
    public function is_admin($id = null){
        $id = ($id == null) ? Auth::id() : $id;
        $user_role = Voyager::model('User')->find($id)->role_id;
        $role = Voyager::model('Role')->find($user_role)->name;
        if ($role == 'admin' || $role == 'subadmin') {
          return true;
        }
        else {
          return false;
        }
    }
    public function user_role($id = null){
        $id = ($id == null) ? Auth::id() : $id;
        $user_role = Voyager::model('User')->find($id)->role_id;
        $role = Voyager::model('Role')->find($user_role)->name;
        return $role;
    }


    public function index()
    {
       $user = Voyager::model('User')->find(Auth::id());
       $role = $user->role_id;
       if( $this->user_role() == 'admin') {
         return Voyager::view('voyager::index', compact('role', $role) );
       }
       elseif( $this->user_role() == 'subadmin' ) {
         return Voyager::view('admin.home', compact('role', $role) );
       }
       else {
         return Voyager::view('admin.home', compact('role', $role) );
       }
       //return Voyager::view('admin.home');
   }

}
