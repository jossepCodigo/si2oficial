<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Product;

class StoreController extends Controller
{
    public function index()
    {
    	//$products = Product::where('category_id','=',2);
    	//dd($products);
    	 $products = Product::all();
        //dd($products);
        return view('store.index', compact('products'));
    }

    public function show($slug)
    {
    	$product = Product::where('slug', $slug)->first();
    	//dd($product);

    	return view('store.show', compact('product'));
    }

    public function index1()
    {
        //$products = Product::where('category_id','=',2);
        //dd($products);
         $products=DB::table('products')
            ->select('products.*')
            ->where('category_id','=',1)
            ->get();
        return view('store.index', compact('products'));
    }
    public function index2()
    {
        //$products = Product::where('category_id','=',2);
        //dd($products);
         $products=DB::table('products')
            ->select('products.*')
            ->where('category_id','=',2)
            ->get();
        return view('store.index', compact('products'));
    }

    public function index3()
    {
        //$products = Product::where('category_id','=',2);
        //dd($products);
         $products=DB::table('products')
            ->select('products.*')
            ->where('category_id','=',3)
            ->get();
        return view('store.index', compact('products'));
    }
    public function index4()
    {
        //$products = Product::where('category_id','=',2);
        //dd($products);
         $products=DB::table('products')
            ->select('products.*')
            ->where('category_id','=',4)
            ->get();
        return view('store.index', compact('products'));
    }
    public function index5()
    {
        //$products = Product::where('category_id','=',2);
        //dd($products);
         $products=DB::table('products')
            ->select('products.*')
            ->where('category_id','=',5)
            ->get();
        return view('store.index', compact('products'));
    }

}
