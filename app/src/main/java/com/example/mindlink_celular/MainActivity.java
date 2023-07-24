package com.example.mindlink_celular;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button button = findViewById(R.id.btnIraLogin);

        // Establecer el OnClickListener
        button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                // Este método se ejecutará cuando se haga clic en el botón

                // Crear un Intent para redireccionar al login
                Intent intent = new Intent(MainActivity.this, Login.class);
                startActivity(intent);
            }
        });
    }


}