<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id('productId');
            $table->string('productName');
            $table->string('productImageUrl');
            $table->float('productPrice');
            $table->float('productPercentage');
            $table->integer('productRank');
            $table->float('productRate');
            $table->string('productDescription');
            $table->string('productCategorie');
            $table->boolean('productIsAvailable');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
};
