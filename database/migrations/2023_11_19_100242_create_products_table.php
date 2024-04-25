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
            $table->id();
            $table->string('name', 191);
            $table->text('description')->nullable();
            $table->double('real_price')->default(0);
            $table->double('price')->default(0);
            $table->string('unit')->default(null);
            $table->string('slug')->default(null);
            $table->integer('quantity')->default(0);
            $table->boolean('status')->default(true);
            $table->boolean('availability')->default(true);
            $table->boolean('product_source')->default(false);
            $table->unsignedBigInteger('seller_id');
            $table->unsignedBigInteger('subcategory_id');
            $table->unsignedBigInteger('commission_id');
            $table->double('commission_value');
            $table->double('discount')->default(0);
            $table->boolean('discount_status')->default(false);
            $table->timestamps();

            // $table->foreign('seller_id')->references('id')->on('sellers')->onDelete('set null');

            $table->index('name');
            $table->index('slug');
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
