package com.example.mindlink_celular;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class RecuperarContra1 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recuperar_contra1);

        TextView OtroMetodoDeRecu = findViewById(R.id.txtOtroMetodoDeRecu);
        OtroMetodoDeRecu.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el TextView

                // Intent para redireccionar a la pestaña deseada
                Intent intent = new Intent(RecuperarContra1.this, RecuperarContra2.class);
                startActivity(intent);
            }

        });

        TextView Registrarte = findViewById(R.id.txtRegistrarte1);
        Registrarte.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el TextView

                // Intent para redireccionar a la pestaña deseada
                Intent intent = new Intent(RecuperarContra1.this, Registrarse.class);
                startActivity(intent);
            }
        });

    }
}