package com.example.clinica_psicologicaa

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import androidx.navigation.ui.AppBarConfiguration

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btn: Button = findViewById(R.id.btnIrLogin)
        btn.setOnClickListener{
            val intent: Intent = Intent(this, Login::class.java)
            startActivity(intent)
        }
        val appBarConfiguration = AppBarConfiguration(setOf(R.id.viewCalendar,R.id.realizarCita,R.id.cerrarSesion,R.id.materiales2,R.id.misNotas))

    }

}
