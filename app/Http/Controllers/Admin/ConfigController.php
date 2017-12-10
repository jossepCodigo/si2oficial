<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Config;

class ConfigController extends Controller
{
    public function __construct()
    {
        if(!\Session::has('conf')) \Session::put('config', array());
    }
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        if(!\Session::has('conf')) \Session::put('config', array());
        $idUs = \Auth::user()->id;

        $cf = Config::where('idUs',$idUs)->first();
        \Session::put('conf', $cf);

        return view('admin.config.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }

    public function modificarE(Request $request){
         $idu = \Auth::user()->id;

         $cf = Config::where('idUs',$idu)->first();
         $cf = Config::where('idUs', $idu)->update(array('colorEnc' => $request->encabezado));
         if ($cf==1) {
             $cof = Config::where('idUs',$idu)->first();
            \Session::put('conf', $cof);
         }
         return redirect()->guest('/admin/config');
    }

    public function modificarF(Request $request){
         $idu = \Auth::user()->id;

         $cf = Config::where('idUs',$idu)->first();
         $cf = Config::where('idUs', $idu)->update(array('colorFondo' => $request->fondo));
         if ($cf==1) {
             $cof = Config::where('idUs',$idu)->first();
            \Session::put('conf', $cof);
         }
         return redirect()->guest('/admin/config');
    }

    public function modificarP(Request $request){
         $idu = \Auth::user()->id;

         $cf = Config::where('idUs',$idu)->first();
         $cf = Config::where('idUs', $idu)->update(array('colorPie' => $request->pie));
         if ($cf==1) {
             $cof = Config::where('idUs',$idu)->first();
            \Session::put('conf', $cof);
         }
         return redirect()->guest('/admin/config');
    }

}