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
        Schema::create('sellers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->double('latitude')->nullable();
            $table->double('longitude')->nullable();
            $table->boolean('status')->default(true);
            $table->unsignedBigInteger('area_id');
            $table->enum('type', ['internal', 'external']);
            $table->double('discount')->default(0);  
            $table->boolean('discount_status')->default(false); 
            $table->timestamps();

            
            // $table->foreignId('area_id')->constrained('');
            $table->foreign('area_id')->references('id')->on('areas')->onDelete('cascade');
            $table->index('name');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sellers');
    }
};
