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
        Schema::create('categorie', function (Blueprint $table) {
            $table->id(); // Génère la colonne 'id' auto-incrémentée
            $table->string('nom', 500); // La colonne 'nom' avec une longueur de 500 caractères
            $table->string('description', 500)->nullable(); // La colonne 'description', nullable
            $table->timestamps(); // Ajoute 'created_at' et 'updated_at'
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('categorie');
    }
};
