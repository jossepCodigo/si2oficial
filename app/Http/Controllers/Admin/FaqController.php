<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Bitacora;
use App\Faq;

class FaqController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $faq = Faq::all();
        //dd($faqs);
        return view('admin.faq.index',compact('faq'));
    }

    public function index1()
    {
        //$products = Product::where('category_id','=',2);
        //dd($products);
        $faq = Faq::all();
        return view('faqs/index', compact('faq'));
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.faq.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //return $request->all();
        $this->validate($request, [
          'categoria' => 'required|max:255'
          /*'pregunta' => 'required|max:255',
          'respuesta' => 'required|max:255',
          'iduser' => 'required',*/
        ]);

        $User1 = \Auth::user()->id;
        $faq = Faq::create([
            'categoria' => $request->get('categoria'),
            'slug' => str_slug($request->get('id')),
            'pregunta' => $request->get('pregunta'),
            'respuesta' => $request->get('respuesta'),
            'iduser' => $User1
        ]);

        $bitacora = new Bitacora;
        $User = \Auth::user()->user;
        $now = new \DateTime();
        $bitacora->user=$User;
        $bitacora->fechahora=$now;
        $bitacora->accion="Inserto";        
        $bitacora->descripcion="Categoria/Pregunta/Respuesta en la tabla Faq";
        $bitacora->save();      
        
        $message = $faq ? 'Faq agregada correctamente!' : 'La Faq NO pudo agregarse!';
        
        return redirect()->route('admin.faq.index')->with('message', $message);
        
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Faq $faq)
    {
        return $faq;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Faq $faq)
    {       
        return view('admin.faq.edit', compact('faq'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Faq $faq)
    {
        $faq->fill($request->all());
        $faq->slug = str_slug($request->get('id'));
        
        $updated = $faq->save();
        $message = $updated ? 'Faq actualizada correctamente!' : 'La Faq No pudo actualizarse!';
        return redirect()->route('admin.faq.index')->with('message',$message);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Faq $faq)
    {
        $deleted = $faq->delete();
        $message = $deleted ? 'Faq eliminada correctamente!' : 'La Faq No pudo eliminarse!';
        return redirect()->route('admin.faq.index')->with('message',$message);
    }
}
