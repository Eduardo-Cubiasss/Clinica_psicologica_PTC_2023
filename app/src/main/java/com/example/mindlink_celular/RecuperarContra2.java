package com.example.mindlink_celular;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

public class RecuperarContra2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recuperar_contra2);

        TextView YaRecordaste = findViewById(R.id.txtYaRecordaste);

        YaRecordaste.setOnClickListener(new View.OnClickListener(){

            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el TextView

                // Intent para redireccionar a la pestaña deseada
                Intent intent = new Intent(RecuperarContra2.this, Login.class);
                startActivity(intent);
            }
        });

        TextView Registrarte2 = findViewById(R.id.txtRegistrarte2);

        Registrarte2.setOnClickListener(new View.OnClickListener(){

            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el TextView

                // Intent para redireccionar a la pestaña deseada
                Intent intent = new Intent(RecuperarContra2.this, Registrarse.class);
                startActivity(intent);
            }
        });
    }
}