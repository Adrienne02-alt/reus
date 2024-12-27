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
        Schema::table('ticket', function (Blueprint $table) {
            $table->id(); // Colonne 'id' auto-incrémentée
            $table->string('titre'); // Colonne 'titre' de type string
            $table->text('description'); // Colonne 'description' de type text
            $table->foreignId('etat')->constrained('etat'); // Colonne 'etat' liée à la table 'etat'
            $table->timestamp('date_creation')->nullable(); // Colonne 'date_creation' de type timestamp
            $table->timestamp('date_deadline')->nullable(); // Colonne 'date_deadline' de type timestamp
            $table->timestamp('date_debut_activite')->nullable(); // Colonne 'date_debut_activite' de type timestamp
            $table->timestamp('date_resolution')->nullable(); // Colonne 'date_resolution' de type timestamp
            $table->foreignId('categorie')->constrained('categorie'); // Colonne 'categorie' liée à la table 'categorie'
            $table->foreignId('priorite')->constrained('priorite'); // Colonne 'priorite' liée à la table 'priorite'
            $table->foreignId('technicien')->constrained('technicien'); // Colonne 'technicien' liée à la table 'technicien'
            $table->foreignId('utilisateur')->constrained('utilisateur'); // Colonne 'utilisateur' liée à la table 'utilisateur'
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
        Schema::dropIfExists('ticket');
    }
};
