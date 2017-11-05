<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Order;
use App\OrderItem;
use App\Stock;

class SimuladoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //
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

    public function pagado(){
        $this->saveOrder(\Session::get('cart'));
        $this->actualizarStock(\Session::get('cart'));
        
        \Session::forget('cart'); //limpia el carrito de compras

        return \Redirect::route('home')->with('message', 'Compra realizada de forma correcta');
    }

    private function saveOrder($cart)
    {
        $subtotal = 0;
        foreach($cart as $item){    
            $subtotal += $item->price * $item->quantity;
        }
        
        $order = Order::create([
            'subtotal' => $subtotal,
            'shipping' => 20,
            'estado'=>"no cancelado",
            'user_id' => \Auth::user()->id
        ]);
        
        foreach($cart as $item){
            $this->saveOrderItem($item, $order->id);
        }
    }

        private function actualizarStock($cart)
        {
            foreach($cart as $item){
                $id_prod =$item->id;
                $stock=Stock::where('id_prod', $id_prod)->first();
                $actual=$stock->cantidad;
                $nuevo=$actual-$item->quantity;
                $stock=Stock::where('id_prod', $id_prod)->update(array('cantidad' => $nuevo));
            }
        }
    
    private function saveOrderItem($item, $order_id)
    {
        OrderItem::create([
            'quantity' => $item->quantity,
            'price' => $item->price,
            'product_id' => $item->id,
            'order_id' => $order_id
        ]);
    }
}