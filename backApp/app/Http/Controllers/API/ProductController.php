<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Products;
use Validator;
use App\Http\Resources\ProductResource;
use Illuminate\Support\Facades\DB;

class ProductController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Products::all();
        return $this->sendResponse(ProductResource::collection($products), 'Products retrieved successfully.');
    }

    public function getBestOffer()
    {
        $products = DB::table('products')
                ->limit(10)
                ->get();
        return $this->sendResponse(ProductResource::collection($products), 'Products retrieved successfully.');
    }
    public function topProoducts()
    {
        $products = DB::table('products')
                ->limit(10)
                ->orderBy('productRank')
                ->get();
        return $this->sendResponse(ProductResource::collection($products), 'Products retrieved successfully.');
    }
    public function getProductbyCategorie(Request $request)
    {
        $categorie = $request->productCategorie;
        $products = DB::table('products')
                ->limit(20)
                ->orderBy('productRank')
                ->where('productCategorie', $categorie)
                ->get();
        return $this->sendResponse(ProductResource::collection($products), 'Products retrieved successfully.');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'productName' => 'required',
            'productPrice' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        if ($request->file('productimage')) {
            $file= $request->file('productimage');
            //$filename= date('YmdHi').$file->getClientOriginalName();
            $filename= date('YmdHi').'.'.$request->file('productimage')->extension();
            if ($input["productCategorie"] == "beans") {
                $file-> move(public_path('images/beans'), $filename);
            } elseif ($input["productCategorie"] == "gifts") {
                $file-> move(public_path('images/gifts'), $filename);
            } elseif ($input["productCategorie"] == "machines") {
                $file-> move(public_path('images/machines'), $filename);
            } elseif ($input["productCategorie"] == "products") {
                $file-> move(public_path('images/products'), $filename);
            }

            $input['productImageUrl']= 'images/'.$input["productCategorie"].'/'.$filename;
        }
        $product = Products::create($input);

        // return $this->sendResponse(new ProductResource($product), 'Product created successfully.');
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::find($id);

        if (is_null($product)) {
            return $this->sendError('Product not found.');
        }

        return $this->sendResponse(new ProductResource($product), 'Product retrieved successfully.');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        /*$input = $request->all();

        $validator = Validator::make($input, [
            'productName' => 'required',
            'productPrice' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $product->name = $input['name'];
        $product->detail = $input['detail'];
        $product->save();

        return $this->sendResponse(new ProductResource($product), 'Product updated successfully.');*/
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return $this->sendResponse([], 'Product deleted successfully.');
    }
}
