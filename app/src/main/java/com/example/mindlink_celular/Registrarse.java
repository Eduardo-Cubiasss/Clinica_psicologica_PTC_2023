package com.example.mindlink_celular;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class Registrarse extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registrarse);

        TextView OiniciarSesion = findViewById(R.id.txtOiniciarSesion);

        OiniciarSesion.setOnClickListener(new View.OnClickListener(){

            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el TextView

                // Intent para redireccionar a la pestaña deseada
                Intent intent = new Intent(Registrarse.this, Login.class);
                startActivity(intent);
            }
        });
    }
}