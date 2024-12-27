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
        Schema::table('utilisateur', function (Blueprint $table) {
            $table->id(); // Colonne 'id' auto-incrémentée
            $table->string('nom'); // Colonne 'nom' de type string
            $table->string('email')->unique(); // Colonne 'email' de type string avec une contrainte d'unicité
            $table->string('mot_de_passe'); // Colonne 'mot_de_passe' de type string
            $table->string('role'); // Colonne 'role' de type string
            $table->timestamp('date_creation')->nullable(); // Colonne 'date_creation' de type timestamp (nullable)
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
        Schema::dropIfExists('utilisateur');
    }
};
