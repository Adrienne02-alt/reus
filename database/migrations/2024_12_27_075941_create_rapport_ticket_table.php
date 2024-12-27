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
        Schema::table('rapport_ticket', function (Blueprint $table) {
            $table->id(); // Colonne 'id' auto-incrémentée
            $table->string('ticket'); // Colonne 'ticket' de type string
            $table->text('rapport'); // Colonne 'rapport' de type text
            $table->timestamp('date_rapport')->nullable(); // Colonne 'date_rapport' de type timestamp (nullable)
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
        Schema::dropIfExists('rapport_ticket');
    }
};
