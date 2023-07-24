package com.example.mindlink_celular;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class Login extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        TextView Registrarte = findViewById(R.id.txtRegistrarte);
        Registrarte.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el TextView

                // Intent para redireccionar a la pestaña deseada
                Intent intent = new Intent(Login.this, Registrarse.class);
                startActivity(intent);
            }
        });

        TextView Recorda1 = findViewById(R.id.txtRecordar1);
        Recorda1.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el TextView

                // Intent para redireccionar a la pestaña deseada
                Intent intent = new Intent(Login.this, RecuperarContra1.class);
                startActivity(intent);
            }

        });

    }


}