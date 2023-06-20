package com.example.clinica_psicologicaa

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class Login : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        val btnTextRegister = findViewById<TextView>(R.id.btnRegistrar)

        btnTextRegister.setOnClickListener{
            val intent: Intent = Intent(this, Registrarse::class.java)
            startActivity(intent)
        }

        val btnTextRecordar = findViewById<TextView>(R.id.btnRecordarPassword)

        btnTextRecordar.setOnClickListener{
            val intent: Intent = Intent(this, RecordarPassword::class.java)
            startActivity(intent)
        }
    }

}