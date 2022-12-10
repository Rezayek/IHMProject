<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'productId ' => $this->productId,
            'productName' => $this->productName,
            'productDescription' => $this->productDescription,
            'productImageUrl' => $this->productImageUrl,
            'productPrice' => $this->productPrice,
            'productPercentage' => $this->productPercentage,
            'productRank' => $this->productRank,
            'productRate' => $this->productRate,
            'productIsAvailable' => $this->productIsAvailable,

        ];
    }
}
