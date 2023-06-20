package com.example.clinica_psicologicaa

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class Registrarse : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_registrarse)

        val btnTextOiniciarsesion = findViewById<TextView>(R.id.btnOiniciarsesion)

        btnTextOiniciarsesion.setOnClickListener{
            val intent: Intent = Intent(this, Login::class.java)
            startActivity(intent)
        }
    }
}