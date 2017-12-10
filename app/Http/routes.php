<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
| Here is where you can register all of the routes for an application.
| and give it the controller to call when that URI is requested.
*/

Route::bind('product', function($slug){
	return App\Product::where('slug', $slug)->first();
});

// Category dependency injection
Route::bind('category', function($category){
    return App\Category::find($category);
});

// Category dependency injection
Route::bind('id', function($id){
    return App\Faq::find($id);
});

// User dependency injection
Route::bind('user', function($user){
    return App\User::find($user);
});

Route::bind('order', function($order){
    return App\Order::find($order);
});

Route::bind('descuento', function($order){
    return App\Descuento::find($order);
});

Route::get('/', [
	'as' => 'home',
	'uses' => 'StoreController@index'
]);
Route::get('ropa-deportiva', [
	'as' => 'ropa-deportiva',
	'uses' => 'StoreController@index1'
]);
Route::get('ropa-de-gala', [
	'as' => 'ropa-de-gala',
	'uses' => 'StoreController@index2'
]);
Route::get('ropa-casual', [
	'as' => 'ropa-casual',
	'uses' => 'StoreController@index3'
]);
Route::get('ropa-de-playa', [
	'as' => 'ropa-de-playa',
	'uses' => 'StoreController@index4'
]);
Route::get('ropa-de-invierno', [
	'as' => 'ropa-de-invierno',
	'uses' => 'StoreController@index5'
]);



Route::get('product/{slug}', [
	'as' => 'product-detail',
	'uses' => 'StoreController@show'
]);

// Carrito -------------

Route::get('cart/show', [
	'as' => 'cart-show',
	'uses' => 'CartController@show'
]);

Route::get('cart/add/{product}', [
	'as' => 'cart-add',
	'uses' => 'CartController@add'
]);

Route::get('cart/delete/{product}',[
	'as' => 'cart-delete',
	'uses' => 'CartController@delete'
]);

Route::get('cart/trash', [
	'as' => 'cart-trash',
	'uses' => 'CartController@trash'
]);

Route::get('cart/update/{product}/{quantity}', [
	'as' => 'cart-update',
	'uses' => 'CartController@update'
]);

Route::get('order-detail', [
	'middleware' => 'auth:user',
	'as' => 'order-detail',
	'uses' => 'CartController@orderDetail'
]);


// Authentication routes...
Route::get('auth/login', [
	'as' => 'login-get',
	'uses' => 'Auth\AuthController@getLogin'
]);

Route::post('auth/login', [
	'as' => 'login-post',
	'uses' => 'Auth\AuthController@postLogin'
]);

Route::get('auth/logout', [
	'as' => 'logout',
	'uses' => 'Auth\AuthController@getLogout'
]);

// Registration routes...
Route::get('auth/register', [
	'as' => 'register-get',
	'uses' => 'Auth\AuthController@getRegister'
]);

Route::post('auth/register', [
	'as' => 'register-post',
	'uses' => 'Auth\AuthController@postRegister'
]);

// Paypal

// Enviamos nuestro pedido a PayPal
Route::get('payment', array(
	'as' => 'payment',
	'uses' => 'PaypalController@postPayment',
));

// Después de realizar el pago Paypal redirecciona a esta ruta
Route::get('payment/status', array(
	'as' => 'payment.status',
	'uses' => 'PaypalController@getPaymentStatus',
));

Route::get('simulado', array(
	'as' => 'simulado',
	'uses' => 'SimuladoController@pagado',
));

Route::get('faqs', array(
	'as' => 'faqs',
	'uses' => 'admin\FaqController@index1',
));

// ADMIN -------------
//Route::post('admin/config/modificarE', 'ConfigController@modificarE');

Route::group(['namespace' => 'Admin', 'middleware' => ['auth'], 'prefix' => 'admin'], function()
{
	Route::get('home/{id}', 'HomeController@index');

	Route::resource('bitacora','BitacoraController');
	
	Route::resource('faq','FaqController');

	Route::resource('category','CategoryController');

	Route::resource('product','ProductController');

	Route::resource('user','UserController');

	//Route::resource('config','ConfigController');
	Route::post('config/modificarE','ConfigController@modificarE');

	Route::post('envio/modificarE','EnvioController@modificarE');

	Route::get('config', [
		'as' => 'admin.config.index',
		'uses' => 'ConfigController@index'
	]);

	Route::post('config/modificarF','ConfigController@modificarF');	

	Route::get('envio', [
		'as' => 'admin.envio.index',
		'uses' => 'EnvioController@index'
	]);

	Route::post('config/modificarP','ConfigController@modificarP');

	Route::get('orders', [
		'as' => 'admin.order.index',
		'uses' => 'OrderController@index'
	]);

	Route::post('order/get-items', [
	    'as' => 'admin.order.getItems',
	    'uses' => 'OrderController@getItems'
	]);

     Route::get('orders/update/{id}', [
	'as' => 'admin.order.update',
	'uses' => 'OrderController@update'
	]);

	Route::post('order/{id}', [
	    'as' => 'admin.order.destroy',
	    'uses' => 'OrderController@destroy'
	]);

	Route::get('show', [
		'as' => 'show',
		'uses' => 'OrderController@show'
	]);
});